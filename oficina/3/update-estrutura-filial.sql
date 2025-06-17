-- Adicionando filial nas tabelas relevantes
alter table empregado add filial char(1);
alter table venda add filial char(1);

--alterando posição dos empregados
update empregado set filial = 'C' where cod between 1 and 2;
update empregado set filial = 'P' where cod between 3 and 4;
update empregado set filial = 'L' where cod = 5;

--criando as visões
create view vwempregado_curitiba as select * from empregado where filial='C';
create view vwempregado_palotina as select * from empregado where filial='P';
create view vwempregado_litoral as select * from empregado where filial='L';

GRANT SELECT ON vwempregado_curitiba TO CURITBA; --select view dava erro (acho q é pq estou usando o oracle 21)
GRANT SELECT ON vwempregado_palotina TO PALOTINA;
GRANT SELECT ON vwempregado_litoral TO LITORAL;

create synonym empregado for database.vwempregado_curitiba;
create synonym empregado for database.vwempregado_palotina;
create synonym empregado for database.vwempregado_litoral;