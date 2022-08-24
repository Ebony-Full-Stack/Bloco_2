create database db_escola;
use db_escola;

create table tb_aluno (
	id_aluno bigint(3) auto_increment,
    nome varchar(30) not null, 
    email varchar(40) not null,
    stt boolean,
    dt_nasc date not null,
    dt_criacao timestamp not null, 
    dt_atualizacao timestamp not null,
    idade int check (idade >= 18), 
	primary key (id_aluno) 
);

/*
alter table nome_da_tabela
...Fazer alterações na estrutura da tabela
   - Adicionar, remover, alterar, renomear e etc
*/

desc tb_alunos;

/*Inserindo uma coluna*/
alter table tb_aluno add turma char(2) after dt_nasc;

# Inserindo uma coluna como chave primaria

/* Inserindo uma coluna como chave estrangeira
alter table tb_alunosadd foreign key (nomeatributo)
references tabela1(nomechaveprimaria)
*/

# removendo uma coluna
alter table tb_aluno drop column turma;

# mudando restrições
alter table tb_aluno modify column nome varchar(255) not null;

# mudando o nome da coluna
ALTER TABLE tb_aluno CHANGE nome nome_completo varchar(200) not null;

# mudando nome da tabela
rename table tb_aluno to tb_alunos;

/*Inserindo em produto, um campo preço*/
alter table Produto add preco float;


insert into tb_alunos (nome_completo, email, stt, dt_nasc, dt_criacao, dt_atualizacao) values 
("Ebony", "ebony@ebonysys.net", true,"1990-11-01", current_date(), current_timestamp()),
("Zeca Brito", "zecabrito@gmail.com", true,"2000-10-02",current_date(), current_timestamp()),
("Pedro Pedra", "pedreira@gmail.com", false,"2015-05-03",current_date(), current_timestamp()),
("Ana Cana", "anacana@gmail.com", true,"1980-04-12",current_date(), current_timestamp()),
("João Leão", "leao@gmail.com", false,"1994-12-26",current_date(), current_timestamp()),
("Joana Batata", "frita@gmail.com", true,"1999-04-17",current_date(), current_timestamp());

# consultas com datas
select nome as Nome, date_format(dt_nasc, "%d/%m/%y") as `Data de nascimento`
from tb_usuario;

select curdate();

select nome, dt_nasc from tb_usuario;

select nome, date_format(dt_nasc, "%d | %m | %Y") as 'Data de nascimento' from tb_usuario;

select
nome_completo, 
date_format(dt_nasc,"%d | %m | %Y") as `Data de Nascimento`,
timestampdiff(year, dt_nasc, now()) as 'Idade',
datediff(curdate(), dt_nasc) as `Dias de vida`,
date_format(curdate(), "%d/%m/%y") as Hoje,
date_format(dt_criacao, "%D • %M • %Y") as `Criado em:`,
date_format(dt_atualizacao, "%d * %m * %y") as `Atualizado em:`from tb_alunos;







