package br.org.generation.lojagames.service;

import java.nio.charset.Charset;
import java.time.LocalDate;
import java.time.Period;
import java.util.Optional;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import br.org.generation.lojagames.model.UsuarioModel;
import br.org.generation.lojagames.model.UsuarioLogin;
import br.org.generation.lojagames.repository.UsuarioRepository;

@Service
public class UsuarioService {

	@Autowired
	private UsuarioRepository usuarioRepository;

	
	public Optional<UsuarioModel> cadastrarUsuario(UsuarioModel usuario) {

		if (usuarioRepository.findByUsuario(usuario.getEmail()).isPresent())
			return Optional.empty();

		if (calcularIdade(usuario.getDtNasc()) < 18)
			throw new ResponseStatusException(
					HttpStatus.BAD_REQUEST, "Usuário é menor de 18 anos", null);

		usuario.setSenha(criptografarSenha(usuario.getSenha()));

		return Optional.ofNullable(usuarioRepository.save(usuario));
	}

	
	
	public Optional<UsuarioModel> atualizarUsuario(UsuarioModel usuario) {
		if(usuarioRepository.findById(usuario.getIdUsuario()).isPresent()) {
			
			Optional<UsuarioModel> buscaUsuario = usuarioRepository.findByUsuario(usuario.getEmail());
			
			if ( (buscaUsuario.isPresent()) && ( buscaUsuario.get().getIdUsuario() != usuario.getIdUsuario()))
				throw new ResponseStatusException(
						HttpStatus.BAD_REQUEST, "Usuário já existe!", null);
			
			if (calcularIdade(usuario.getDtNasc()) < 18)
				throw new ResponseStatusException(
						HttpStatus.BAD_REQUEST, "Usuário é menor de 18 anos", null);
			
			usuario.setSenha(criptografarSenha(usuario.getSenha()));

			return Optional.ofNullable(usuarioRepository.save(usuario));
		}
			return Optional.empty();
	}

	
	public Optional<UsuarioLogin> autenticarUsuario(Optional<UsuarioLogin> usuarioLogin){
		
		Optional<UsuarioModel> buscaUsuario = usuarioRepository.findByUsuario(usuarioLogin.get().getEmail());
		
		if(buscaUsuario.isPresent()) {
			
			if( compararSenhas(usuarioLogin.get().getSenha(), buscaUsuario.get().getSenha()) ) {
				
				usuarioLogin.get().setIdUsuario(buscaUsuario.get().getIdUsuario());
				usuarioLogin.get().setNome(buscaUsuario.get().getNome());
				usuarioLogin.get().setFoto(buscaUsuario.get().getFoto());
				usuarioLogin.get().setDtNasc(buscaUsuario.get().getDtNasc());
				usuarioLogin.get().setToken(gerarBasicToken(usuarioLogin.get().getEmail(), usuarioLogin.get().getSenha()));
				usuarioLogin.get().setSenha(buscaUsuario.get().getSenha());
				
				return usuarioLogin;
			}
		}
		return Optional.empty();
	}
	
	
	private int calcularIdade(LocalDate dataNascimento) {
		return Period.between(dataNascimento, LocalDate.now()).getYears();
	}

	
	private String criptografarSenha(String senha) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		return encoder.encode(senha);
	}
	
	
	private boolean compararSenhas(String senhaDigitada, String senhaBanco) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		return encoder.matches(senhaDigitada, senhaBanco);
	}
	
	
	private String gerarBasicToken(String email, String senha) {
		
		String token = email + ":" + senha;
		byte[] tokenBase64 = Base64.encodeBase64(token.getBytes(Charset.forName("US-ASCII"))); 
		
		return "Basic " + new String(tokenBase64);
	}
}
