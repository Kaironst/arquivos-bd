create or replace function verificarCpf(cpf in varchar2)
return varchar2
AS
soma number;
k number;
j number;
begin
   -- penultimo := TO_NUMBER(SUBSTR(cpf,10,1));
   -- ultimo := TO_NUMBER(SUBSTR(cpf,11,1));
    k:=1;
    j:=10;
    soma:=0;
    WHILE k<10 LOOP
        DBMS_OUTPUT.PUT_LINE('soma atual '|| soma);
        soma:=soma+j*(TO_NUMBER(SUBSTR(cpf,k,1)));
        k:=k+1;
        j:=j-1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('soma atual '|| soma);
    soma:=mod(soma,11);
    if soma>10 then soma:=0;
    else soma:=11-soma; end if;
    DBMS_OUTPUT.PUT_LINE('digito recebido ' || soma || ' esperado: ' || (TO_NUMBER(SUBSTR(cpf,10,1))));
    if soma<>(TO_NUMBER(SUBSTR(cpf,10,1))) then return('invalido'); end if;

    k:=1;
    j:=11;
    soma:=0;
    WHILE k<11 LOOP
        DBMS_OUTPUT.PUT_LINE('soma atual '|| soma);
        soma:=soma+j*(TO_NUMBER(SUBSTR(cpf,k,1)));
        k:=k+1;
        j:=j-1;
    END LOOP;
    soma:=mod(soma,11);
    soma:=11-soma;
    DBMS_OUTPUT.PUT_LINE('digito recebido ' || soma || ' esperado: ' || (TO_NUMBER(SUBSTR(cpf,11,1))));
    if soma<>(TO_NUMBER(SUBSTR(cpf,11,1)))  then return('invalido'); end if;
    return('valido');
end;
/
--escrever set serveroutput on para mostrar os printlns
--select verificarCpf('10598778993') from dual;
