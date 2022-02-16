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

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "tb_tema")

public class ModelTema {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id_tema;

	@NotNull
	private String descricao;

	@OneToMany(mappedBy = "tema", cascade = CascadeType.ALL)
	@JsonIgnoreProperties("tema")
	private List<ModelPostagem> postagem;


	public long getIdTema() {
		return id_tema;
	}

	public void setIdTema(long idTema) {
		this.id_tema = idTema;
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