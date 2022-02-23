package br.org.generation.lojagames.model;

import java.time.LocalDate;
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

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import io.swagger.annotations.ApiModelProperty;

@Entity
@Table(name = "tb_usuarios")
public class UsuarioModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long idUsuario;

	@NotBlank(message = "Nome. Não pode ficar vazio")
	private String nome;
	
	@ApiModelProperty(example= "email@email.com.br")
	@Email(message = "Email deve ser 'email@email.com.br'")
	private String email;

	@NotBlank(message = "Senha. Não pode ficar vazio")
	@Size(min=8, max=26, message = "Senha. Tamanho entre 8 e 26")
	private String senha;
	
	private String foto;

	@JsonFormat(pattern = "yyyy-MM-dd")
	@NotBlank(message = "DtNasc. Não pode ficar vazio")
	private LocalDate dtNasc;

	
	@OneToMany(mappedBy = "usuario", cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties("usuario")
	private List<ProdutoModel> produto;
	
	public UsuarioModel(long idUsuario, String nome, String email, String senha, String foto, LocalDate dtNasc) {
		
		this.idUsuario = idUsuario;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.foto = foto;
		this.dtNasc = dtNasc;
	}
	
	public UsuarioModel() {
		
	}

	public Long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
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

	public LocalDate getDtNasc() {
		return dtNasc;
	}

	public void setDtNasc(LocalDate dtNasc) {
		this.dtNasc = dtNasc;
	}

	public List<ProdutoModel> getProduto() {
		return produto;
	}

	public void setProduto(List<ProdutoModel> produto) {
		this.produto = produto;
	}
}
