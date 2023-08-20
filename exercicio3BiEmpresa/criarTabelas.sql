create database if not exists exercicio_nando;

use exercicio_nando;

CREATE TABLE Empregado (
    Matricula int PRIMARY KEY,
    Nome varchar(255),
    CPF char(11),
    Telefone char(11),
    Salario float(10,2),
    fk_Orgao_id_orgao int,
    fk_Cargo_id_cargo int
);

CREATE TABLE Orgao (
    id_orgao int PRIMARY KEY,
    Sigla_orgao char(5),
    Nome_orgao char(5)
);

CREATE TABLE Dependente (
    idDependente int PRIMARY KEY,
    Dt_nascimento date,
    Nome_dependente varchar(255),
    fk_Empregado_Matricula int
);

CREATE TABLE Cargo (
    id_cargo int PRIMARY KEY,
    Nome_cargo varchar(255)
);

CREATE TABLE Contem (
    fk_Cargo_id_cargo int,
    fk_Orgao_id_orgao int
);
 
ALTER TABLE Empregado ADD CONSTRAINT FK_Empregado_2
    FOREIGN KEY (fk_Orgao_id_orgao)
    REFERENCES Orgao (id_orgao);
 
ALTER TABLE Empregado ADD CONSTRAINT FK_Empregado_3
    FOREIGN KEY (fk_Cargo_id_cargo)
    REFERENCES Cargo (id_cargo);
 
ALTER TABLE Dependente ADD CONSTRAINT FK_Dependente_2
    FOREIGN KEY (fk_Empregado_Matricula)
    REFERENCES Empregado (Matricula);
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_1
    FOREIGN KEY (fk_Cargo_id_cargo)
    REFERENCES Cargo (id_cargo);
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_2
    FOREIGN KEY (fk_Orgao_id_orgao)
    REFERENCES Orgao (id_orgao);
