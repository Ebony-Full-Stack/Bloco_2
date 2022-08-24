create database db_teste;  # Criando um banco de dados da forma mais simples

use db_teste; # Indicando qual banco vamos manipular

create table Pessoas(          # Criando uma tabela chamada Pessoas
	nome varchar(30),          # Atributo Nome, indicando que receberá um texto de até 30 caracteres
    idade int,				   # Atributo Idade, indicando que receberá um valor inteiro
    endereco varchar(255)      # Atributo Endereço, indicando que receberá um texto de até 255 caracteres
);

desc pessoas;                  # Assim como o describe, trazem uma visão da estrutura da tabela 
describe pessoas;
select * from pessoas;         # Selecionamos todos os valores que estão na tabela pessoa

insert into pessoas (nome, idade, endereco)   # Inserindo valores nos campos da tabela pessoa
values ("Leonardo", 30, "Rua das Coves");     # A ordem de inserção deve ser respeitada

insert into pessoas values
("Juca", 50, "Rua das Mangas"),
("Maria", 90, "Rua das Uvas");

select * from pessoas;

update pessoas set idade = 20 where nome = "Leonardo";  # Alterando a idade na linha onde o nome é Leonardo

# Alteramos o nome das colunas que serão apresentadas. 
select nome as "Nome do Aluno", idade as "Idade do Aluno" from pessoas;

# Selecionamos apenas nome e idade dos alunos cujo os nomes iniciam com M
select nome as "Nome do Aluno", idade as "Idade do Aluno" from pessoas
where nome like "M%";            

# Selecionamos apenas nome e idade dos alunos cujo os nomes terminam com M
select nome as "Nome do Aluno", idade as "Idade do Aluno" from pessoas
where nome like "%M";            

# Selecionamos apenas nome e idade dos alunos cujo os nomes contenham a letra M
select nome as "Nome do Aluno", idade as "Idade do Aluno" from pessoas
where nome like "%M%";            

# Selecionamos apenas nome e idade dos alunos onde a idade é maior que 50
select nome as "Nome do Aluno", idade as "Idade do Aluno" from pessoas
where idade > 50;            

# Selecionamos apenas nome e idade dos alunos onde a idade é menor ou igual a 50
select nome as "Nome do Aluno", idade as "Idade do Aluno" from pessoas
where idade <= 50;            

# Selecionamos apenas nome e idade dos alunos onde a idade é diferente de 50
select nome as "Nome do Aluno", idade as "Idade do Aluno" from pessoas
where idade <> 50;            

# Selecionamos apenas nome e idade dos alunos onde a idade é menor que 50 e nome inicia com L
select nome as "Nome do Aluno", idade as "Idade do Aluno" from pessoas
where idade > 50 and nome like "L%";            
























