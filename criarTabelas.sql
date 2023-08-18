create table if not exists ano_modelo (
	id_ano_modelo int(11) not null primary key,
    nome varchar(255) not null,
    tipo varchar(255) not null,
    valor float(12,2) not null
);

create table if not exists cidade (
	id_cidade int(10) not null primary key,
    nome_cidade varchar(50) not null
);

alter table cidade
drop column id_estoque,
add column id_estado int not null;

alter table cidade
add foreign key (id_estado) references estado(id_estado);

create table if not exists cliente (
	id_cliente int(10) not null primary key auto_increment,
    telefone_fixo int(10) not null,
    cep int(8) not null,
    numero int(10) not null,
    logradouro varchar(25) not null,
    bairro varchar(25) not null,
    cpf_cliente bigint(11) not null,
    complemento varchar(20),
    nome_cliente varchar(50) not null,
    telefone_celular bigint(12),
    email varchar(50)
);

alter table cliente
add column id_estado int not null,
add column id_cidade int not null,
add column id_ordem int not null;

alter table cliente
add foreign key (id_estado) references estado(id_estado),
add foreign key (id_cidade) references cidade(id_cidade),
add foreign key (id_ordem) references ordem_servico(id_ordem);

create table if not exists cor (
	id_cor int(10) not null primary key auto_increment,
    nome_cor varchar(50) not null
);

create table if not exists estado (
	id_estado int(10) not null primary key auto_increment,
    nome_estador varchar(50) not null
);

create table if not exists estoque (
	id_peca int(10) not null primary key auto_increment,
	qtd_peca int (10) not null,
    codigo_peca int(10) not null,
    valor_peca float(12,2) not null,
    nome_peca varchar(50) not null,
    validade date not null
);

create table if not exists estoque_fornecedor (
	 id_estoque int(10),
     id_fornecedor int(10),
     foreign key (id_estoque) references estoque(id_peca),
     foreign key (id_fornecedor) references fornecedor(id_fornecedor)
);

create table if not exists estoque_nota (
	id_estoque int(10) not null,
    id_nota int(10) not null,
    foreign key (id_estoque) references estoque(id_peca),
    foreign key (id_nota) references nota(id_nota)
);

create table if not exists fabricante (
	id_fabricante int(10) primary key not null auto_increment,
    nome_fabricante varchar(50) not null
);

create table if not exists fornecedor (
	id_fornecedor int(10) primary key not null auto_increment,
    nome_fantasia int(10) not null,
    razao_social varchar(50),
    vendedor varchar(50) not null,
    codigo_fornecedor int(10) not null,
    cnpj bigint(14) not null,
    logradouro varchar(50) not null,
    numero int(8) not null,
    complemento varchar(20) not null,
    telefone int(10) not null,
    bairro varchar(25) not null,
    cep int(8) not null
);

alter table fornecedor
add column id_estado int not null,
add column id_cidade int not null;

alter table fornecedor
add foreign key (id_estado) references estado(id_estado),
add foreign key (id_cidade) references cidade(id_cidade);

create table if not exists modelo (
	id_modelo int(10) primary key not null auto_increment,
    nome_modelo varchar(50) not null,
    tipo varchar(50) not null
);

alter table modelo
add column id_ano_modelo int not null;

alter table modelo
add foreign key (id_ano_modelo) references ano_modelo(id_ano_modelo);

create table if not exists nota (
	id_nota int(10) primary key not null auto_increment,
    data_compra date not null,
    data_venscimento timestamp not null,
    numero int(10) not null
);

create table if not exists ordem_servico (
	id_ordem int(10) primary key not null auto_increment,
    data_registro timestamp not null,
    data_pagamento timestamp not null,
    pago boolean not null,
    concluida boolean not null
);

alter table ordem_servico
add column id_veiculo int not null;

alter table ordem_servico
add foreign key (id_veiculo) references veiculo(id_veiculo);

create table if not exists relacao_ordem_servico (
	id_relacao_ordem int(10) primary key not null auto_increment
);

alter table relacao_ordem_servico
add column id_relacao_estoque int not null,
add column id_relacao_servico int not null,
add column id_ordem_servico int not null;

alter table relacao_ordem_servico
add foreign key (id_relacao_servico)
	references relacao_servicos(id_relacao_servicos),
add foreign key (id_ordem_servico)
	references ordem_servico(id_ordem);

create table if not exists relacao_servicos (
	id_relacao_servicos int(10) primary key not null auto_increment
);

alter table relacao_servicos
add column id_relacao_ordem_servico int not null,
add column id_servico int not null;

alter table relacao_servicos
add foreign key (id_relacao_ordem_servico)
	references ordem_servico(id_ordem),
add foreign key (id_servico)
	references servicos(id_servico);

create table if not exists servicos (
	id_servico int(10) primary key not null auto_increment,
    descricao varchar(255),
    valor_servico float(12,2)
);

alter table servicos
add column id_relacao_ordem_servico int not null;

alter table servicos
add foreign key (id_relacao_ordem_servico)
references relacao_ordem_servico(id_relacao_ordem);

create table if not exists tipo (
	id_tipo int primary key not null auto_increment,
    nome varchar(255) not null
);

create table if not exists tipo_fornecedor (
	id_tipo int not null,
    id_fornecedor int not null,
    foreign key (id_tipo) references tipo(id_tipo),
	foreign key (id_fornecedor) references fornecedor(id_fornecedor)
);


create table if not exists veiculo (
	id_veiculo int primary key not null auto_increment,
    placa varchar(7) not null,
    quilometragem int
    -- chave
);

alter table veiculo
add column id_fabricante int(10) not null;

alter table veiculo
add foreign key (id_fabricante)
references fabricante(id_fabricante);

alter table veiculo
add column id_modelo int not null,
add column id_cor int not null;

alter table veiculo
add foreign key (id_modelo)
	references modelo(id_modelo),
add foreign key (id_cor)
	references cor(id_cor);





