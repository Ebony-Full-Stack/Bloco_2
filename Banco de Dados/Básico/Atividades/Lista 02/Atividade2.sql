/* Crie um banco de dados para um serviço de pizzaria de uma empresa, o nome do banco
deverá ter o seguinte nome db_pizzaria_legal, onde o sistema trabalhará com as
informações dos produtos desta empresa.
|| O sistema trabalhará com 2 tabelas tb_pizza e tb_categoria. siga exatamente esse passo a passo:
|| Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.
|| Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço dessa pizzaria(não esqueça de criar a foreign key de tb_categoria nesta tabela).
|| Popule esta tabela Categoria com até 5 dados.
|| Popule esta tabela pizza com até 8 dados.
|| Faça um select que retorne os Produtos com o valor maior do que 45 reais.
|| Faça um select trazendo os Produtos com valor entre 29 e 60 reais.
|| Faça um select utilizando LIKE buscando os Produtos com a letra C.
|| Faça um um select com Inner join entre tabela categoria e pizza.
|| Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são pizza doce).
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade. */

create database db_ebonypizzaria;
use db_ebonypizzaria;

create table tb_categoria  (
id_categoria bigint auto_increment,
variedade varchar (12) not null, 
tamanho  varchar (10) not null, 
primary key (id_categoria) );


select * from tb_categoria; 

	insert into tb_categoria ( variedade, tamanho)
					  values ("Tradicional" , "Média"),
				             ("Vegetariana" , "Pequena"),
                             ("Especial", "Grande"), 
                             ("Doce", "Broto");
                   
create table tb_pizza(
id_pizza bigint auto_increment, 
sabor varchar(45) not null, 
adicional varchar (20) not null, 
borda varchar (30) not null,
preco decimal (4, 2), 
fk_classe bigint(4),
    primary key (id_pizza),
    foreign key (fk_classe) references tb_categoria(id_categoria)
					  );
                      
	
                      
	insert into tb_pizza (sabor, adicional, borda, preco, fk_classe)
				  values ("Frango com cheddar especial", "Cheddar e bacon", "Borda vulcão de cheddar", 70.00, 3),
						 ("Calabresa", "Sem adicional", "Borda tracional de catupiry", 49.00, 1),
                         ("Brocólis", "Sem adicional", "Borda tradicional de catupiry", 40.00, 2),
                         ("Morango com chocolate", "Sem adicional", "Sem borda" , 38.00, 4);
                         
	select * from tb_pizza;
    select * from tb_categoria;
    
    select * from tb_pizza where preco > 45.00;
    
    select * from tb_pizza where preco > 29.00 and preco < 60.00;
    
    select * from tb_pizza where sabor like "C%";													    ##sabor que tem a letra C no inicio
    select * from tb_pizza where sabor like "%C";														##sabor que tem a letra C no final
    select * from tb_pizza where sabor like "%C%";														##sabor que tem a letra C no meio 
   
        
	select * from tb_categoria inner join tb_pizza  													##junta as tabelas com o inner join 
	on tb_categoria.id_categoria = tb_pizza.fk_classe;
    
    								
    									
    													
	select * from tb_categoria inner join tb_pizza																									 ##pega a categoria em uma e relaciona com a outra
    on tb_categoria.id_categoria = tb_pizza.fk_classe 																								 ##seleciona o valor dentro do cammpo igual ao que está determinado
    where tb_categoria.variedade = "Tradicional";
                         
		
                      
                   


