create table func (
    codf number,
    nome varchar2(255),
    constraint pkcodf primary key(codf)
);
 
create table telefones (
    codf number,
    telefone number,
    constraint fktelefonescodf foreign key(codf) references func(codf)
);

create table dep (
    codf number,
    nome varchar2(255),
    datanasc varchar2(10),
    sexo char,
    constraint fkdepcodf foreign key(codf) references func(codf),
    constraint pkdepcodf primary key(codf)
);


create table depto (
    codd number,
    nome varchar2(255),
    constraint pkcodd primary key(codd)
);

create table adm (
    codf number,
    codd number,
    HE number,
    HS number,
    constraint fkadmcodf foreign key(codf) references func(codf),
    constraint fkadmcodd foreign key(codd) references depto(codd),
    constraint pkadmcodf primary key(codf)
);

create table car (
    placa number,
    marca varchar2(255),
    constraint pkplaca primary key(placa)
);

create table agenda (
    codf number,
    placa number,
    kms number,
    kmc number,
    dthrs number,
    dthrc number,
    constraint fkagendacodf foreign key(codf) references adm(codf),
    constraint fkagendaplaca foreign key(placa) references car(placa)
);


create table prod (
    codf number,
    maquina number,
    constraint fkprodcodf foreign key(codf) references func(codf),
    constraint pkprodcodf primary key(codf)
);

create table peca (
    codp number,
    nome varchar2(255),
    constraint pkcodp primary key(codp)
);

create table lote (
    codf number,
    codp number,
    qtde number,
    dthrp number,
    constraint fklotecodf foreign key(codf) references prod(codf),
    constraint fklotecodp foreign key(codp) references peca(codp),
    constraint uklotecodf unique(codf),
    constraint uklotecodp unique(codp)
);

create table cliente (
    codc number,
    nome varchar2(255),
    constraint pkcodc primary key(codc)
);

create table compra (
    codf number,
    codp number,
    codc number,
    qtde number,
    dthrc number,
    constraint fkcompracodf foreign key(codf) references lote(codf),
    constraint fkcompracodp foreign key(codp) references lote(codp),
    constraint fkcompracodc foreign key(codc) references cliente(codc)
);