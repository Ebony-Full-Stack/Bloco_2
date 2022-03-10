package br.org.generation.BlogPessoal.repository;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;

import br.org.generation.BlogPessoal.model.Usuario;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class UsuarioRepositoryTest {
    
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@BeforeAll
	void start(){

		usuarioRepository.save(new Usuario(0L, "Juca Silva Pedra", "joao@email.com.br", "13465278"));		
		usuarioRepository.save(new Usuario(0L, "João Pé de Feijão Silva", "joao@email.com.br", "13465278"));		
		usuarioRepository.save(new Usuario(0L, "Ana Banana Silva", "ana@email.com.br", "13465278"));
        usuarioRepository.save(new Usuario(0L, "Pedro Pedra", "pedro@email.com.br", "13465278"));

	}

	@Test
	@DisplayName("Retorna 1 usuario")
	public void deveRetornarUmUsuario() {

		Optional<Usuario> usuario = usuarioRepository.findByEmail("joao@email.com.br");
		assertTrue(usuario.get().getEmail().equals("joao@email.com.br"));
	}

	@Test
	@DisplayName("Retorna 3 usuarios")
	public void deveRetornarTresUsuarios() {

		List<Usuario> listaDeUsuarios = usuarioRepository.findAllByNomeContainingIgnoreCase("Silva");
		assertEquals(3, listaDeUsuarios.size());
		assertTrue(listaDeUsuarios.get(0).getNome().equals("João Pé de Feijão Silva"));
		assertTrue(listaDeUsuarios.get(1).getNome().equals("Juca Silva Pedra"));
		assertTrue(listaDeUsuarios.get(2).getNome().equals("Ana Banana Silva"));
		
	}
}