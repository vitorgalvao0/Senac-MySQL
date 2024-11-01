create database mercado 
use mercado

create table produtos(
	id int auto_increment,
    nome varchar(45) not null,
    preco float not null,
    id_categoria int not null,
    primary key(id)
)

select * from produtos

insert into produtos
(nome,preco,id_categoria) 
values 
('Coca',5.35,2),('Sprite',6.75,2)

delete from produtos where id = 4

select * from produtos where preco < 10

select id_categoria from produtos

create table categorias(
	id int auto_increment,
    nome varchar(45) not null,
    primary key(id)
)

insert into categorias(nome)
values ('Produtos limpeza'),('Bebida'),('Frutas')

select * from categorias

select p.nome, c.nome as "Nome_categoria" from produtos as p
inner join categorias as c
where p.id_categoria = c.id


select p.nome, c.nome as "categoria", p.preco from produtos as p
inner join categorias as c
where p.preco < 10



