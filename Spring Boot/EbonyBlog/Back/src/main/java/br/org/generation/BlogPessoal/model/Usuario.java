package br.org.generation.BlogPessoal.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import io.swagger.v3.oas.annotations.media.Schema;


@Entity
@Table(name = "tb_usuario")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id_usuario;

	@NotBlank
	@Size(min = 2, max = 100)
	private String nome;
	
	@Schema(example = "email@email.com.br")
	@NotBlank(message = "O atributo usuário é obrigatório!")
	@Email(message = "O formato do usuário é e-mail.")
	private String email;

	@NotBlank
	@Size(min=8)
	private String senha;
	
	private String foto;
	
	private String tipo;

	@OneToMany (mappedBy = "usuario", cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties ("usuario")
	private List<ModelPostagem> postagem;
	
	public Usuario(long idUsuario, String nome, String usuario, String senha) {
		
		this.id_usuario = id_usuario;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
	}
	
	public Usuario() {
		
	}

	public long getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(long id_usuario) {
		this.id_usuario = id_usuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public List<ModelPostagem> getPostagem() {
		return postagem;
	}

	public void setPostagem(List<ModelPostagem> postagem) {
		this.postagem = postagem;
	}		
		
	
}
