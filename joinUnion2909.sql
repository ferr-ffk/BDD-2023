use Empresa;

select * from Empregado;
select * from Dependente;

select * from Empregado e
left join Dependente d on e.Matricula = d.fk_Empregado_Matricula;

-- todos os empregados e seus dependentes
select d.idDependente, d.Nome_dependente, e.Matricula, e.Nome 
from Dependente d
inner join Empregado e on e.Matricula = d.fk_Empregado_Matricula;

-- todos os empregados com salarios menores que 1000 e todos os empregados com salarios maiores que 10000
select * 
from Empregado e
where e.Salario < 1000
union 
select * from Empregado e
where e.Salario > 10000;