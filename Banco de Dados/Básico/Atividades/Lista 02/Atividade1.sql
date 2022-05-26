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

drop database db_generation_game_online;
create database db_generation_game_online;
use db_generation_game_online;

	create table tb_classe (
    id_classe bigint (5) auto_increment, 
    lado varchar(10) not null unique, 
    vida int, 
    
       primary key (id_classe)
							); 
                            
     select * from tb_classe;
     
     insert into tb_classe (lado, vida)
     value ( "Fogo" , 3600),
			("Água", 3700),
            ("Terra", 4000),
            ("Ar", 4200);
     
    create table tb_personagem (
    id_personagem bigint auto_increment,
    nome varchar (18) not null,
    raridade varchar (12) not null, 
    estilo varchar(20) not null, 
    poder_principal varchar(30) not null,
    defesa bigint,
    danos bigint, 
    fk_classe bigint (4),
    primary key (id_personagem),
    foreign key (fk_classe) references tb_classe(id_classe) 
								 );
        
insert into tb_personagem (nome , raridade, estilo, poder_principal, defesa, danos, fk_classe)		##insere os valores nos atributos;
		values ("Valquíria", "Rara", "Tropa", "Ataque com espada", 1250, 1950, 1),
			   ( "Bruxa", "Épica", "Tropa", "Ataque com feitiço", 2100, 2450, 2),
               ("X-Besta", "Épica", "Construção", "Disparo de flechas místicas",2500, 2400, 2),
               ("Cemitério", "Lendária", "Feitiço", "Esqueletos atacando",950, 1750, 3),
               ("Megacavaleiro", "Lendária", "Tropa", "Força de mil soldados", 1320, 2500, 4);
           
select * from tb_personagem;																		##seleciona todos os dados da tabela personagem;
select * from tb_classe;																			##seleciona todos os dados da tabela classe;

select * from tb_personagem where danos > 2000;														##personagens com danos  > 2000;
select * from tb_personagem where defesa > 1000 and defesa < 2000;									##personagens com defesa > 1000 e < 2000; 
select * from tb_personagem where nome like "C%";													##personagens que se iniciam com a letra C. 

select * from tb_classe inner join tb_personagem   													##junta as tabelas com o inner join 
on tb_classe.id_classe = tb_personagem.fk_classe;


select raridade from tb_personagem where raridade = "Épica";										##seleciona o valor dentro do cammpo igual ao que está determinado


truncate table tb_personagem;																		




    
    
    
    