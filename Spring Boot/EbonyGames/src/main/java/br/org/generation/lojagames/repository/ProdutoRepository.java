package br.org.generation.lojagames.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.org.generation.lojagames.model.ProdutoModel;

public interface ProdutoRepository extends JpaRepository<ProdutoModel, Long>{
	
	public List<ProdutoModel> findAllByNomeContainingIgnoreCase(String nome);
	
	
	// MySQL: select * from tb_produtos where preco > preco order by preco; 
	public List <ProdutoModel> findByPrecoGreaterThanOrderByPreco(BigDecimal preco);
	  
	// MySQL: select * from tb_produtos where preco < preco order by preco desc;
	public List <ProdutoModel> findByPrecoLessThanOrderByPrecoDesc(BigDecimal preco);
	
}