package com.ebony.Farma.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ebony.Farma.model.ProdutoModel;

@Repository
public interface ProdutoRepository extends JpaRepository<ProdutoModel, Long> {

	public List<ProdutoModel> findAllByNomeContainingIgnoreCase(String nome);
	
}
