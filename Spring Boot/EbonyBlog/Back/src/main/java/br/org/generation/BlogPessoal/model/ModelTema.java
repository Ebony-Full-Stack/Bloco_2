package br.org.generation.BlogPessoal.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "tb_tema")

public class ModelTema {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id_tema;
	
	@NotNull
	@Size(max=120, message="Titulo tem tamanho máximo de 120 c")
	private String titulo;
	
	@NotNull
	@Size(max=255, message="Descrição tem tamanho máximo de 255 c")
	private String descricao;

	@OneToMany(mappedBy = "tema", cascade = CascadeType.ALL)
	@JsonIgnoreProperties("tema")
	private List<ModelPostagem> postagem;

	public long getId_tema() {
		return id_tema;
	}

	public void setId_tema(long id_tema) {
		this.id_tema = id_tema;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public List<ModelPostagem> getPostagem() {
		return postagem;
	}

	public void setPostagem(List<ModelPostagem> postagem) {
		this.postagem = postagem;
	}
}