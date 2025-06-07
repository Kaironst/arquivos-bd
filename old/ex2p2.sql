create table instituicao (
    CodI number,
    nome varchar2(255),
    constraint pkcodI primary key(codI)
);

create table habilitacao (
    codH number,
    nome varchar2(255),
    grau varchar2(255),
    natureza varchar2(255),
    constraint pkcodH primary key(codH)
);

create table curso (
    codI number,
    CodH number,
    duracao varchar2(255),
    constraint fkcursocodI foreign key(codI) references instituicao(codI),
    constraint fkcursocodH foreign key(codH) references habilitacao(codH),
    constraint ukcursocodI unique(codI),
    constraint ukcursocodH unique(codH)
);

create table egresso (
    codEg number,
    nome varchar2(255),
    email varchar2(255),
    foraarea varchar2(255),
    ramoativo varchar2(255),
    naturalidade varchar2(255),
    constraint pkcodEg primary key(codEg)
);

create table cursou (
    codI number,
    codH number,
    codEg number,
    dtini varchar2(10),
    dtfim varchar2(10),
    trabalhou varchar2(255),
    constraint fkcursoucodI foreign key(codI) references curso(codI),
    constraint fkcursoucodH foreign key(codH) references curso(codH),
    constraint fkcursoucodEg foreign key(codEg) references egresso(codEg),
    constraint ukcursoucodI unique(codI),
    constraint ukcursoucodH unique(codH),
    constraint ukcursoucodEg unique(codEg)
);

create table empresa (
    codEm number,
    nome varchar2(255),
    constraint pkcodEm primary key(codEm)
);

create table trabalha (
    codI number,
    codH number,
    codEg number,
    codEm number,
    ingresso varchar2(255),
    cargo varchar2(255),
    nome varchar2(255),
    constraint fktrabalhacodI foreign key(codI) references cursou(codI),
    constraint fktrabalhacodH foreign key(codH) references cursou(codH),
    constraint fktrabalhacodEg foreign key(codEg) references cursou(codEg),
    constraint fktrabalhacodEm foreign key(codEm) references empresa(codEm),
    constraint uktrabalhacodI unique(codI),
    constraint uktrabalhacodH unique(codH),
    constraint uktrabalhacodEg unique(codEg),
    constraint uktrabalhacodEm unique(codEm)
);

create table treinamento (
    codT number,
    nome varchar2(255),
    constraint pkcodt primary key(codT)
);

create table Treina (
    codI number,
    codH number,
    codEg number,
    codEm number,
    codT number,
    dtini varchar2(10),
    dtfim varchar2(10),
    constraint fktreinacodI foreign key(codI) references  trabalha(codI),
    constraint fktreinacodH foreign key(codH) references trabalha(codH),
    constraint fktreinacodEg foreign key(codEg) references trabalha(codEg),
    constraint fktreinacodEm foreign key(codEm) references trabalha(codEm),
    constraint fktreinacodT foreign key(codT) references treinamento(codT),
    constraint uktreinacodI unique(codI),
    constraint uktreinacodH unique(codH),
    constraint uktreinacodEg unique(codEg),
    constraint uktreinacodEm unique(codEm),
    constraint uktreinacodT unique(codT)
);

--select 'drop table '||table_name||' cascade constraints;' from user_tables;
