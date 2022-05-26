package com.ebonysys.exe01.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class Atividade01 {

	@GetMapping("/hello")
	public String helloworld() {
		return "Hello World";
	}
	
	@GetMapping("/bsm")
	public String bsm() {
		return "<b><i>HABILIDADES</i></b></br>"
				+ "- Trabalho em Equipe</br>- Atenção aos Detalhes</br>"
				+ "- Proatividade</br>- Comunicação</br>"
				+ "</br><b><i>MENTALIDADES</i></b></br>"
				+ "- Orientação ao Detalhe</br>- Responsabilidade Pessoal"
				+ "</br>- Mentalidade de Crescimento</br>- Persistência";
	}
	
	@GetMapping("/objetivos")
	public String objetivos() {
		return "<b>OBJETIVOS DE APRENDIZAGEM DESTA SEMANA</b></br>"
				+ "* Go</br>* Ruby";
	}
	
}
