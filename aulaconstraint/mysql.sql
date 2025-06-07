-- CREATE TABLE pessoa (codp SERIAL PRIMARY KEY, nome VARCHAR(255));

delimiter $$
    create trigger teste_
    before insert on pessoa
    for each row
        begin
            declare codnovo int;

            if new.codp is null then --checagem se é insert
                select MAX(codp)+1 into codnovo from pessoa
                set new.codp = codnovo;
            end if
            set new.nome = upper(new.nome);
        end$$
delimiter;