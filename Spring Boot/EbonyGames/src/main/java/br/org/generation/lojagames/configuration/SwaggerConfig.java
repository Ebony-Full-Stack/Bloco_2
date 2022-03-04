package br.org.generation.lojagames.configuration;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.builders.ResponseBuilder;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.Response;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;



@Configuration
public class SwaggerConfig {
	
	@Bean
	public Docket api() {
		return new Docket (DocumentationType.SWAGGER_2)
				.select()
				.apis(RequestHandlerSelectors
						.basePackage("br.org.generation.lojagames.controller"))
				.paths(PathSelectors.any())
				.build()
				.apiInfo(metadata())
				.useDefaultResponseMessages(false)
				.globalResponses(HttpMethod.GET, responseMessage())
				.globalResponses(HttpMethod.POST, responseMessage())
				.globalResponses(HttpMethod.PUT, responseMessage())
				.globalResponses(HttpMethod.DELETE, responseMessage());
	}
	
	public static ApiInfo metadata() {
		return new ApiInfoBuilder()
				.title("Ebony Games")
				.description("Loja de Games")
				.version("0.0.1")
				.license("Apache License Version 2.0")
				.licenseUrl("https://github.com/Leon4rdoalves")
				.contact(contact())
				.build();
	}
	
	private static Contact contact() {
		return new Contact("Leonardo Alves",  
				"leon4rdoalvess@gmail.com", null);
	}
	
	private static List <Response> responseMessage() {
		return new ArrayList<Response>() {
			
			private static final long serialVersionUID = 1L;
			{
				add(new ResponseBuilder().code("200").description("Sucesso nenem!").build());
				add(new ResponseBuilder().code("201").description("Objeto Criado!").build());
				add(new ResponseBuilder().code("401").description("Vc não tem autorização!").build());
				add(new ResponseBuilder().code("403").description("Proibido, corra!!").build());
				add(new ResponseBuilder().code("404").description("Cadê saporra?!").build());
				add(new ResponseBuilder().code("500").description("Vish, fez merda aí no server!").build());
			}
		};
		
	}
}
