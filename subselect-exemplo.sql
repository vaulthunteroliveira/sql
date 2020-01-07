-- criando banco
create database subselect_exemplo_db;

-- usando o banco criado 
use subselect_exemplo_db;

-- criando table de funcionario
create table funcionarios(
	id_funcionario int primary key auto_increment,
    matricula varchar(20),
    data_adimissao date,
    idade int,
    sexo char(1),
    nome varchar(100) 
);

-- inserindo dados na tabela de funcionarios
insert into funcionarios (matricula, data_adimissao, idade,  sexo, nome)
values (1672, '2016-07-13', 19, 'M', 'Fernando Silva'),
(1805, '2016-11-09 00:00:00', '25', 'F', 'Maria Rosa'),
('1953', '2016-04-14 00:00:00', '34', 'M', 'Carlos Alberto'),
('1691', '2016-09-03 00:00:00', '23', 'M', 'Henrique Oliveira'),
('1381', '2015-08-17 00:00:00', '47', 'F', 'Fátima Santana');

-- exibindo dados da tabela de funcionarios
select * from funcionarios;

-- criando tabela de dependentes com chave estrangeira referente a tabela funcionarios
create table dependentes(
	id_dependente int primary key auto_increment,
    nome varchar(100), 
    idade int,
    sexo char(1), 
    id_funcionario_fk int,
    foreign key (id_funcionario_fk) references funcionarios(id_funcionario)     
);  
-- inserindo dados na tabela de dependentes 
insert into dependentes(nome, idade, sexo, id_funcionario_fk)
values ('joão', 8, 'm', 2), ('gabriel', 16, 'm', 3), ('maria', 7, 'f', 2), ('regina', 26, 'f', 4);

-- buscandos todos os dados relacionados entre a tabela de funcionarios e dependentes
select * from funcionarios f 
inner join dependentes p 
on f.id_funcionario = p.id_funcionario_fk;

-- trazendo todos os usuários que tem dependentes com uma sub-query 
select * from funcionarios f where id_funcionario in 
(select id_funcionario_fk  from dependentes d where f.id_funcionario = d.id_funcionario_fk)


 


