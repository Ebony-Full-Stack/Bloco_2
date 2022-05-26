/*Crie um banco de dados para um serviço de um açougue ou uma quitanda, o nome do
banco deverá ter o seguinte nome db_cidade_das_carnes ou db_cidade_das_frutas, onde o
sistema trabalhará com as informações dos produtos desta empresa.
|| O sistema trabalhará com 2 tabelas tb_produto e tb_categoria. Siga exatamente esse passo a passo:
|| Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desse açougue.
|| Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço desse açougue(não esqueça de
criar a foreign key de tb_categoria nesta tabela).
|| Popule esta tabela Categoria com até 5 dados.
|| Popule esta tabela Produto com até 8 dados.
|| Faça um select que retorne os Produtos com o valor maior do que 50 reais.
|| Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
|| Faça um select utilizando LIKE buscando os Produtos com a letra C.
|| Faça um um select com Inner join entre tabela categoria e produto.
|| Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são aves ou legumes).
Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.*/


create database db_cidade_das_carnes;
use db_cidade_das_frutas;

create table tb_categoria (
id_categoria bigint auto_increment, 
tipos varchar (30), 
corte varchar (8),
primary key (id_categoria) );

select * from tb_categoria;
 
