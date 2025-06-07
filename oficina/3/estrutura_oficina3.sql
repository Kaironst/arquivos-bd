--estrutura das tabelas

create table empregado (
    cod number,
    nome varchar2(100),
    tel number,
    sexo char,
    datanasc date,
    cpf number(11),
    rg number(10),
    mae varchar2(100),
    rua varchar2(100),
    cidade varchar2(100),
    uf varchar2(100),
    cep number(8),
    salario number,
    constraint pkEmpregado primary key(cod),
    constraint ukCpfEmpregado unique(cpf),
    constraint ukRgEmpregado unique(rg),
    constraint ukNomeMaeDataEmpregado unique(nome,mae,datanasc),
    constraint ckSexoEmpregado check (sexo in ('M','F'))
);

create table produto (
    cod number,
    nome varchar2(100),
    valor number,
    constraint pkProduto primary key(cod)
);

create table venda (
    codprod number,
    codemp number,
    qtde number,
    datahora timestamp,
    constraint pkVenda primary key(codprod,codemp),
    constraint fkCodprodVenda foreign key(codprod) references produto(cod),
    constraint fkCodempVenda foreign key(codemp) references empregado(cod)
);

create table gerente (
    codemp number,
    codger number,
    constraint pkGerente primary key(codemp,codger),
    constraint fkCodempGerente foreign key(codemp) references empregado(cod),
    constraint fkCodgerGerente foreign key(codger) references empregado(cod)
);

--tabelas de log
create table empregadoDeletadoLog (
    cod number,
    nome varchar2(100),
    tel number,
    sexo char,
    datanasc date,
    cpf number(11),
    rg number(10),
    mae varchar2(100),
    rua varchar2(100),
    cidade varchar2(100),
    uf varchar2(100),
    cep number(8),
    salario number,
    dataExclusao date,
    constraint pkEmpregadoLog primary key(cod)
);

create table produtoLog (
    cod number,
    nome varchar2(100),
    valor number,
    dataAlteracao date,
    constraint pkProdutoLog primary key(cod)
);

--sequences das tabelas
create sequence SqCodEmpregado
start with 1 increment by 1;

--triggers das tabelas
create or replace trigger CodMaiusculaEmpregado
before insert or update on empregado
for each row
BEGIN
    if inserting then
    select SqCodEmpregado.nextval into :new.cod from dual;
    end if;
    :new.nome:=upper(:new.nome);
    :new.sexo:=upper(:new.sexo);
    :new.mae:=upper(:new.mae);
    :new.rua:=upper(:new.rua);
    :new.cidade:=upper(:new.cidade);
    :new.uf:=upper(:new.uf);
END;
/

create or replace trigger logempregado
before delete on empregado
for each row
BEGIN
    insert into empregadoDeletadoLog values(
        :old.cod,
        :old.nome,
        :old.tel,
        :old.sexo,
        :old.datanasc,
        :old.cpf,
        :old.rg,
        :old.mae,
        :old.rua,
        :old.cidade,
        :old.uf,
        :old.cep,
        :old.salario,
        SYSDATE
    );
END;
/

create or replace trigger logProdutoEValorNaoDiminui
before update or delete on produto
for each row
BEGIN
    if (updating and :new.valor>:old.valor) or deleting then
    insert into produtoLog values(
        :old.cod,
        :old.nome,
        :old.valor,
        SYSDATE
    );
    else
    :new.valor:=:old.valor;
    end if;
    
END;
/

--indices das tabelas
create unique index indNomeEmpregado
on empregado(nome);

create unique index indNomeProduto
on produto(nome);

--functions das tabelas

-- oficina parte 2 - função de verificar isbn
create or replace function verificarIsbn(isbn in varchar2)
return varchar2
AS
soma number;
k number;
j number;
begin
    if (length(isbn)<>10) then return('invalido'); end if;
   -- penultimo := TO_NUMBER(SUBSTR(isbn,10,1));
   -- ultimo := TO_NUMBER(SUBSTR(isbn,11,1));
    k:=1;
    j:=10;
    soma:=0;
    WHILE k<10 LOOP
        DBMS_OUTPUT.PUT_LINE('soma atual '|| soma);
        soma:=soma+j*(TO_NUMBER(SUBSTR(isbn,k,1)));
        k:=k+1;
        j:=j-1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('soma atual '|| soma);
    soma:=mod(soma,11);
    if soma>10 then soma:=0;
    else soma:=11-soma; end if;
    DBMS_OUTPUT.PUT_LINE('digito recebido ' || soma || ' esperado: ' || (TO_NUMBER(SUBSTR(isbn,10,1))));
    if soma<>(TO_NUMBER(SUBSTR(isbn,10,1))) then return('invalido'); end if;
    return('valido');

end;
/
--escrever set serveroutput on para mostrar os printlns
--select verificarIsbn('1841462012') from dual;

