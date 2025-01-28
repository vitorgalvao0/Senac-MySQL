create database BANCO;
use banco;

drop table cliente;

create table cliente (
  id int primary key auto_increment,
  nome varchar(100),
  endereco varchar(100),
  telefone varchar (100),
  email varchar (100)
);
insert into cliente (id, nome, endereco, telefone, email) 
values (1, 'João Silva', 'Rua A, 123', '(11) 91234-5678', 'joao.silva@email.com'),
(2, 'Maria Oliveira', 'Avenida B, 456', '(21) 99876-5432', 'maria.oliveira@email.com'),
(3, 'Pedro Santos', 'Travessa C, 789', '(31) 98765-4321', 'pedro.santos@email.com'),
(4, 'Ana Costa', 'Praça D, 101', '(41) 97654-3210', 'ana.costa@email.com'),
(5, 'Lucas Pereira', 'Largo E, 202', '(51) 96543-2109', 'lucas.pereira@email.com'),
(6, 'Mariana Lima', 'Rua F, 303', '(61) 95432-1098', 'mariana.lima@email.com'),
(7, 'Rafael Almeida', 'Avenida G, 404', '(71) 94321-0987', 'rafael.almeida@email.com'),
(8, 'Juliana Rocha', 'Travessa H, 505', '(81) 93210-9876', 'juliana.rocha@email.com'),
(9, 'Carlos Martins', 'Praça I, 606', '(91) 92109-8765', 'carlos.martins@email.com'),
(10, 'Fernanda Ribeiro', 'Largo J, 707', '(31) 91098-7654', 'fernanda.ribeiro@email.com');
select * from cliente;


create table conta (
  numero_conta int primary key,
  tipo_conta varchar(100),
  id_cliente  int 
);
insert into conta (numero_conta, tipo_conta, id_cliente) 
values (1001, 'Conta Corrente', 1),
(1002, 'Conta Salario', 2),
(1003, 'Conta Corrente', 3),
(1004, 'Conta Poupança', 4),
(1005, 'Conta Corrente', 5),
(1006, 'Conta Poupança', 6),
(1007, 'Conta Corrente', 7),
(1008, 'Conta Poupança', 8),
(1009, 'Conta Salario', 9),
(1010, 'Conta Poupança', 10);



create table transacao (
  id_transacao int primary key,
  data_transacao date,
  valor int,
  tipo_transacao varchar(100),
  numero_conta int 
);
insert into transacao (id_transacao, data_transacao, valor, tipo_transacao, numero_conta) 
values (1, '2024-01-15', 1500, 'Depósito', 1001),
(2, '2024-01-16', 300, 'Saque', 1002),
(3, '2024-01-17', 200, 'Transferência', 1003),
(4, '2024-01-18', 500, 'Depósito', 1004),
(5, '2024-01-19', 150, 'Saque', 1005),
(6, '2024-01-20', 1200, 'Depósito', 1006),
(7, '2024-01-21', 800, 'Saque', 1007),
(8, '2024-01-22', 600, 'Transferência', 1008),
(9, '2024-01-23', 350, 'Saque', 1009),
(10, '2024-01-24', 900, 'Depósito', 1010);


CREATE TABLE agencia (
  id_agencia int primary key,
  endereco varchar (100),
  telefone varchar (100)
);
insert into agencia (id_agencia, endereco, telefone) 
values (1, 'Rua Principal, 100', '(11) 3000-0001'),
(2, 'Avenida Central, 200', '(21) 3000-0002'),
(3, 'Travessa das Flores, 300', '(31) 3000-0003'),
(4, 'Praça da Liberdade, 400', '(41) 3000-0004'),
(5, 'Rua dos Açores, 500', '(51) 3000-0005'),
(6, 'Avenida da Paz, 600', '(61) 3000-0006'),
(7, 'Rua das Palmeiras, 700', '(71) 3000-0007'),
(8, 'Largo do Comércio, 800', '(81) 3000-0008'),
(9, 'Praça do Pôr do Sol, 900', '(91) 3000-0009'),
(10, 'Rua da Esperança, 1000', '(31) 3000-0010');



create table funcionario (
  id_funcionario int primary key,
  nome varchar(100),
  cargo varchar(100),
  agencia_id int
);
insert into funcionario (id_funcionario, nome, cargo, agencia_id) 
values (1, 'Carlos Souza', 'Gerente', 1),
(2, 'Ana Lima', 'Caixa', 2),
(3, 'Fernando Almeida', 'Assistente', 1),
(4, 'Mariana Costa', 'Gerente de Contas', 3),
(5, 'Roberto Ferreira', 'Caixa', 4),
(6, 'Juliana Rocha', 'Assistente', 5),
(7, 'Pedro Santos', 'Gerente', 6),
(8, 'Fernanda Oliveira', 'Analista', 7),
(9, 'Lucas Pereira', 'Caixa', 8),
(10, 'Tatiane Mendes', 'Gerente de Relacionamento', 9);

select c.nome as Nome_Cliente, c.endereco as Endereco_Cliente, co.tipo_conta as Tipo_Conta
from  cliente as c
join  conta as co on c.id = co.id_cliente
where co.tipo_conta like '%Sala%'
order by c.nome asc;


select * from cliente;
DELETE FROM CLIENTE WHERE ID = 18;

INSERT INTO cliente(nome,endereco,telefone,email) values ('teste','teste', 'teste', 'teste');


/*Criar Metodo (função) no mysql*/
/*Inverter letras*/
DELIMITER //

CREATE PROCEDURE reajuste_nome(in valor_parametro varchar(50), in id_cliente int)
BEGIN

	UPDATE cliente 
    SET nome = reverse(nome)
    WHERE id = id_cliente;
    
    SELECT * FROM cliente WHERE id = id_cliente;
END
// DELIMITER ;
drop procedure if exists reajuste_nome;
CALL reajuste_nome('parametro_exemplo', 1);
select * from cliente;


/*Nome maiusculo*/

DELIMITER //

CREATE PROCEDURE reajuste_NOME(in valor_parametro varchar(50), in id_cliente int)
BEGIN

	UPDATE cliente 
    SET nome =  upper(nome)
    WHERE id = id_cliente;
    
    select * from cliente where id = id_cliente;

END
// DELIMITER ;
drop procedure if exists reajuste_NOME;
call reajuste_NOME('parametro_exemplo', 1);
select * from cliente;


/*Arrumar nome*/
DELIMITER //

CREATE PROCEDURE ajuste_nome(in valor_parametro varchar(50), in id_cliente int)
BEGIN

	UPDATE cliente 
    SET nome = valor_parametro
    WHERE id = id_cliente;
    
    select * from cliente where id = id_cliente;

END
// DELIMITER ;

set @total = 0.0;
select @total := sum(valor) 
from transacao;

select @total as total;
