select * from tb_alunos;
select * from tb_turmas;

select * from tb_alunos inner join tb_turmas  
on tb_turmas.id_turma = tb_alunos.fk_turma; 

-- select n count(n) as "n"
-- from tb_n
-- groub by n
-- having count(n) > 10;

# Retorne nome, idade de cada aluno e data que o cadastro foi feito.
select nome_aluno as "Nome",
timestampdiff(year, dt_nasc_aluno, now()) as "Idade",
date_format(dt_cad_aluno, "%d/%m/%y") as "Dt Cadastro"
from tb_alunos order by nome_aluno;


# Retorne curso e data de cadastro. 
select cursos, 
date_format(dt_cad_turma, "%d • %m • %y") as "Dt Cadastro"
from tb_turmas order by cursos;


# Retorne todos os alunos com idade entre 18 e 30 anos. 
select nome_aluno, timestampdiff(year, dt_nasc_aluno, now()) from tb_alunos
where timestampdiff(year, dt_nasc_aluno, now()) 
between 18 and 30
order by nome_aluno;

# Retorne todos os valores das duas tabelas ao mesmo tempo. 
# Retorne nome do aluno, calcule sua idade, data de nascimento e curso matriculado. 


# Retorne quantos alunos foram matriculados em python que tenham idade entre 18 e 30 anos.
 
# Retorne os nomes dos alunos matriculados em banco de dados com idade entre 18 e 30 anos. 
select tb_alunos.nome_aluno
from tb_alunos inner join tb_turmas
on tb_turmas.id_turma = tb_alunos.fk_turma 
where timestampdiff(year, tb_alunos.dt_nasc_aluno, now()) 
between 18 and 30 and tb_turmas.cursos = "Banco de dados"
order by tb_alunos.nome_aluno;


# Retorne o total de alunos matriculados em cada curso, quantos faltam para completar 
# cada turma e quantos porcentos isso representa do total.
select tb_turmas.cursos, count(tb_turmas.cursos) as "Matriculados", 
tb_turmas.qtd_alunos_turma - count(tb_turmas.cursos) as "Restam",
count(tb_turmas.cursos) * 100 / tb_turmas.qtd_alunos_turma as "%"
from tb_alunos inner join tb_turmas
on tb_turmas.id_turma = tb_alunos.fk_turma
group by (tb_turmas.cursos);


# Retorne nome e curso matriculado de cada aluno e a data de matricula. 




