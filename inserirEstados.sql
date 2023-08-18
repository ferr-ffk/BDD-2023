use posto;

alter table estado
rename column nome_estador to nome_estado;

insert into estado(nome_estado)
values 
	('Acre'),
	('Alagoas'),
	('Sergipe'),
	('Rondonia'),
	('Roraima'),
	('Pará'),
	('Amazonas'),
	('Tocantins'),
	('Maranhão'),
    ('Ceará'),
    ('Piauí'),
    ('Bahia'),
    ('Rio Grande do Norte'),
    ('Rio Grande do Sul'),
    ('Minas Gerais'),
    ('Mato Grosso'),
    ('Mato Grosso do Sul'),
    ('Espirito Santo'),
    ('Rio de Janeiro'),
    ('Pernambuco'),
    ('Paraná'),
    ('Santa Catarina'),
    ('Goiás'),
    ('Distrito Federal'),
    ('Paraiba'),
    ('Amapa'),
    ('Sao Paulo');
    
select * from estado;





