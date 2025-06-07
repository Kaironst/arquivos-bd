create table curso (
    cod_curso number(5),
    nome varchar2(50),
    horas number(5),
    constraint pkcurso primary key (cod_curso)
);

create table aluno (
    cod_aluno number(5), nome varchar2(50),dt_nasc date,
    mae varchar2(50),sexo char(1), curso number(5),
    constraint pkaluno primary key (cod_aluno),
    constraint ukaluno unique(nome, dt_nasc, mae),
    constraint sexo check (sexo in('m','f')),
    constraint fkcursoaluno foreign key (curso) references curso(cod_curso)
);

Create or replace trigger tgCurso
Before insert or update on Curso
For each row
Declare
Novo_cod number(5);
Begin
    If inserting then 
        Select max(cod_curso) + 1 into novo_cod from curso;
        :new.Cod_curso := novo_cod; 
        :new.nome := (upper(:new.nome));
    Elsif updating then
    :new.nome := (upper(:new.nome));
    End if;
End; 