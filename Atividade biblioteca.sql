create database bibliotecas;
use bibliotecas;

create table categoria(
	id int auto_increment not null,
	categoria_livro varchar(35) not null
);
insert into categoria(categoria_livro)
values ('Romance'),('Ação'),('Suspense'),('Fantasia')
/*id_livro  1          2         3              4      */
select * from categoria

create table livro(
	id int auto_increment primary key,
    id_livro int not null,
    nome_livro  varchar(50) not null,
    autor_livro  varchar(30) not null
);

insert into livro(id_livro,nome_livro,autor_livro)
values ( 1,'O acordo','Elle Kennity'),( 1,'A culpa das estrelas','John Green'),( 2,'Cemiterio dos dragões','Raphael Draccon'),( 2,'Cidade dos ossos','Cassandra Clare'),
( 3,'Acima de qualquer suspeita','Scott Turow'),( 3,'Um estudo em vermelho','Arthur Conan'),( 4,'O cão de baskervile','Arthur Conan'),( 4,'O teorema de Katharine','John Green')
select * from livro

drop table livro
create table leitor(
	id int auto_increment primary key,
    id_livro int not null,
    nome_leitor  varchar(50) not null
)
insert into leitor(id_livro, nome_leitor)
values (1,'Karina'),(2,'Vitor'),(2,'Emily'),(1,'Joana'),(3,'Luan'),(4,'Jaccob'),(3,'Alvin'),(4,'Teodoro')
select * from leitor

select le.id_livro as "Id do livro", le.nome_leitor as "Nome do leitor", li.nome_livro as "Nome do livro", li.autor_livro as "Autor do livro", c.categoria_livro as "Categoria do livro"
from leitor as le
inner join livro as li
inner join categoria as c 
where c.id = li.id_livro and c.categoria_livro = 'Romance' and le.id_livro = 1 and li.nome_livro = 'O acordo' and le.nome_leitor = 'Karina'

drop table biblioteca


