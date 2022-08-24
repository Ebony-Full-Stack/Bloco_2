create database db_escola_do_ebony
default CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

use db_escola_do_ebony;

create table tb_alunos (
	id_aluno BIGINT AUTO_INCREMENT,
    nome varchar(30) not null,
    cpf char(11),
	
    PRIMARY KEY (id_aluno)
) default charset = utf8mb4;

create table tb_disciplinas (
	id_disciplina BIGINT AUTO_INCREMENT,
    nome_disciplina varchar(40) not null unique,

	PRIMARY KEY (id_disciplina)
) default charset = utf8mb4;

create table tb_matricula (
	id_matricula BIGINT AUTO_INCREMENT,
    dt_matricula TIMESTAMP,
    dt_atualizacao TIMESTAMP,
    fk_aluno bigint,
    fk_disciplina bigint,
    -- essa tabela foi criada para gerir o relacionamento
    -- por isto, ela recebe como chave estrageira, as chaves primarias das outras duas. 
    PRIMARY KEY (id_matricula),
    FOREIGN KEY (fk_aluno) REFERENCES tb_alunos(id_aluno),
    FOREIGN KEY (fk_disciplina) REFERENCES tb_disciplinas(id_disciplina)
    
) default charset = utf8mb4;

insert into tb_alunos values
(default, 'Joaquim Costa', '11111111111'),
(default, 'Ebony Alves', '22222222222'),
(default, 'Maria Mares', '33333333333'),
(default, 'Alberto Antunes', '44444444444'),
(default, 'Ana Salgado', '55555555555');


insert into tb_disciplinas values 
(default, 'Matemática'),
(default, 'Português'),
(default, 'Ciências'),
(default, 'História'),
(default, 'Física'),
(default, 'Educação Física'),
(default, 'Biologia'),
(default, 'Química');

insert into tb_matricula values
(default, current_timestamp, current_timestamp(),1, 1),
(default, current_timestamp, current_timestamp(),1, 2),
(default, current_timestamp, current_timestamp(),1, 3),
(default, current_timestamp, current_timestamp(),1, 4),
(default, current_timestamp, current_timestamp(),1, 5),

(default, current_timestamp, current_timestamp(),2, 4),
(default, current_timestamp, current_timestamp(),2, 2),
(default, current_timestamp, current_timestamp(),2, 7),
(default, current_timestamp, current_timestamp(),2, 8),
(default, current_timestamp, current_timestamp(),2, 5),

(default, current_timestamp, current_timestamp(),3, 4),
(default, current_timestamp, current_timestamp(),3, 2),
(default, current_timestamp, current_timestamp(),3, 3),
(default, current_timestamp, current_timestamp(),3, 8),
(default, current_timestamp, current_timestamp(),3, 6),

(default, current_timestamp, current_timestamp(),4, 8),
(default, current_timestamp, current_timestamp(),4, 7),
(default, current_timestamp, current_timestamp(),4, 6),
(default, current_timestamp, current_timestamp(),4, 4),
(default, current_timestamp, current_timestamp(),4, 5),

(default, current_timestamp, current_timestamp(),5, 8),
(default, current_timestamp, current_timestamp(),5, 2),
(default, current_timestamp, current_timestamp(),5, 3),
(default, current_timestamp, current_timestamp(),5, 4),
(default, current_timestamp, current_timestamp(),5, 5);

select * from tb_alunos;
select * from tb_disciplinas order by id_disciplina;
select * from tb_matricula;

select tb_alunos.nome, tb_disciplinas.nome_disciplina, tb_matricula.dt_matricula
from tb_alunos
-- indicando o primeiro relacionamento entre alunos e matriculas
inner join tb_matricula
on tb_alunos.id_aluno = tb_matricula.fk_aluno
-- indicando o segundo relacionamento entre disciplinas e matricula
inner join tb_disciplinas
on tb_disciplinas.id_disciplina = tb_matricula.fk_disciplina;




























