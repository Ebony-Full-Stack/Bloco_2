package br.org.generation.BlogPessoal.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Optional;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import br.org.generation.BlogPessoal.model.Usuario;
import br.org.generation.BlogPessoal.service.UsuarioService;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UsuarioControllerTest {

	@Autowired
	private TestRestTemplate testRestTemplate;

	@Autowired
	private UsuarioService usuarioService;

	@Test
	@Order(1)
	@DisplayName("Cadastrar Um Usuário")
	public void deveCriarUmUsuario() {

		HttpEntity<Usuario> requisicao = new HttpEntity<Usuario>(new Usuario(0L, 
			"Leonardo Alves", "leon4rdoalves@ebonysys.or.y", "leonardo123"));

		ResponseEntity<Usuario> resposta = testRestTemplate
			.exchange("/usuarios/cadastrar", HttpMethod.POST, requisicao, Usuario.class);

		assertEquals(HttpStatus.CREATED, resposta.getStatusCode());
		assertEquals(requisicao.getBody().getNome(), resposta.getBody().getNome());
		assertEquals(requisicao.getBody().getEmail(), resposta.getBody().getEmail());
	}

	@Test
	@Order(2)
	@DisplayName("Sem duplicação de Usuário")
	public void naoDeveDuplicarUsuario() {

		usuarioService.cadastrarUsuario(new Usuario(0L, 
			"Maria", "maria@email.com.br", "13465278"));

		HttpEntity<Usuario> requisicao = new HttpEntity<Usuario>(new Usuario(0L, 
			"Maria", "maria@email.com.br", "13465278"));

		ResponseEntity<Usuario> resposta = testRestTemplate
			.exchange("/usuarios/cadastrar", HttpMethod.POST, requisicao, Usuario.class);

		assertEquals(HttpStatus.BAD_REQUEST, resposta.getStatusCode());
	}

	@Test
	@Order(3)
	@DisplayName("Alterar um Usuário")
	public void deveAtualizarUmUsuario() {

		Optional<Usuario> usuarioCreate = usuarioService.cadastrarUsuario(new Usuario(0L, 
			"Jubileu Antunes", "jujuanan@email.com.br", "jubileu123"));

		Usuario usuarioUpdate = new Usuario(usuarioCreate.get().getId_usuario(), 
			"Jubileu jubilai", "jujuanan@email.com.br", "jubileu123");
		
		HttpEntity<Usuario> requisicao = new HttpEntity<Usuario>(usuarioUpdate);

		ResponseEntity<Usuario> resposta = testRestTemplate
			.withBasicAuth("root", "root")
			.exchange("/usuarios/atualizar", HttpMethod.PUT, requisicao, Usuario.class);

		assertEquals(HttpStatus.OK, resposta.getStatusCode());
		assertEquals(usuarioUpdate.getNome(), resposta.getBody().getNome());
		assertEquals(usuarioUpdate.getEmail(), resposta.getBody().getEmail());
	}

	@Test
	@Order(4)
	@DisplayName("Listar todos os Usuários")
	public void deveMostrarTodosUsuarios() {

		usuarioService.cadastrarUsuario(new Usuario(0L, 
			"Ebony Alves", "ebonyalves@ebonysys.or.y", "ebony123"));
		
		usuarioService.cadastrarUsuario(new Usuario(0L, 
			"Jubileu Jubilai", "Jubileu@gmail.com.br", "jubilai123"));

		ResponseEntity<String> resposta = testRestTemplate
			.withBasicAuth("root", "root")
			.exchange("/usuarios/all", HttpMethod.GET, null, String.class);

		assertEquals(HttpStatus.OK, resposta.getStatusCode());
	}

}