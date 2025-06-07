-- create table pessoa (codp integer, nome varchar(255), constraint pkcodp primary key(codp));

create or replace funcion teste_()
returns trigger as $$
    declare
        codnovo integer;
    begin
        if (TG_OP = 'INSERT') then
            select MAX(codp)+1 into codnovo from pessoa;
            :new.codp:=codnovo;
            :new.nome:=upper(:new.nome);
        elsif (TG_OP = 'UPDATE') then
            :new.nome:=upper(:new.nome);
        end if
        return new;
    end;
$$ language plpgsql;

create trigger teste_trigger
before insert or update on pessoa
for each row
execute function teste_trigger();