CREATE TABLE cliente (
codc number,
constraint pkcodc PRIMARY KEY(codc)
);

CREATE TABLE empresa (
code number,
constraint pkcode PRIMARY KEY(code);
);

CREATE TABLE pertence (
codc
code
datapag
valorpag
constraint fkcodc FOREIGN KEY (codc) REFERENCES cliente(codc)
constraint fkcode FOREIGN KEY (code) REFERENCES  empresa(code)
constraint pkpertence PRIMARY KEY(codc,code)
);


CREATE TABLE pessoa (
    codp number,
    cpf number,
    rg number,
    nasc varchar2(10),
    sexo char,
    cidade varchar2(255),
    codpai number,
    constraint pkcodp primary key(codp)
);

ALTER TABLE pessoa ADD CONSTRAINT fkcodpai foreign key(codpai) references pessoa(codp);