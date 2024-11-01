create database loja_ex;
use loja_ex;

create table produto(
	id int primary key auto_increment,
    nome varchar(100),
    preco decimal(10,2),
	estoque int
);
insert into produto(nome,preco,estoque)
values ('Tenis nike',100.00, 7),
('Amandita', 15.25, 5),
('Tracksuit', 178.99, 2),
('Chuteira Mercurial 8', 225.50 , 10),
('Iphone 11',1900.00, 3),
('Halls',0.50, 55);
select * from produto;


create table cliente(
	id int primary key auto_increment,
    nome varchar(100),
    email varchar(100),
    cidade varchar(100) 
);
insert into cliente(nome,email,cidade)
values ('Joao silva','jssilva@gmail.com','Sao paulo'),
('Fabiano','fafasp@gmail.com','Sao paulo'),
('Jeferson','jefsborba@gmail.com','Bonito'),
('Clodovalda','cleidinha@outlook.com','Rio verde'),
('Fabio','fabiolindo@outlook.com','Campo grande'),
('Adriane','dridugrau@gmail.com','Campo grande'),
('Markos','markim@gmail.com','Tres lagoas');
select * from cliente;

create table venda(
	id int primary key auto_increment,
    data_venda date,
    id_cliente int,
    id_produto int,
    quantidade int,
    valor_total decimal(10,2)
);
insert into venda(data_venda,id_cliente,id_produto,quantidade,valor_total)
values ('2024-03-08', 8, 6, 2, 1.00),
('2024-06-21', 2, 1, 2, 30.50),
('2024-10-02', 1, 4, 1, 1900.00 ),
('2023-12-06', 4, 3, 1, 225.50),
('2024-11-04', 5, 2, 1, 178.99),
('2024-12-06', 3, 5, 6, 3.00);
select * from venda;




/*1. Faça uma consulta que mostre o nome de todos os produtos junto com a quantidade de
estoque de cada um.*/
select p.nome, p.estoque from produto as p;


/*2. Liste o nome e o e-mail dos clientes que moram na cidade de 'São Paulo'.*/
select c.nome, c.email from cliente as c
where c.cidade = "Sao paulo";


/*3. Recupere todas as vendas realizadas pelo cliente com o nome 'João Silva', mostrando a
data da venda, o produto comprado e o valor total."
- Dica: Utilize INNER JOIN para relacionar Cliente, Venda e Produto*/
select v.data_venda, p.nome, v.valor_total from venda as v
inner join produto as p
on v.id_cliente = c.id
inner join cliente as c
on c.nome = 'Joao silva';


/*4. Atualize o preço do produto 'Tênis Nike' para R$ 349,99.*/
update produto set preco = '349.99' where id = '6';


/*5. Insira um novo produto chamado 'Bola de Futebol Adidas' com o preço de R$ 89,90 e
quantidade de 50 unidades no estoque.*/
insert into produto(nome,preco,estoque)
values ('Bola de futebol adida',89.90, 50);


/*6. Faça uma consulta que retorne o total de vendas realizadas no dia '2024-10-01'(Mudei a data para 2024-10-02).*/
select sum(valor_total) from venda
where data_venda = '2024-10-02';


/*7. Liste o nome de cada cliente e o valor total das compras realizadas por ele.*/
select c.nome, v.valor_total from cliente as c
inner join venda as v
where v.id_cliente = c.id;


/*8. Crie uma instrução que diminua a quantidade de estoque do produto vendido em uma
determinada venda.*/
update produto
set estoque = estoque - 1
where id = 3;


/*9. Faça uma consulta que retorne o produto mais vendido (em quantidade) até o momento.*/
select max(quantidade) from venda;


/*10. Insira uma nova venda para o cliente com id 3, do produto com id 5, na quantidade de 2
unidades, com data de hoje e valor total calculado corretamente*/
insert into venda(data_venda,id_cliente,id_produto,quantidade,valor_total)
values ('2024-10-21', 3, 5, 2, 1.00);


/*11.Crie uma consulta que liste todos os produtos que ainda não foram vendidos, ou seja,
produtos que não aparecem na tabela de vendas*/
select p.*
from produto as p
left join venda as v on p.id = v.id_produto
where v.id_produto is null;


/*12. Liste todas as vendas realizadas, mostrando a data, o nome do cliente e o valor total da
venda.*/
select v.data_venda, c.nome as cliente, v.valor_total
from venda as v
inner join clientes c 
on v.cliente_id = c.id;


/*13. Faça uma consulta que retorne a soma de todas as quantidades de produtos em
estoque na loja.*/
select SUM(estoque) from produto;


/*14. Crie uma consulta que retorne o nome do cliente que mais gastou em compras no total.*/
select v.data_venda, sum(v.valor_total) as total, c.nome from venda as v
inner join cliente as c 
on c.id = v.id_cliente 
group by c.nome
order by total desc
limit 1;


/*15. Atualize a cidade do cliente com o nome 'Maria Souza'(Markos) para 'Rio de Janeiro'*/
update cliente 
set cidade = 'Rio de janeiro'
where id = 5;


/*16. Filtrar e ordenar por data*/
select * from venda
order by data_venda desc;


/*17. Filtrar e ordenar produtos por nome*/
select * from produto
order by nome 
limit 5;


/*18. Filtrar de venda mostrando o valor vendido p/ dia */
select v.data_venda, sum(v.valor_total) from venda as v
inner join cliente as c
on c.id = v.id_cliente
group by v.data_venda ;


/*19. Filtrar de venda mostrando o valor vendido p/ dia com order */
select v.data_venda, sum(v.valor_total) from venda as v
inner join cliente as c
on c.id = v.id_cliente
group by v.data_venda 
order by v.data_venda desc;


/*20. Ordenar pela pessoa que mais comprou*/
select c.nome, v.quantidade from venda as v
inner join  cliente as c
on c.id = v.id_cliente
order by quantidade desc
limit 2;


/*21. Ordenar pela prodto mais vendido*/
select * from produto
where estoque < 10
order by estoque;
