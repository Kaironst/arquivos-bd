--^1
select t.code as cod_empregado, e.nome as empregado, t.codc as cod_companhia, c.nome as companhia
from trabalha t, empregado e, companhia c 
where e.code=t.code and c.codc=t.codc;

--^2
select t.code as cod_empregado, e.nome as empregado, t.codc as cod_companhia, c.nome as companhia
from trabalha t 
inner join empregado e on e.code=t.code
inner join companhia c on c.codc=t.codc;

--^3
select t.code as cod_empregado, e.nome as empregado, t.codc as cod_companhia, c.nome as companhia
from trabalha t 
full join empregado e on e.code=t.code
inner join companhia c on c.codc=t.codc;

--^4
select t.code as cod_empregado, e.nome as empregado, t.codc as cod_companhia, c.nome as companhia
from trabalha t 
full join empregado e on e.code=t.code
full join companhia c on c.codc=t.codc;

--^5
/* 
??????
*/

--^6
select code, nome, cidade 
from empregado 
where cidade in ('CURITIBA','PINHAIS','COLOMBO','ARAUCARIA');

--^7
select code, nome, cidade 
from empregado where 
cidade not in ('COLOMBO','ARAUCARIA');


--^8
select code, nome, SUBSTR(cpf,10) as verificador
from empregado;
--* inserindo um cpf de teste a um dos empregados empregados que não tem
--* update empregado set cpf=11111111111 where code=30;

--^9
select code, nome 
from empregado 
where nome like '%SILVA%';

--^10
select t.code as cod_empregado, e.nome as empregado, e.cidade as cidade, c.nome as companhia
from trabalha t 
inner join empregado e on e.code=t.code
inner join companhia c on c.codc=t.codc
where c.nome='VOLVO';

--^11
select t.code as cod_empregado, e.nome as empregado, e.cidade as cidade, c.nome as companhia
from trabalha t 
inner join empregado e on e.code=t.code
inner join companhia c on c.codc=t.codc
where c.nome<>'VOLVO';

--^12
select t.code as cod_empregado, e.nome as empregado, e.cidade as cidade, c.nome as companhia
from trabalha t 
inner join empregado e on e.code=t.code
inner join companhia c on c.codc=t.codc
where c.nome='VOLVO'
UNION
select t.code as cod_empregado, e.nome as empregado, e.cidade as cidade, c.nome as companhia
from trabalha t 
inner join empregado e on e.code=t.code
inner join companhia c on c.codc=t.codc
where c.nome='BOSCH';

--^13
select code, nome, floor((select months_between(TRUNC(sysdate), dt_nasc)/12 from dual)) as idade from empregado
where (select floor(months_between(TRUNC(sysdate), dt_nasc)/12) from dual) not between 25 and 50;

--^14
select code, nome, cidade, floor((select months_between(TRUNC(sysdate), dt_nasc)/12 from dual)) as idade from empregado
where (select floor(months_between(TRUNC(sysdate), dt_nasc)/12) from dual) between 30 and 50 and cidade='CURITIBA';

--^15
update trabalha 
set salario=salario*1.10
where codc = (select codc from companhia where nome='VOLVO');
--* para checagem
select t.code as cod_empregado, e.nome as empregado, t.salario as salario, t.codc as cod_companhia, c.nome as companhia
from trabalha t 
inner join empregado e on e.code=t.code
inner join companhia c on c.codc=t.codc
where c.nome='VOLVO';

--^16
update trabalha 
set salario=salario*1.10
where code = (select code from empregado where cidade='BLUMENAU');
--* para checagem
select t.code as cod_empregado, e.nome as empregado, t.salario as salario, t.codc as cod_companhia, e.cidade as cidade
from trabalha t 
inner join empregado e on e.code=t.code
inner join companhia c on c.codc=t.codc
where e.cidade='BLUMENAU';

--^17
delete from trabalha
where code = (select codc from compahnia where nome='FALIDA XX CORPORATION');
    --* isso já vai fazer com que os dados sejam guardados no log pelo trigger createLogSalario
/*
estrutura da tabela companhiaFalida
create table companhiaFalida (
    codC number(5),
    nome varchar2(50),
    cidade varchar2(30),
    constraint pkcompanhiafalida primary key(codC)
);
*/
insert into companhiaFalida
    select * from companhia
    where nome='FALIDA XX CORPORATION';
delete from companhia
where nome='FALIDA XX CORPORATION';

--^18
select t.codc as cod_comp, c.nome as companhia, e.nome as empregado, t.salario as salario, media.salario as mediasalario
from companhia c
inner join trabalha t on t.codc=c.codc
inner join empregado e on e.code=t.code
inner join 
    (
    select codc, AVG(salario) as salario
    from trabalha
    group by codc
    )
    media on media.codc=t.codc
where t.salario>media.salario;
--deve ter alguma forma mais conveniente de fazer isso mas criar uma tabela imaginária para dar join foi tudo no que consegui pensar

