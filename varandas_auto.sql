create database varandas_auto;
use varandas_auto;

create table cliente (
id_cliente int primary key not null auto_increment,
nome varchar(45) not null,
telefone varchar(15) not null,
email varchar(45) not null,
senha varchar(20) not null
);

create table veiculo (
id_veiculo int primary key not null auto_increment,
fk_cliente int, foreign key (fk_cliente) references cliente (id_cliente),
montadora varchar(45) not null,
modelo varchar(45) not null,
ano_fabrica int not null
);

create table personaliza(
id_personaliza int primary key not null auto_increment,
fk_veiculo int, foreign key (fk_veiculo) references veiculo (id_veiculo), 
peca varchar(45) not null,
dimensoes varchar(45) not null,
cor varchar(45) not null,
observacao text
);
describe cliente;
select * from cliente;

