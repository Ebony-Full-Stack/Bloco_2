/*Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter o seguinte nome db_generation_game_online, onde, o sistema trabalhará com as 
informações dos personagens desse game.
O sistema trabalhará com 2 tabelas tb_personagem e tb_classe. Siga exatamente esse passo a passo:

|| Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos relevantes da classe para se trabalhar com o serviço desse game Online.
|| Crie uma tabela tb_personagem e utilizando a habilidade de abstração e determine 5 atributos relevantes dos funcionários para se trabalhar com o serviço desse game Online
(não esqueça de criar a foreign key de tb_classe nesta tabela).
|| Popule esta tabela classe com até 5 dados.
|| Popule esta tabela personagem com até 8 dados.
|| Faça um select que retorne os personagens com o poder de ataque maior do que 2000.
|| Faça um select trazendo os personagens com poder de defesa entre 1000 e 2000.
|| Faça um select utilizando LIKE buscando os personagens com a letra C.
|| Faça um um select com Inner join entre tabela classe e personagem.
|| Faça um select onde traga todos os personagem de uma classe específica (exemplo todos os personagens que são arqueiros).
|| salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade. */

create database db_ebonygame
default character set utf8mb4
default collate utf8mb4_general_ci;

use db_ebonygame;

-- --------------------- Criando a tabela 'classe'
create table tb_classe (
id_classe bigint (5) auto_increment, 
categoria enum("Fogo", "Água", "Terra", "Ar"), 
vida int default 10000,
primary key (id_classe)
) default charset utf8mb4; 
 -- --------------------- Inserindo valores na tabela 'classe'
insert into tb_classe value 
(default, "Fogo" , 9000),
(default, "Água", default),
(default, "Terra", 12000),
(default, "Ar", default);
-- --------------------- Verificando a tabela 'classe'
select * from tb_classe; 
 -- --------------------- Criando a tabela 'personagem'
create table tb_personagem (
id_personagem bigint auto_increment,
nome varchar (20) not null,
raridade enum("Épica", "Rara", "Lendária", "Comum"), 
estilo varchar(20) not null, 
poder_principal varchar(30) not null,
defesa bigint,
danos bigint, 
fk_classe bigint (4),
primary key (id_personagem),
foreign key (fk_classe) references tb_classe(id_classe) 
);
-- --------------------- Inserindo valores na tabela 'personagem'
insert into tb_personagem (nome , raridade, estilo, poder_principal, defesa, danos, fk_classe)	
values ("Trakel", "Rara", "Matador", "Bala de canhão", 1250, 1950, 1),
	   ( "Ebony", "Épica", "Estratégico", "Ilusão", 2100, 2450, 2),
	   ("Odranoel", "Épica", "Estratégico", "Telecinesia",2500, 2400, 2),
	   ("Kravk", "Lendária", "Insano", "Tepranação",950, 1750, 3),
	   ("Obeonis", "Comum", "Guerreira", "Super tornado", 1320, 2500, 4);
-- --------------------- Verifificando valores na tabela 'personagem'	   
select * from tb_personagem;		
																
-- --------------------- Retorna todos os personagens com dano maior que 2000	
select * from tb_personagem where danos > 2000;		

-- --------------------- Retorna todos os personagens com defesa entre 1000 e 2000												
select * from tb_personagem where defesa > 1000 and defesa < 2000;	
				
-- --------------------- Retorna todos os personagens com nome iniciando com a letra C				 
select * from tb_personagem where nome like "C%";			
										 
-- --------------------- Retorna todos os personagens e suas devidas classes
select * from tb_classe inner join tb_personagem   													 
on tb_classe.id_classe = tb_personagem.fk_classe;

-- --------------------- Retorna nome e categoria de cada personagem
select tb_personagem.nome, tb_classe.categoria from tb_personagem inner join tb_classe
on tb_classe.id_classe = tb_personagem.fk_classe;

-- --------------------- Retorna nome, categoria, raridade todos os personagens com raridade Épica
-- ordenando a lista por ordem alfabetica tendo o nome como parametro
select tb_personagem.nome, tb_personagem.raridade, tb_classe.categoria from
tb_personagem join tb_classe on tb_classe.id_classe = tb_personagem.fk_classe
where raridade = "Épica" order by tb_personagem.nome;			
							
-- --------------------- Limpa todos os dados da tabela
truncate table tb_personagem;																		







