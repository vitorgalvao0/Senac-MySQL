create table clientes(
	id int primary key auto_increment null,
    nome varchar(40) not null,
    email varchar(40) not null,
    endereco varchar(50) not null
);
insert into clientes(nome,email,endereco)
values('vitor','vitor@gmail.com','R. Maldivas 1500'),
('luan','luanzin@gmail.com','R. Du careca 65'),
('roger','rjg@gmail.com','R. Cabeludo 222'),
('david','david10@outlook.com','R. Torta 2121');
select * from clientes


create table produtos(
	id int primary key auto_increment not null,
    nome varchar(40) not null,
    descricao longtext not null,
    preco decimal not null,
    quantidade_em_estoque int not null
);
insert into produtos(nome,descricao,preco,quantidade_em_estoque)
values ('Banana','Fruta','2,99','3'),
('Coca-Cola','Bebida','7,50','10'),
('Red Label','Bebida','150,99','7'),
('Sprite','Bebida','5,00','1'),
('Sabão em pó','Limpeza','15,99','3'),
('Alface','Verdura','1,99','6')
select * from produtos


create table pedidos(
	id int primary key  auto_increment not null,
    id_cliente int not null,
    data_pedido date not null,
    statu varchar(30) not null
);
insert into pedidos(id_cliente,data_pedido,statu)
values(1, 20241007, 'Cancelado'),
(2, 20241007, 'Finalizado'),
(3, 20241007, 'Finalizado'),
(4, 20241007, 'Finalizado')
select * from pedidos

create table itens_pedidos(
	id  int primary key  auto_increment not null, 
    id_pedido int not null, 
    id_produto int not null, 
    quantidade int not null, 
    preco_unitario float not null
);
insert into itens_pedidos(id_pedido,id_produto,quantidade,preco_unitario)
values(1,1,2, '2'),
(2,2,1, '7'),
(3,3,2, '300'),
(4,4,1, '5'),
(5,5,3, '45')
select * from itens_pedidos

