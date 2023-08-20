use exercicio_nando;

insert into Cargo
values 
	(1, 'Professor'),
	(2, 'Professor Substituto'),
	(3, 'Faxineiro'),
	(4, 'Coordenador'),
	(5, 'Monitor');
    
select * from cargo;    

-- 3 orgãos

insert into Orgao (id_orgao, nome_orgao, sigla_orgao)
values 
	(1, 'CAC', 'CAC'),
    (2, 'URH', 'URH'),
    (3, 'ALD', 'ALD');

-- contem (?)

-- 30 empregados

insert into empregado(Matricula, Nome, CPF, Telefone, Salario)
values 	
    (2, 'Maria Santos', '23456789012', '23456789012', 2800.00),
    (3, 'Pedro Oliveira', '34567890123', '34567890123', 2300.00),
    (4, 'Fernanda Souza', '45678901234', '45678901234', 2700.00),
    (5, 'Ricardo Lima', '56789012345', '56789012345', 3000.00),
    (6, 'Carla Martins', '67890123456', '67890123456', 2200.00),
    (7, 'Gustavo Pereira', '78901234567', '78901234567', 2600.00),
    (8, 'Lúcia Rodrigues', '89012345678', '89012345678', 2800.00),
    (9, 'Marcos Silva', '90123456789', '90123456789', 2400.00),
    (10, 'Sandra Oliveira', '98765432109', '98765432109', 3200.00),
    (11, 'Fábio Santos', '87654321098', '87654321098', 2900.00),
    (12, 'Isabela Pereira', '76543210987', '76543210987', 2700.00),
    (13, 'Paulo Oliveira', '65432109876', '65432109876', 2500.00),
    (14, 'Mariana Lima', '54321098765', '54321098765', 3100.00),
    (15, 'Roberto Martins', '43210987654', '43210987654', 2800.00),
    (16, 'Juliana Rodrigues', '32109876543', '32109876543', 2300.00),
    (17, 'Mateus Souza', '21098765432', '21098765432', 2600.00),
    (18, 'Camila Pereira', '10987654321', '10987654321', 2900.00),
    (19, 'Antônio Lima', '98765432101', '98765432101', 2400.00),
    (20, 'Larissa Santos', '87654321098', '87654321098', 3200.00),
    (21, 'Rafael Silva', '76543210987', '76543210987', 2900.00),
    (22, 'Natália Oliveira', '65432109876', '65432109876', 2700.00),
    (23, 'Leonardo Pereira', '54321098765', '54321098765', 2500.00),
    (24, 'Amanda Lima', '43210987654', '43210987654', 3100.00),
    (25, 'Daniel Martins', '32109876543', '32109876543', 2800.00),
    (26, 'Beatriz Rodrigues', '21098765432', '21098765432', 2300.00),
    (27, 'Rodrigo Souza', '10987654321', '10987654321', 2600.00),
    (28, 'Cristina Pereira', '98765432101', '98765432101', 2900.00),
    (29, 'José Lima', '87654321098', '87654321098', 2400.00),
    (30, 'Fernanda Santos', '76543210987', '76543210987', 3200.00);

select * from empregado;

-- 17 dependentes