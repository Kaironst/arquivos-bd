--select 'drop table '||table_name||' cascade constraints;' from user_tables;

create table empregado 
( 
    nome varchar2(255),  
    rua varchar2(255),  
    cidade varchar2(255),  
    dataNasc varchar2(10),  
    CPF number(11),  
    codE number,  
    RG number(10),  
    mae varchar2(255),  
    sexo char,
    constraint pkEmpregado primary key(codE),
    constraint ukCPF unique(CPF),
    constraint ukRG unique(RG),
    constraint ukEmpregado unique(nome,mae,dataNasc),
    constraint ckSexo check(sexo in('m''f'))
); 

create table companhia 
( 
    codC number,  
    nomeCompanhia varchar2(255),  
    cidade varchar2(255), 
    constraint pkcompanhia primary key(codC)
); 

create table trabalha 
( 
    salario number,  
    codE number,  
    codC number,
    constraint fktrabalhacodE foreign key(codE) references empregado(codE),
    constraint fktrabalhacodC foreign key (codC) references companhia(codC),
    constraint pktrabalha primary key(codE,codC)
); 