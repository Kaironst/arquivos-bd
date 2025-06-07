--COMPANHIA

INSERT INTO COMPANHIA (NOME, CIDADE) VALUES ('VOLVO', 'CURITIBA');

insert into empregado(nome, rua, cidade, dt_nasc) values ('Joao da Silva', 'Rua 1', 'Curitiba', '10/10/1987');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1000 FROM (SELECT codE AS CodE FROM empregado where nome= 'JOAO DA SILVA'), (SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO' AND cidade = 'CURITIBA'));

insert into empregado(nome, rua, cidade, dt_nasc) values ('Mauricio Turion', 'Rua 1', 'Curitiba', '04/07/1985');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1300 FROM (SELECT codE AS CodE FROM empregado where nome= 'MAURICIO TURION'), (SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO' AND cidade = 'CURITIBA'));

insert into empregado(nome, rua, cidade, dt_nasc) values ('Marcos Atheros', 'Rua Wire', 'Araucária', '26/03/1971');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1300 FROM (SELECT codE AS CodE FROM empregado where nome= 'MARCOS ATHEROS'), (SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO' AND cidade = 'CURITIBA'));

insert into empregado(nome, rua, cidade, dt_nasc) values ('Nathalia Nokia', 'Rua 47', 'Curitiba', '07/06/1990');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1100 FROM (SELECT codE AS CodE FROM empregado where nome= 'NATHALIA NOKIA'), (SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO' AND cidade = 'CURITIBA'));

INSERT INTO gerente (codG, codE) (SELECT DISTINCT GERENTE, emp FROM (select codE AS gerente from empregado where nome = 'JOAO DA SILVA'), (select codE AS EMP from empregado where nome IN ('MAURICIO TURION', 'MARCOS ATHEROS', 'NATHALIA NOKIA')));



insert into empregado(nome, rua, cidade, dt_nasc) values ('Ana Nora', 'Rua Abacateiro', 'Colombo', '07/06/1990');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1200 FROM (SELECT codE AS CodE FROM empregado where nome= 'ANA NORA'), (SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO' AND cidade = 'CURITIBA'));

insert into empregado(nome, rua, cidade, dt_nasc) values ('Joana Maria', 'Rua Abacateiro', 'Colombo', '07/06/1990');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1000 FROM (SELECT codE AS CodE FROM empregado where nome= 'JOANA MARIA'), (SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO' AND cidade = 'CURITIBA'));

insert into empregado(nome, rua, cidade, dt_nasc) values ('Joao Maria', 'Rua Abacateiro', 'Colombo', '07/06/1980');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1000 FROM (SELECT codE AS CodE FROM empregado where nome= 'JOAO MARIA'), (SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO' AND cidade = 'CURITIBA'));

insert into empregado(nome, rua, cidade, dt_nasc) values ('Mariana', 'Rua Morango', 'Colombo', '07/06/1984');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1000 FROM (SELECT codE AS CodE FROM empregado where nome= 'MARIANA'), (SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO' AND cidade = 'CURITIBA'));

INSERT INTO gerente (SELECT DISTINCT GERENTE, emp FROM (select codE AS gerente from empregado where nome = 'ANA NORA'), (select codE AS EMP from empregado where nome IN ('JOANA MARIA', 'JOAO MARIA', 'MARIANA')));



INSERT INTO COMPANHIA (NOME, CIDADE) VALUES ('BOSCH', 'São Paulo');

insert into empregado(nome, rua, cidade, dt_nasc) values ('Maria Mia', 'Avenida Paulista', 'São Paulo', '13/09/1987');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1000 FROM (SELECT codE AS CodE FROM empregado where nome= upper ('Maria Mia')), (SELECT codc AS Codc FROM companhia WHERE NOME = 'BOSCH' AND cidade = 'SÃO PAULO'));

insert into empregado(nome, rua, cidade, dt_nasc) values ('Erick Crisal', 'Avenida Paulista', 'São Paulo', '14/02/1985');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1000 FROM (SELECT codE AS CodE FROM empregado where nome= upper ('Erick Crisal')), (SELECT codc AS Codc FROM companhia WHERE NOME = 'BOSCH' AND cidade = 'SÃO PAULO'));

insert into empregado(nome, rua, cidade, dt_nasc) values ('Carlos Crisal', 'Avenida Paulista', 'São Paulo', '14/02/1988');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1000 FROM (SELECT codE AS CodE FROM empregado where nome= upper ('Carlos Crisal')), (SELECT codc AS Codc FROM companhia WHERE NOME = 'BOSCH' AND cidade = 'SÃO PAULO'));

INSERT INTO gerente (SELECT DISTINCT GERENTE, emp FROM (select codE AS gerente from empregado where nome = upper('Maria Mia')), (select codE AS EMP from empregado where nome IN ((upper('Erick Crisal')), (upper('Carlos Crisal')))));



INSERT INTO COMPANHIA (NOME, CIDADE) VALUES ('BOSCH', 'CURITIBA');

insert into empregado(nome, rua, cidade, dt_nasc) values ('Joao 2', 'Rua 1', 'Curitiba', '10/10/1987');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1000 FROM (SELECT codE AS CodE FROM empregado where nome= upper ('Joao 2')), (SELECT codc AS Codc FROM companhia WHERE NOME = 'BOSCH' AND cidade = 'CURITIBA'));

insert into empregado(nome, rua, cidade, dt_nasc) values ('Mauricio Antonio', 'Rua 64 bits', 'Curitiba', '04/07/1985');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1000 FROM (SELECT codE AS CodE FROM empregado where nome= upper ('Mauricio Antonio')), (SELECT codc AS Codc FROM companhia WHERE NOME = 'BOSCH' AND cidade = 'CURITIBA'));

INSERT INTO gerente (SELECT DISTINCT GERENTE, emp FROM (select codE AS gerente from empregado where nome = upper('Joao 2')), (select codE AS EMP from empregado where nome IN ((upper('Mauricio Antonio')))));



INSERT INTO COMPANHIA (NOME, CIDADE) VALUES ('BOSCH', 'BLUMENAU');

insert into empregado(nome, rua, cidade, dt_nasc) values ('Marcos At', 'Rua Quente', 'Blumenau', '26/03/1990');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 1000 FROM (SELECT codE AS CodE FROM empregado where nome= upper ('Marcos At')), (SELECT codc AS Codc FROM companhia WHERE NOME = 'BOSCH' AND cidade = 'BLUMENAU'));



INSERT INTO COMPANHIA (NOME, CIDADE) VALUES ('FIRST BANK CORPORATION', 'CURITIBA');

insert into empregado(nome, rua, cidade, dt_nasc) values ('Carlos Eduardo', 'Rua XV de Novembro', 'Curitiba', '10/10/1992');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 950 FROM (SELECT codE AS CodE FROM empregado where nome= upper ('Carlos Eduardo')), (SELECT codc AS Codc FROM companhia WHERE NOME = 'FIRST BANK CORPORATION' AND cidade = 'CURITIBA'));

insert into empregado(nome, rua, cidade, dt_nasc) values ('José Pedro Silveira', 'Avenida Principal',  'São José dos Pinhais', '05/09/1989');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 800 FROM (SELECT codE AS CodE FROM empregado where nome= upper ('José Pedro Silveira')), (SELECT codc AS Codc FROM companhia WHERE NOME = 'FIRST BANK CORPORATION' AND cidade = 'CURITIBA'));

insert into empregado(nome, rua, cidade, dt_nasc) values ('Feliciano Radeon', 'Avenida Batel', 'Curitiba', '12/08/1968');

insert into trabalha (codE, CodC, salario) (SELECT DISTINCT code, codc, 800 FROM (SELECT codE AS CodE FROM empregado where nome= upper ('Feliciano Radeon')), (SELECT codc AS Codc FROM companhia WHERE NOME = 'FIRST BANK CORPORATION' AND cidade = 'CURITIBA'));

INSERT INTO gerente (SELECT DISTINCT GERENTE, emp FROM (select codE AS gerente from empregado where nome = upper('Carlos Eduardo')), (select codE AS EMP from empregado where nome IN ((upper('José Pedro Silveira')), (upper('Feliciano Radeon')))));