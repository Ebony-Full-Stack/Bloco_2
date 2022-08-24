create database db_loja
default character set utf8mb4          # Setamos para garantir a aceitação de todos os caracteres no padrão BR utff8
default collate utf8mb4_general_ci;

use db_loja;

create table tb_vendas (

	id_compra bigint auto_increment,
    nome_cliente varchar(30) not null,
    dt_compra timestamp,                     # Data inserida automaticamente a cada novo registro
    qtd int not null,
    v_total decimal(10,2) not null,
    forma_pg enum("cartao_credito", "cartao_debito", "boleto"),     # enum-> listamos as opções que serão aceitas neste campo 
    und_venda enum("SP1", "SP2", "RJ1", "RJ2", "MG1"),
    primary key(id_compra)  

)default charset = utf8mb4;  # Ao setar um padrão de caracteres,cada tabela também necessitará desta informação 

insert into tb_vendas values
(default, "Leonardo Alves", "2022-07-12", "30", "1536", "cartao_credito", "SP2"),
(default, "Ebony", "2022-07-10", "42", "2000", "boleto", "RJ2"),
(default, "Maria das Coves", "2022-07-14", "55", "2116", "cartao_credito", "MG1"),
(default, "Leonardo Alves", "2022-07-10", "12", "2458", "cartao_credito", "SP2"),
(default, "Ana Cana", "2022-07-12", "19", "9563", "cartao_debito", "SP1"),
(default, "Pedro Pedreira", "2022-07-13", "69", "8523", "boleto", "RJ1"),
(default, "Leonardo Cruz", "2022-07-05", "26", "1478", "boleto", "RJ1"),
(default, "Ana Cana", "2022-07-13", "24", "2369", "cartao_debito", "SP1"),
(default, "Leonardo Alves", "2022-07-12", "42", "3484", "cartao_debito", "SP1"),
(default, "Julia Jabuticaba", "2022-07-12", "96", "2336", "boleto", "RJ1"),
(default, "Leonardo Cruz", "2022-07-05", "47", "1556", "cartao_credito", "SP1"),
(default, "Maria das Coves", "2022-07-04", "22", "1247", "boleto", "SP1"),
(default, "Alberto Roberto", "2022-07-10", "90", "1359", "cartao_credito", "SP1"),
(default, "Leonardo Alves", "2022-07-05", "46", "158", "cartao_debito", "SP1"),
(default, "Julia Jabuticaba", "2022-07-04", "95", "48", "boleto", "MG1"),
(default, "Ebony", "2022-07-13", "25", "230", "cartao_debito", "RJ2"),
(default, "Julia Jabuticaba", "2022-07-05", "32", "12956", "boleto", "SP1"),
(default, "Ebony", "2022-07-13", "12", "5326", "cartao_credito", "RJ1"),
(default, "Julia Jabuticaba", "2022-07-06", "2", "2799", "cartao_credito", "RJ2"),
(default, "Miguel Chapéu", "2022-07-12", "50", "2600", "boleto", "SP1"),
(default, "Maria das Coves", "2022-07-06", "65", "4500", "boleto", "RJ2"),
(default, "Pedro Pedreira", "2022-07-10", "48", "1248", "cartao_debito", "SP1"),
(default, "Pedro Pedreira", "2022-07-06", "16", "2148", "boleto", "MG1"),
(default, "Ana Cana", "2022-07-12", "17", "315", "cartao_credito", "SP2"),
(default, "Miguel Chapéu", "2022-07-05", "13", "152", "cartao_credito", "MG1"),
(default, "Julia Jabuticaba", "2022-07-13", "31", "1599", "cartao_credito", "SP1"),
(default, "Maria das Coves", "2022-07-12", "66", "2900", "boleto", "RJ1"),
(default, "Ana Cana", "2022-07-08", "41", "2345", "boleto", "SP2"),
(default, "Miguel Chapéu", "2022-07-11", "37", "2590", "cartao_credito", "MG1"),
(default, "Maria das Coves", "2022-07-13", "29", "50", "boleto", "RJ1"),
(default, "Pedro Pedreira", "2022-07-10", "11", "1600", "cartao_credito", "SP2");

desc tb_vendas;
select * from tb_vendas;

# Order by -> ordenar a saída por coluna específica. 
select * from tb_vendas order by nome_cliente desc;  

# Distinct -> Retorna apenas uma instancia de cada valor   
select distinct nome_cliente from tb_vendas; 

# Count -> Retorna a quantidade de valores inseridos
select nome_cliente, count(id_compra) as "Total de Compras" from tb_vendas 
where nome_cliente = "Leonardo Alves";

# Between -> Retorna valores entre min e max
select * from tb_vendas where v_total >= 2000 and v_total <= 3000; 
select * from tb_vendas where v_total between 2000 and 3000; 
select * from tb_vendas where v_total not between 2000 and 3000; 

# sum -> soma valores de uma coluna
select sum(v_total) from tb_vendas;
select sum(v_total) from tb_vendas where dt_compra between "2022-07-12" and "2022-07-14"; 
select nome_cliente, sum(v_total) from tb_vendas where nome_cliente = "Leonardo Alves";

# max/ min/ avg -> Retorna maior, menor e média de valores de uma coluna
SELECT max(v_total) from tb_vendas;
SELECT min(v_total) from tb_vendas;
SELECT AVG(v_total) from tb_vendas;

# group by -> Agrupa informações iguais de uma coluna, ideal para totalizar vendas por cliente, produto,
# datas, categoria e etc...
select nome_cliente, sum(v_total) as "Total de Compras" from tb_vendas group by nome_cliente;

# select com todas as saidas
select nome_cliente as "Nome", 
count(id_compra) as "Total de Compras",
sum(v_total) as "Valor Total",
max(v_total) as "Maior Compra",
min(v_total) as "Menor Compra",
AVG(qtd) as "Média de Compras"
from tb_vendas 
where dt_compra between "2022-07-10" and "2022-07-12" GROUP BY nome_cliente;










