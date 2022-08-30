package br.org.generation.lojagames.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "tb_categorias")
public class CategoriaModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idCategoria;
	
	@NotBlank(message="Tipo. Não pode ficar vazio!")
	@Size(min=3, message="Tipo. Tamanho mínimo 3")
	private String tipoJogo;
	
	@Enumerated(value=EnumType.STRING)
	private PlataformaEnum plataforma;
	
	@OneToMany(mappedBy = "categoria", cascade = CascadeType.ALL)
	@JsonIgnoreProperties("categoria")
	private List<ProdutoModel> produto;

	public Long getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(Long idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getTipoJogo() {
		return tipoJogo;
	}

	public void setTipoJogo(String tipoJogo) {
		this.tipoJogo = tipoJogo;
	}

	public PlataformaEnum getPlataforma() {
		return plataforma;
	}

	public void setPlataforma(PlataformaEnum plataforma) {
		this.plataforma = plataforma;
	}

	public List<ProdutoModel> getProduto() {
		return produto;
	}

	public void setProduto(List<ProdutoModel> produto) {
		this.produto = produto;
	}
}