create database db_cadastro
default character set utf8mb4         # diferente do exemplo anterior, aqui   
default collate utf8mb4_general_ci;   # estamos setando o padrão de caracteres

use db_cadastro;

create table tb_pessoas(
	nome varchar(45),         
    cpf int(11),              
	idade int,                  
    altura decimal(3,2) 
)default charset = utf8mb4;         # Uma vez setado o padrão de caracteres, 
									# é necessário que se faça em cada tabela3

desc tb_pessoas;          # Estes comandos retornam uma descrição       
describe tb_pessoas;      # da sua tabela.

                                    