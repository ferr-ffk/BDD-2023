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

alter table empregado
add column sexo char(10);

UPDATE empregado SET `sexo` = 'masc' WHERE (`Matricula` = '1');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '2');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '3');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '4');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '5');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '6');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '7');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '8');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '9');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '10');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '11');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '12');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '13');
UPDATE `empregado` SET `sexo` = 'herma' WHERE (`Matricula` = '14');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '15');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '16');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '17');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '18');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '19');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '20');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '21');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '22');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '23');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '24');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '25');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '26');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '27');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '28');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '29');
UPDATE `empregado` SET `sexo` = 'fem' WHERE (`Matricula` = '30');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '31');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '32');
UPDATE `empregado` SET `sexo` = 'masc' WHERE (`Matricula` = '33');

select * from empregado;
select * from dependente;
select * from orgao;
select * from cargo;

-- TODOS OS EMPREGADOS E SEUS DEPENDENTES
select Nome, Nome_dependente from empregado, dependente where fk_Empregado_Matricula = empregado.Matricula;

-- TODOS OS EMPREGADOS SEM DEPENDENTES
select e.nome as nome_empregado
from empregado e
left join dependente d on e.matricula = d.fk_empregado_matricula
where d.fk_empregado_matricula is null;

-- TODOS OS CARGOS SEM EMPREGADOS CADASTRADOS
insert into Cargo
values (6, 'Técnico profissional'),
	   (7, 'Vidente');

select c.id_cargo, c.nome_cargo as 'Cargos sem empregados cadastrados'
from cargo c
left join empregado e on c.id_cargo = e.fk_cargo_id_cargo
where e.fk_Cargo_id_cargo is null;

-- TODOS OS ÓRGÃOS SEM CARGOS
SELECT O.Nome_orgao
FROM Orgao O
LEFT JOIN Contem ON O.id_orgao = Contem.fk_Orgao_id_orgao
WHERE Contem.fk_Orgao_id_orgao IS NULL;

-- MÉDIA DOS SALÁRIOS
select avg(Salario) from Empregado;

-- MÉDIA DOS SALÁRIOS POR CARGO
select Nome_Cargo, avg(Salario) as Média from Empregado, Cargo 
where empregado.fk_Cargo_id_cargo = cargo.id_cargo
group by fk_Cargo_id_cargo;

-- MÉDIA DOS SALÁRIOS POR CARGO E ÓRGÃO
SELECT O.Nome_orgao, C.Nome_cargo, AVG(E.Salario) AS Media_Salarios
FROM Orgao O
JOIN Contem ON O.id_orgao = Contem.fk_Orgao_id_orgao
JOIN Cargo C ON Contem.fk_Cargo_id_cargo = C.id_cargo
JOIN Empregado E ON C.id_cargo = E.fk_Cargo_id_cargo
GROUP BY O.Nome_orgao, C.Nome_cargo;

-- SOMA DOS SALÁRIOS
select sum(Salario) from Empregado;

-- SOMA DOS SALÁRIOS POR CARGO
select Nome_cargo, sum(Salario) from Empregado e, Cargo c
where e.fk_Cargo_id_cargo = c.id_Cargo
group by e.fk_Cargo_id_cargo;

-- SOMA DOS SALÁRIOS POR CARGO E ÓRGÃO
SELECT O.Nome_orgao, C.Nome_cargo, SUM(E.Salario) AS Soma_Salarios
FROM Orgao O
JOIN Contem ON O.id_orgao = Contem.fk_Orgao_id_orgao
JOIN Cargo C ON Contem.fk_Cargo_id_cargo = C.id_cargo
JOIN Empregado E ON C.id_cargo = E.fk_Cargo_id_cargo
GROUP BY O.Nome_orgao, C.Nome_cargo;

-- MÉDIA DOS SALÁRIOS POR SEXO
select sexo Sexo, avg(Salario) 'Média dos salários por sexo' from empregado group by sexo;

-- MÉDIA DOS SALÁRIOS POR ANO DE NASCIMENTO
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2005-08-09' WHERE (`Matricula` = '1');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2015-04-04' WHERE (`Matricula` = '2');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2005-12-29' WHERE (`Matricula` = '3');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2015-04-04' WHERE (`Matricula` = '4');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2005-08-09' WHERE (`Matricula` = '5');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2155-04-04' WHERE (`Matricula` = '6');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1952-12-29' WHERE (`Matricula` = '7');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1989-12-04' WHERE (`Matricula` = '8');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1954-08-09' WHERE (`Matricula` = '9');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1999-04-04' WHERE (`Matricula` = '10');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1999-12-29' WHERE (`Matricula` = '11');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2004-12-04' WHERE (`Matricula` = '12');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2003-08-09' WHERE (`Matricula` = '13');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2002-04-04' WHERE (`Matricula` = '14');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2001-12-29' WHERE (`Matricula` = '15');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2000-08-04' WHERE (`Matricula` = '16');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1995-08-09' WHERE (`Matricula` = '17');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1996-04-04' WHERE (`Matricula` = '18');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1997-12-29' WHERE (`Matricula` = '19');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1997-12-04' WHERE (`Matricula` = '20');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1997-08-09' WHERE (`Matricula` = '21');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2004-04-04' WHERE (`Matricula` = '22');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2003-12-29' WHERE (`Matricula` = '23');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2002-12-04' WHERE (`Matricula` = '24');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1994-08-09' WHERE (`Matricula` = '25');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1956-04-04' WHERE (`Matricula` = '26');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1999-12-29' WHERE (`Matricula` = '27');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '1999-01-04' WHERE (`Matricula` = '28');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2000-08-09' WHERE (`Matricula` = '29');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2004-04-04' WHERE (`Matricula` = '30');
UPDATE `exercicio_nando`.`Empregado` SET `dataNasc` = '2005-12-29' WHERE (`Matricula` = '31');

alter table Empregado
add column dataNasc date;

select * from Empregado;

select avg(Salario), year(dataNasc)
from Empregado
group by 2
order by 2;

-- CONTAGEM DE QUANTOS DEPENDENTES CADA EMPREGADO TEM
select e.nome, count(d.idDependente) 'Quantidade de dependentes'
from empregado e
left join dependente d on e.Matricula = d.fk_empregado_matricula
group by e.nome;

-- TODOS OS EMPREGADOS COM DEPENDENTES MENOR QUE UMA IDADE x
select e.nome, year(d.dt_nascimento) 'Ano de nascimento'
from empregado e
left join dependente d on e.Matricula = d.fk_Empregado_Matricula
where (DATEDIFF(NOW(), D.Dt_nascimento) / 365) < 20;
