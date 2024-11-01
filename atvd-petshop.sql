create database petshop
use petshop

create table cliente(
	id int primary key auto_increment unique,
	nome varchar(50),
    dt_nascimento date,
    cpf varchar(15) unique,
    logradouro varchar(50),
    bairro varchar(25),
    numero varchar(4),
    telefone varchar(14)
)

create table animais(
	id int primary key auto_increment,
    nome varchar(50),
    idade int,
    raca varchar(30),
    tipo_especie int,
    id_cliente int
)

create table especie(
	id int primary key auto_increment,
    especie varchar(35)
)

alter table animais add column id_cliente int
alter table cliente add column complemento varchar(15) after numero

update cliente set complemento = 'A' where id = '1';
update cliente set complemento = 'A' where id = '2';
update cliente set complemento = 'B' where id = '3';

select * from cliente
select * from animais
select * from especie
select * from atendimento
select * from servicos

insert into cliente(nome,dt_nascimento,cpf,logradouro,bairro,numero,telefone)
value ('Vitor','2007-06-21','06944579146','R. Florbela Espanca','Vida nova 3','219','67992295226'),('Maycon','2006-03-16','06745519148','R. Takeshi Higuchi','Vida nova 3','270','67998725622'),
('Pablo','2009-01-10','06925826945','R. Takeshi Higuchi','Vida nova 3','270','67998826326')

insert into especie(especie)
value ('Cachorro'), ('Gato'), ('Coelho')

insert into animais(nome,idade,raca,tipo_especie,id_cliente)
values ('Duke',6,'Chow-Chow',1,1), ('Hadija',7,'Boiadeiro-australiano',1,2), ('Ludmilla',3,'Persa',2,3)


create table servicos(
	id int primary key auto_increment unique,
    descricao varchar(35),
    valor float
)

insert into servicos(descricao,valor)
value('Tosa',50),('Banho e tosa',80),('Vacinação',170)
select * from servicos 

create table atendimento(
	id int primary key auto_increment unique, 
    dt_atendimento date,
    id_servico int,
    id_animal int
)

insert into atendimento(dt_atendimento,id_servico,id_animal)
value('2024-05-21',1, 2),('2024-10-21',3, 3),('2024-03-07',2, 1)

create table profissionais (
	id int primary key auto_increment unique,
    nome varchar(50),
    telefone varchar(15),
    crmv varchar(9) unique
)
insert into profissionais(nome,telefone,crmv)
value('Rodrigo','6799665486','005263'),('Cesar','6798315481','008889'),('Paula','6799996325','0154879')
select * from profissionais

alter table atendimento add column id_profissional int
select * from atendimento
update atendimento set column id_profissional = 1 where id= 1
update atendimento set column id_profissional = 3 where id= 2
update atendimento set column id_profissional = 2 where id= 3


select an.nome as cachorro, e.especie, a.dt_atendimento, p.nome as veterinario, s.descricao, s.valor, c.nome as dono
from atendimento as a
inner join servicos as s
on s.id = a.id_servico
inner join animais as an
on an.id = a.id_animal
inner join cliente as c
on an.id_cliente = c.id
inner join especie as e
on e.id = an.tipo_especie
inner join profissionais as p
on p.id = a.id_profissional
