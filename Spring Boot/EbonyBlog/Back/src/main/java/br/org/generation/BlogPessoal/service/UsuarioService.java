package br.org.generation.BlogPessoal.service;

import java.nio.charset.Charset;
import java.util.Optional;

import org.apache.commons.codec.binary.Base64; //precisa digitar manualmente referente ao cammons-codec
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import br.org.generation.BlogPessoal.model.UserLogin;
import br.org.generation.BlogPessoal.model.Usuario;
import br.org.generation.BlogPessoal.repository.UsuarioRepository;

@Service
public class UsuarioService {

	private String criptografarSenha(String senha) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.encode(senha);
	}

	private boolean compararSenhas(String senhaDigitada, String senhaBanco) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(senhaDigitada, senhaBanco);
	}

	private String gerarBasicToken(String email, String password) {
		String tokenBase = email + ":" + password;
		byte[] tokenBase64 = Base64.encodeBase64(tokenBase.getBytes(Charset.forName("US-ASCII")));
		return "Basic " + new String(tokenBase64);
	}

	@Autowired
	private UsuarioRepository repository;

	public Optional<Usuario> cadastrarUsuario(Usuario usuario) {

		if (repository.findByEmail(usuario.getEmail()).isPresent())
			return Optional.empty();

		usuario.setSenha(criptografarSenha(usuario.getSenha()));
		return Optional.of(repository.save(usuario));
	}

	
	
	public Optional<Usuario> atualizarUsuario(Usuario usuario) {

		if (repository.findById(usuario.getId_usuario()).isPresent()) {

			Optional<Usuario> buscaUsuario = repository.findByEmail(usuario.getEmail());

			if (buscaUsuario.isPresent()) {

				if (buscaUsuario.get().getId_usuario() != usuario.getId_usuario())
					return Optional.empty();
			}
			usuario.setSenha(criptografarSenha(usuario.getSenha()));
			return Optional.of(repository.save(usuario));
		}

		return Optional.empty();
	}
	
	

	public Optional<UserLogin> autenticarUsuario(Optional<UserLogin> userLogin) {

		Optional<Usuario> usuario = repository.findByEmail(userLogin.get().getEmail());

		if (usuario.isPresent()) {
			if (compararSenhas(userLogin.get().getSenha(), usuario.get().getSenha())) {

				String token = gerarBasicToken(userLogin.get().getEmail(), userLogin.get().getSenha());
				userLogin.get().setId(usuario.get().getId_usuario());
				userLogin.get().setNome(usuario.get().getNome());
				userLogin.get().setSenha(usuario.get().getSenha());
				userLogin.get().setFoto(usuario.get().getFoto());
				userLogin.get().setTipoUser(usuario.get().getTipo());
				userLogin.get().setToken(token);

				return userLogin;
			}
		}

		return Optional.empty();
	}
}