select t.codc as cod_comp, c.nome as companhia, e.nome as nome, t.salario as salario,
avg(t.salario) over (partition by t.codc) as salariomedio
from companhia c
inner join trabalha t on t.codc=c.codC
inner join empregado e on e.code=t.code
where t.salario>avg(t.salario) over (partition by t.codc); --da erro
--sabia que tinha, mas para usar isso no where precisa de uma subquery de qualquer forma

select * from
    (
    select t.codc as cod_comp, c.nome as companhia, e.nome as nome, t.salario as salario,
    avg(t.salario) over (partition by t.codc) as salariomedio
    from companhia c
    inner join trabalha t on t.codc=c.codC
    inner join empregado e on e.code=t.code
    ) dados
where dados.salario>dados.salariomedio;
--ainda sim fica mais bonito desse jeito

--^19
select e.nome, e.cidade, e.rua, t.salario*12 as salarioanual 
from empregado e
inner join trabalha t on t.code=e.code
inner join companhia c on c.codc=t.codc
where c.nome='VOLVO' and t.salario*12 between 10000 and 20000;

--^20
select e.nome, e.cidade, c.cidade 
from empregado e
inner join trabalha t on t.code=e.code
inner join companhia c on c.codc=t.codc
where e.cidade=c.cidade;


--^21
--with as acaba sendo bem conveniente
with mediabosch as (
    select avg(t.salario) as mediasalario
    from trabalha t
    inner join companhia c on c.codc=t.codc
    where c.nome='BOSCH'
    group by c.nome
)
select e.nome as nome, c.nome as companhia, t.salario as salario, (select * from mediabosch) as mediabosch
from trabalha t
inner join companhia c on c.codc=t.codc
inner join empregado e on e.code=t.code
where c.nome='BOSCH' and salario>(select * from mediabosch);

--^22
with mediaanual as (
    select t.codc, avg(12*t.salario) as mediasalario
    from trabalha t
    group by t.codc
)
select c.nome as companhia, c.cidade,media.mediasalario
from companhia c
inner join mediaanual media on media.codc=c.codc
where media.mediasalario between 20000 and 30000;

--^23
with mediacompanhia as (
    select t.codc, avg(t.salario) as mediasalario
    from trabalha t
    group by t.codc
)
select e.nome, c.nome as companhia, t.salario
from companhia c
inner join trabalha t on t.codc=c.codC
inner join empregado e on e.code=t.code
inner join mediacompanhia media on media.codc=c.codc
where t.salario>media.mediasalario;

--^24
with mediavolvo as (
    select avg(t.salario) as mediasalario
    from trabalha t
    inner join companhia c on c.codc=t.codc
    where c.nome='VOLVO'
    group by c.nome
)
select e.nome as nome, c.nome as companhia, t.salario as salario, (select * from mediavolvo) as mediavolvo
from trabalha t
inner join companhia c on c.codc=t.codc
inner join empregado e on e.code=t.code
where c.nome='VOLVO' and salario>(select * from mediavolvo);

--^25
with folhapagamento as (
    select t.codc, sum(t.salario) as pagamento
    from trabalha t
    group by t.codc
)
select min(pagamento) as valor
from folhapagamento
union
select max(pagamento)
from folhapagamento;

--^26
with mediacompanhia as (
    select t.codc, avg(t.salario) as mediasalario
    from trabalha t
    inner join companhia c on c.codc=t.codc
    group by t.codc
)
select max(mediasalario) as mediasalarial
from mediacompanhia;

--^27
with numempregados as (
    select t.codc, count(t.code) as empregados
    from trabalha t
    group by t.codc
)
select c.nome, c.codc, num.empregados 
from companhia c
inner join numempregados num on num.codc=c.codc;

--^28
select g.code, e.nome, g.codg, gg.nome
from gerente g
inner join empregado e on g.code=e.code
inner join empregado gg on g.codg=gg.code
where gg.cidade=e.cidade and gg.rua=e.rua;

--^29
with cidadesbosch as (
    select c.cidade as cidade
    from companhia c
    where c.nome='BOSCH'
)
select c.nome, c.cidade
from companhia c
where c.cidade in((select * from cidadesbosch));

--^30
with mediacompanhia as (
    select t.codc, avg(t.salario) as mediasalario
    from trabalha t
    inner join companhia c on c.codc=t.codc
    group by t.codc
)
select min(mediasalario) as mediasalarial
from mediacompanhia
union
select max(mediasalario)
from mediacompanhia;

--^31
update trabalha 
set salario=case
    when salario>100000 then salario*1.03 
    else salario*1.10 
end
where codc = (select codc from companhia where nome='VOLVO');

--^32
update trabalha 
set salario=case
    when codc in ((select codc from companhia where nome='BOSCH')) then salario*1.10 
    else salario*1.05 
end
where codc in ((select codc from companhia where nome in ('VOLVO','BOSCH')));

--^33
with idadeemp as (
    select e.code, floor(months_between(TRUNC(sysdate), e.dt_nasc)/12) as idade
    from empregado e
)
select distinct c.nome, max(idade.idade) over (partition by t.codc) as idade
from companhia c
inner join trabalha t on t.codc=c.codc
inner join empregado e on e.code=t.code
inner join idadeemp idade on idade.code=e.code;
