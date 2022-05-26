/* Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco
deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as
informações dos produtos desta empresa.
|| O sistema trabalhará com 2 tabelas tb_produto e tb_categoria. Siga exatamente esse passo a passo:
|| Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.
|| Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço deste farmacia(não
esqueça de criar a foreign key de tb_categoria nesta tabela).
|| Popule esta tabela Categoria com até 5 dados.
|| Popule esta tabela Produto com até 8 dados.
|| Faça um select que retorne os Produtos com o valor maior do que 50 reais.
|| Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
|| Faça um select utilizando LIKE buscando os Produtos com a letra B.
|| Faça um um select com Inner join entre tabela categoria e produto.
|| Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são cosméticos).
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.*/

drop database db_farmacia_do_bem;
create database db_farmacia_do_bem;
use db_farmacia_do_bem;

create table tb_categoria (
id_categoria bigint auto_increment,
indicacao varchar (30),
receituario varchar (30),
primary key (id_categoria) );

select * from tb_categoria; 

insert into tb_categoria (indicacao, receituario)
			      values ("Dores musculares", "Não precisa"), 
						 ("Gripe", "Não precisa"), 
                         ("Ansiedade", "Precisa");
                         
select * from tb_categoria; 
  
create table tb_produto ( 
id_produto bigint auto_increment, 
nome_do_medicamento varchar (20) not null, 
preco_unitario decimal (4, 2), 
lote varchar(10), 
fabricante varchar (30) not null, 
fk_classe bigint (4), 
primary key(id_produto), 
  foreign key (fk_classe) references tb_categoria(id_categoria)
							); 
                            
	insert into tb_produto (nome_do_medicamento, preco_unitario,  lote, fabricante, fk_classe)
					 values("Cimegripe", 8.00,  "523E1121" , "Cimed", 2),
						   ("Setralina", 62.00, "45526F", "EMS", 3),
						   ("Ibuprofeno", 18.00,  "092713", "EMS", 1);
	
    select * from tb_categoria;
    select * from tb_produto; 
    
	
    
    select * from tb_produto where preco_unitario > 50.00;
    select * from tb_produto where preco_unitario > 3.00 and preco_unitario < 60.00;
    
    select * from tb_produto where nome_do_medicamento like "%b%";
    select * from tb_produto where nome_do_medicamento like "b%";
    select * from tb_produto where nome_do_medicamento like "%b";
    
    select * from tb_categoria inner join tb_produto 
    on tb_categoria.id_categoria = tb_produto.fk_classe; 
    
    
    
     select * from tb_categoria inner join tb_produto 
	 on tb_categoria.id_categoria = tb_produto.fk_classe 
	 where tb_categoria.receituario = "Não precisa";
                            
                            
	