create database db_escola default character set utf8mb4 default collate utf8mb4_general_ci;
use db_escola;

create table tb_turmas (
	id_turma bigint(2) auto_increment,
    qtd_alunos_turma varchar(30) not null,
    cursos enum("Python", "Banco de dados", "Java"),
    dt_cad_turma timestamp,
    primary key(id_turma)  
)default charset = utf8mb4; 

insert into tb_turmas values
(default, 40, "Python", current_timestamp()),   # current_timestamp() -> retorna a hora e data atual
(default, 40, "Banco de dados", current_timestamp()),
(default, 40, "Java", current_timestamp());

select * from tb_turmas;

create table tb_alunos (
	id_aluno bigint auto_increment,
    nome_aluno varchar(30) not null,
    dt_nasc_aluno date not null,
    cpf_aluno char(11) not null unique,
    tel_aluno varchar(15) not null,	
    email_aluno varchar(30) not null unique,
    dt_cad_aluno timestamp,
	fk_turma bigint(2),                      # esta coluna foi criada para ser a chave estrangeira. 
											 # lembrando que a chave estranjeiro nada mais é do que uma chave primária vinda de outra tabela					
    primary key (id_aluno),
    foreign key (fk_turma) references tb_turmas(id_turma)  
   # chave estrangeira (coluna desta tabela que será usada) REFERENCES tabela de onde a chave primária virá (nome da chave primária)
) default charset = utf8mb4;

insert into tb_alunos values              # O valor da chave deve ser preenchido de acordo o id dela, caso não, o valor null deve ocupar o lugar.
(default, "Leonardo", "1990-11-01", "15364852614", "11979714423", "leonardo@ebonysys.or", current_timestamp(), 1),
(default, "Priscila", "2000-10-20", "12345678987", "11998877665", "priscila@email.com", current_timestamp(), 2),
(default, "Matheus", "1999-05-18", "12121212121", "11993322558", "Matheus@email.com", current_timestamp(), 3),
(default, "Priscila", "2000-10-21", "45645645645", "119442244224", "priscilacosta@email.com", current_timestamp(), 2),
(default, "Jubileu", "1995-02-23", "98798798754", "11922552252", "jubileu@email.com", current_timestamp(), null),
(default, "Leandro", "2014-10-13", "55557777854", "11121218888", "leandro@ebonysys.or", current_timestamp(), 1),
(default, "Sebastiana", "1973-06-16", "33366688845", "119228866669", "bastiana@email.com", current_timestamp(), null),
(default, "Marieta", "2005-04-21", "11125696325", "11955578458", "matietata@email.com", current_timestamp(), 3),
(default, "Globelda", "2001-03-29", "88125694852", "1133332222", "gloglo@email.com", current_timestamp(), 2),
(default, "Beto Pedro", "1952-12-24", "11122233322", "11945454547", "betopedrao@email.com", current_timestamp(), 1),
(default, "Ana Banana", "1994-02-15", "13366555589", "119797979797", "banana@email.com", current_timestamp(), 2),
(default, "Rafaela Bela", "2010-07-14", "12444678987", "11990077065", "belarafa@email.com", current_timestamp(), null),
(default, "Fernando Canto", "1989-08-08", "12100002121", "11990000558", "canto@email.com", current_timestamp(), null),
(default, "João Pé de Feijão", "1953-02-20", "45645000005", "119400000024", "feijoada@email.com", current_timestamp(), null),
(default, "Pedro Pedreira", "1965-01-17", "90098798004", "11920052200", "pedra@email.com", current_timestamp(), null),
(default, "Lima Duarte", "2014-03-13", "55500077854", "11001208888", "limalimao@email.com", current_timestamp(), 1);


select * from tb_turmas;
select * from tb_alunos;

# Inner Join retorna apenas as linhas onde existe valores correspondentes
select * from tb_alunos inner join tb_turmas    # neste linha definimos qual tipo de retorno queremos nesta consulta
on tb_turmas.id_turma = tb_alunos.fk_turma;     # nesta linha indicamos onde está a chave primária e em qual coluna da outra tabela ela passou a ser estrangeira. 

# Left outer join retorna toda a coluna a esquerda e apenas as correspondencias da outra coluna, 
# deixando como null quando não houver correspondência
select * from tb_alunos left outer join tb_turmas
on tb_turmas.id_turma = tb_alunos.fk_turma;

select * from tb_alunos right outer join tb_turmas
on tb_turmas.id_turma = tb_alunos.fk_turma;

select * from tb_alunos inner join tb_turmas
on tb_turmas.id_turma = tb_alunos.fk_turma;

/*
Note que quando lidamos com 2 ou mais tabelas, não podemos mais indicar apenas o nome da coluna (nome_aluno)
em todos os casos será necessário informar o nome da tabela antes e separando apenas com um . indicamos o nome
da coluna que queremos (tb_alunos.nome_aluno)
*/

# Da tabela tb_alunos, queremos nome do aluno, calculamos a idade usando a data de nascimento e também pedimos os cursos que estão na tabela tb_turmas
select tb_alunos.nome_aluno, timestampdiff(year, tb_alunos.dt_nasc_aluno, now()) as "Idade", tb_turmas.cursos 
# aqui ↓ indicamos como deve ser gerado o retorno, neste caso deve trazer apenas as correspondências entre as 2 tabelas
from tb_alunos inner join tb_turmas
# aqui ↓ indicamos que uma cópia da chave primária da tabela tb_turmas chamada id_turmas, saiu de lá e foi para a tabela tb_alunos, chegando lá passou
# a ser chamada de fk_turma, desta forma permitimos que dados sejam coletados das duas tabelas ao mesmo tempo. 
on tb_turmas.id_turma = tb_alunos.fk_turma
# aqui ↓ pedimos para colocar o resultado em ordem a partir da coluna nome_aluno, mas neste caso necessitamos informar antes o nome da tabela
order by tb_alunos.nome_aluno;   


# Aqui ↓ pedimos os cursos da tabela tb_turmas e também usamos o count para contar quantas vezes 
# os cursos aparecem na lista de registros
select tb_turmas.cursos, count(tb_turmas.cursos)
from tb_alunos inner join tb_turmas
on tb_turmas.id_turma = tb_alunos.fk_turma
# Aqui ↓ pedimos para agrupar o resultado por curso, para retornar quantas vezes cada um foi 
# escolhido por um aluno
group by tb_turmas.cursos;






    
    