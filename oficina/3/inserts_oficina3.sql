insert into produto (cod,nome,valor) values (1,'pão fatiado', 10);
insert into produto (cod,nome,valor) values (2,'sabão em pó', 20);
insert into produto (cod,nome,valor) values (3,'cereal', 15);
insert into produto (cod,nome,valor) values (4,'leite', 5);
insert into produto (cod,nome,valor) values (5,'queijo', 7);
insert into produto (cod,nome,valor) values (6,'mortadela', 7);
insert into produto (cod,nome,valor) values (7,'arroz', 10);
insert into produto (cod,nome,valor) values (8,'macarrão', 10);
insert into produto (cod,nome,valor) values (9,'detergente', 10);
insert into produto (cod,nome,valor) values (10,'pizza congelada', 20);
insert into produto (cod,nome,valor) values (11,'bala de goma', 7);
insert into produto (cod,nome,valor) values (12,'chiclete', 5);
insert into produto (cod,nome,valor) values (13,'farinha', 5);
insert into produto (cod,nome,valor) values (14,'açucar', 5);
insert into produto (cod,nome,valor) values (15,'sal', 5);
insert into produto (cod,nome,valor) values (16,'manteiga', 5);

insert into empregado (nome,tel,sexo,datanasc,cpf,rg,mae,rua,cidade,uf,cep,salario) values ('joaquim silvestre',999999999,'m','20/10/1995',11111111111,1111111111,'janaina silvestre','rua dos empregados','cidade dos empregados','SP',83540000,5000);
insert into empregado (nome,tel,sexo,datanasc,cpf,rg,mae,rua,cidade,uf,cep,salario) values ('ana da costa',999999999,'f','21/03/1990',22222222222,2222222222,'mariana da costa','rua dos empregados','cidade dos empregados','SP',83540000,2550);
insert into empregado (nome,tel,sexo,datanasc,cpf,rg,mae,rua,cidade,uf,cep,salario) values ('fulano de tal',999999999,'m','31/10/2000',33333333333,3333333333,'fulana de tal','rua dos empregados','cidade dos empregados','SP',83540000,2100);
insert into empregado (nome,tel,sexo,datanasc,cpf,rg,mae,rua,cidade,uf,cep,salario) values ('eu mesmo',999999999,'m','18/06/1999',44444444444,4444444444,'minha mãe','rua dos empregados','SP','cidade dos empregados',83540000,2500);
insert into empregado (nome,tel,sexo,datanasc,cpf,rg,mae,rua,cidade,uf,cep,salario) values ('irmão do joaquim',999999999,'m','19/07/1989',55555555555,5555555555,'janaina silvestre','rua dos empregados','SP','cidade dos empregados',83540000,3000);


insert into venda (codprod,codemp,qtde,datahora) values (1,2,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (2,2,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (3,2,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (4,2,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (5,3,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (6,3,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (7,3,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (8,3,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (9,4,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (10,4,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (11,4,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (12,4,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (13,5,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (14,5,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (15,5,1,SYSDATE);
insert into venda (codprod,codemp,qtde,datahora) values (16,5,1,SYSDATE);

insert into gerente (codemp,codger) values (1,2);
insert into gerente (codemp,codger) values (1,3);
insert into gerente (codemp,codger) values (1,4);
insert into gerente (codemp,codger) values (1,5);


