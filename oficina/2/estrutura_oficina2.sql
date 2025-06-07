-- estrutura da tabela

create table empregado (
    codE number(5),
    nome varchar2(50),
    rua varchar2(50),
    cidade varchar2(50),
    dt_nasc date,
    cpf number(11),
    rg varchar2(20),
    mae varchar2(50),
    sexo char(1),
    constraint pkempregado primary key(codE),
    constraint ukempregado unique(nome,dt_nasc,mae),
    constraint ukempregadocpf unique(cpf),
    constraint ukempregadorg unique(rg),
    constraint cksexo check (sexo in('m','f','M','F'))
);

create table companhia (
    codC number(5),
    nome varchar2(50),
    cidade varchar2(30),
    constraint pkcompanhia primary key(codC)
);

create table trabalha (
    codE number(5),
    codC number(5),
    salario number(8),
    constraint pktrabalha primary key(codE,codC),
    constraint fktrabalhaempregado foreign key(codE) references empregado(codE),
    constraint fktrabalhacompanhia foreign key(codC) references companhia(codC)
);

create table logSalario (
    codLog number(5),
    codE number(5),
    codC number(5),
    salarioAntigo number(8),
    salarioNovo number(8),
    dataAlteração date,
    constraint pklogSalario primary key(codLog)
);

create table gerente (
    codG number(5),
    codE number(5),
    constraint pkgerente primary key(codE,codG),
    constraint fkempempger foreign key(codE) references empregado(codE),
    constraint fkempger foreign key(codG) references  empregado(codE)
);

--sequences das tabelas
create sequence sqcodLog
    start with 1 increment by 1;
create sequence sqcodE
    start with 1 increment by 1;
create sequence sqcodC
    start with 1 increment by 1;
--triggers das tabelas
create or replace trigger sqcodE_
before insert on empregado
for each row
    begin
        select sqcodE.nextval into :new.codE from dual;
        :new.nome:=upper(:new.nome);
        :new.rua:=upper(:new.rua);
        :new.cidade:=upper(:new.cidade);
        :new.rg:=upper(:new.rg);
        :new.mae:=upper(:new.mae);
        :new.sexo:=upper(:new.sexo);
    end;
/

create or replace trigger sqcodC_
before insert on companhia
for each row
    begin
        select sqcodC.nextval into :new.codC from dual;
        :new.nome:=upper(:new.nome);
        :new.cidade:=upper(:new.cidade);

    end;
/


    /*
estrutura da tabela de log
create table logSalario (
codLog number(5),
codE number(5),
codC number(5),
salarioAntigo number(8),
salarioNovo number(8),
dataAlteração date
constraint pklogSalario primary key(codLog),
);
*/

create or replace trigger createLogSalario
before update or delete on trabalha
for each row
    begin
        if updating then
            insert into logSalario values (
                sqcodLog.nextval,
                :old.codE,
                :old.codC,
                :old.salario,
                :new.salario,
                SYSDATE
            );
        else
            insert into logSalario values (
                sqcodLog.nextval,
                :old.codE,
                :old.codC,
                :old.salario,
                0,
                SYSDATE
            );
        end if;

    end;
/

create or replace trigger salarioNaoDiminui
before update on trabalha
for each row
    begin
        if :new.salario<:old.salario then
            :new.salario:=:old.salario;
        end if;
    end;
/    

--insert into companhia (nome,cidade) values ('joe negocios','nem sei mais');