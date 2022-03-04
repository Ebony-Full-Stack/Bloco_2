package com.ebony.Farma.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="tb_produto")
public class ProdutoModel {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id_produto;
	
	@NotBlank(message="Nome não pode ficar vazio")
	@Size(max=150, message="O nome não pode ter mais que 150 c")
	private String nome;
	
	@NotBlank(message="Descrição não pode ficar vazio")
	@Size(max=255, message="A descrição não pode ter mais que 255 c")
	private String descricao;
	
	
	//@JsonFormat(shape = JsonFormat.Shape.STRING)
	
	@Positive(message = "Preço. Valor maior que zero sempre")
	@NotBlank(message="Preço não pode ficar vazio")
	private double preco;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date dtCadastro = new java.sql.Date(System.currentTimeMillis());

	public long getId_produto() {
		return id_produto;
	}

	public void setId_produto(long id_produto) {
		this.id_produto = id_produto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public Date getDtCadastro() {
		return dtCadastro;
	}

	public void setDtCadastro(Date dtCadastro) {
		this.dtCadastro = dtCadastro;
	}

	
	
	//---
	
	
	
	
	
	/*
	@ManyToOne
	@JsonIgnoreProperties("produto")
	private CategoriaModel categoria;

	@ManyToOne
	@JsonIgnoreProperties("produto")
	private UsuarioModel usuario;
	*/
	
	
}




  
  
 
