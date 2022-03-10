package br.org.generation.BlogPessoal.configuration;


import org.springdoc.core.customizers.OpenApiCustomiser;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.responses.ApiResponse;
import io.swagger.v3.oas.models.responses.ApiResponses;

@Configuration
public class SwaggerConfig {

	@Bean
	public OpenAPI springBlogPessoalOpenAPI() {
		return new OpenAPI()
				.info(new Info()
					.title("Ebony Blog")
					.description("Blog Pessoal * EbonySyS")
					.version("v1.0.0")
				
				.license(new License()
					.name("Linkedin")
					.url("https://www.linkedin.com/in/leonardo-alves-7b5aa5152/"))
				
				.contact(new Contact()
					.name("by leonardo@ebonysys.or.y")
					.email("leon4rdoalvess@gmail.com")))
				
				.externalDocs(new ExternalDocumentation()
					
					.description("GitHub")
					.url("https://github.com/Ebony-Full-Stack/Bloco_2/tree/main/Spring%20Boot/EbonyBlog"));
	}

	@Bean
	public OpenApiCustomiser customerGlobalHeaderOpenApiCustomiser() {

		return openApi -> {
			openApi.getPaths().values().forEach(pathItem -> pathItem.readOperations().forEach(operation -> {

				ApiResponses apiResponses = operation.getResponses();

				apiResponses.addApiResponse("200", createApiResponse("Sucesso nenem!"));
				apiResponses.addApiResponse("201", createApiResponse("Tá criado meu consagrado!"));
				apiResponses.addApiResponse("204", createApiResponse("Relaxa, já foi excluído!"));
				apiResponses.addApiResponse("400", createApiResponse("Vish, deu merda na requisição!"));
				apiResponses.addApiResponse("401", createApiResponse("Vaza que tu não tem autorização!"));
				apiResponses.addApiResponse("404", createApiResponse("Cadê saporra?!"));
				apiResponses.addApiResponse("500", createApiResponse("Deu merda lá no server tio!"));

			}));
		};
	}

	private ApiResponse createApiResponse(String message) {
		return new ApiResponse().description(message);
	}
}

/*
 * @Bean public Docket api() { return new Docket (DocumentationType.SWAGGER_2)
 * .select() .apis(RequestHandlerSelectors
 * .basePackage("br.org.generation.BlogPessoal.controller"))
 * .paths(PathSelectors.any()) .build() .apiInfo(metadata())
 * .useDefaultResponseMessages(false) .globalResponses(HttpMethod.GET,
 * responseMessage()) .globalResponses(HttpMethod.POST, responseMessage())
 * .globalResponses(HttpMethod.PUT, responseMessage())
 * .globalResponses(HttpMethod.DELETE, responseMessage()); }
 * 
 * 
 * 
 * public static ApiInfo metadata() { return new ApiInfoBuilder()
 * .title("API - Ebony Blog") .description("Projeto API * Blog Pessoal")
 * .version("1.0.0") .license("Apache License Version 2.0")
 * .licenseUrl("https://github.com/Leon4rdoalves") .contact(contact()) .build();
 * }
 * 
 * private static Contact contact() { return new Contact("Leonardo Alves",
 * "leonardo@ebonysys.or.y", null); }
 * 
 * private static List <Response> responseMessage() { return new
 * ArrayList<Response>() {
 * 
 * private static final long serialVersionUID = 1L; { add(new
 * ResponseBuilder().code("200").description("Sucesso nenem!").build()); add(new
 * ResponseBuilder().code("201").description("Objeto Criado!").build()); add(new
 * ResponseBuilder().code("401").description("Vc não tem autorização jão!").
 * build()); add(new
 * ResponseBuilder().code("403").description("Proibido, corra!!").build());
 * add(new ResponseBuilder().code("404").description("Cadê saporra?!").build());
 * add(new
 * ResponseBuilder().code("500").description("Vish, fez merda aí no server né!")
 * .build()); } }; } }
 */