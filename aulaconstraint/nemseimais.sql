-- create table pessoa (codp number, nome varchar2(255), constraint pkpessoa primary key(codp));

create or replace trigger teste_
before insert or update on pessoa
for each row
    declare
        codnovo number;
    BEGIN
        if inserting then
            select Max(codp)+1 into codnovo from pessoa;
            :new.codp:=codnovo;
            :new.nome:=(upper(:new.nome));
        elsif updating then
            :new.nome:=(upper(:new.nome));
        end if;
    END;
/
show errors trigger teste_;
