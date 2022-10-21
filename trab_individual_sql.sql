--drop table if exists cardapio,bairro, cidade, cliente, compra, compra_cardapio, contato, endereco, forma_pagamento, realiza, tipo_logradouro, tipo_pagamento, tipo_produto, uf;

/* trab_individual_logico: */

CREATE TABLE CLIENTE (
	codigo serial PRIMARY KEY,
    cpf varchar(14),
    nome varchar(80),
    FK_contato_PK integer,
    FK_endereco_PK integer
);

CREATE TABLE CARDAPIO (
    codigo serial PRIMARY KEY,
    nome varchar(80),
    descricao varchar(255),
    valor float,
    FK_tipo_produto_PK integer
);

CREATE TABLE FORMA_PAGAMENTO (
    codigo serial PRIMARY KEY,
	valor float,
    FK_tipo_pagamento_PK integer,
    FK_COMPRA_codigo integer
);

CREATE TABLE COMPRA (
    codigo serial PRIMARY KEY,
    data_hora timestamp
);

CREATE TABLE contato (
    contato_PK serial NOT NULL PRIMARY KEY,
    celular bigint,
    email varchar(150)
);

CREATE TABLE ENDERECO (
    endereco_PK serial NOT NULL PRIMARY KEY,
    CEP bigint,
    logradouro varchar(150),
    complemento varchar(100),
    numero integer,
	tipo_complemento varchar(150),
    fk_bairro integer,
    fk_cidade integer,
    fk_UF integer,
    fk_tipo_logradouro integer
);

CREATE TABLE TIPO_PRODUTO (
    tipo_produto_PK serial NOT NULL PRIMARY KEY,
    tipo_produto varchar(80)
);

CREATE TABLE tipo_pagamento (
    tipo_pagamento_PK integer NOT NULL PRIMARY KEY,
    tipo_pagamento varchar(30)
);

CREATE TABLE REALIZA (
    fk_COMPRA_codigo integer,
    fk_CLIENTE_codigo integer
);

CREATE TABLE Compra_cardapio (
    fk_CARDAPIO_codigo integer,
    fk_COMPRA_codigo integer,
    qtd integer
);

CREATE TABLE TIPO_LOGRADOURO (
    codigo serial PRIMARY KEY,
    tipo varchar(100)
);

CREATE TABLE BAIRRO (
    codigo serial PRIMARY KEY,
    nome varchar(100)
);

CREATE TABLE CIDADE (
    codigo serial PRIMARY KEY,
    nome varchar(100)
);

CREATE TABLE UF (
    codigo serial PRIMARY KEY,
    nome varchar(2)
);

INSERT INTO BAIRRO(nome)
	values  ('Fontes Palácios'),
			('Terra Vermelha'),
			('Ponta da Fruta'),
			('Grandes Enorme'),
			('Tanzânia Grau'),
			('Fontes Podres');
			
INSERT INTO CARDAPIO(nome, descricao, valor, fk_tipo_produto_pk)
	values  ('Macarrão na Chapa', 'Macarrão feito na chapa com linguiça, tomate, pimentão, frango desfiado, carne bovina picada e creme branco', 45.00, 1),
			('Feijão Tropeiro', 'Feijão tropeiro com o típico sabor brasileiro, acompanha arroz', 55.00, 1),
			('Fricassê', 'Um maravilhoso escondidinho de frango, acompanhado de arroz e farofa', 30.00, 1),
			('Lasanha à Bolanhesa', 'Uma ótima lasanha acompanhada de arroz', 60.95, 1),
			('Refrigerante lata', 'Refrigerantes dos mais diversos sabores', 5.00, 2),
			('Jarra de Suco', 'Sucos dos mais diversos sabores', 10.00, 2),
			('Sorvete', 'Pote de sorvete dos mais diversos sabores', 6.00, 3);

INSERT INTO CIDADE(nome)
	values  ('Tales de Mileto'),
			('Naldo Silva'),
			('Varzes Idalgo'),
			('Pequeno Homem'),
			('Grande Homem'),
			('Platão de Jonh');

INSERT INTO CLIENTE(cpf, nome, fk_contato_pk, fk_endereco_pk)
	values  ('154.654.987-96', 'Claudio Marques de Souza', 1, 1),
			('024.974.910-07', 'Roberta Dantas Barros', 2, 2),
			('457.678.123-56', 'Mila Fernanda Gonçalves Dias', 6, 6),
			('745.354.678-45', 'Roger Maria de Santos', 4, 4),
			('154.456.132-78', 'Clóves Alves Dias', 5, 5),
			('644.654.121-85', 'Marianna Lopes Fraques', 6, 6);
			
INSERT INTO COMPRA(data_hora)
	values  ('2022-09-10 11:58'),
			('2022-09-10 11:58'),		
			('2022-09-10 12:00'),
			('2022-09-10 12:00'),
			('2022-09-10 12:40'),			
			('2022-09-11 11:30'),
			('2022-09-11 11:31'),
			('2022-09-11 11:30'),
			('2022-09-12 12:30'),
			('2022-09-12 12:32'),
			('2022-09-12 12:40'),
			('2022-09-12 12:40'),
			('2022-09-12 13:30'),
			('2022-09-13 13:45'),
			('2022-09-13 14:00'),
			('2022-09-13 14:00'),
			('2022-09-13 12:23'),
			('2022-09-13 11:37'),
			('2022-09-14 11:37');
	
INSERT INTO COMPRA_CARDAPIO(fk_CARDAPIO_codigo, fk_COMPRA_codigo, qtd)
	values  (2,1,2),
			(5,2,2),		
			(3,3,1),
			(6,4,1),
			(7,5,1),			
			(1,6,3),
			(6,7,3),
			(7,8,2),
			(4,9,3),
			(6,10,1),
			(3,11,4),
			(1,12,2),
			(2,13,5),
			(1,14,2),
			(6,15,1),
			(4,16,1),
			(3,17,3),
			(7,18,4),
			(5,19,3);
			
INSERT INTO CONTATO(celular, email)
	values  (27998475124, 'claudio@gmail.com'),
			(27987542103, 'roberta.dantas@gmail.com'),
			(28997411203, 'mila.dias74@gmail.com'),
			(28978231512, 'rogersantos@gmail.com'),
			(27956321284, 'cloves.alves@gmail.com'),
			(27965235124, 'mlopes67@gmail.com');
			
INSERT INTO ENDERECO(cep, logradouro, complemento, numero, fk_bairro, fk_cidade, fk_uf, fk_tipo_logradouro)
	values  (29456873, 'Alzira Ramos', 'Acima da casa de ração', 256, 1, 1, 1, 1),
			(29256873, 'Alameda Frios', 'Apartamento 3° andar', 306, 2, 2, 1, 2),
			(32541021, 'Frances Dias', 'Casa R3', 32, 3, 3, 1, 4),
			(89654120, 'Menino', 'Chácara 04', 97, 4, 4, 1, 3),
			(29562314, 'Ganso 33', NULL, 89, 5, 5, 1, 1),
			(12456873, 'Alzira Ramo', 'Ao lado do Bar da Selma', 78, 6, 6, 1, 2);

INSERT INTO forma_pagamento(FK_tipo_pagamento_PK, FK_COMPRA_codigo, valor)
	values  (2, 1, 110),
			(1, 2, 10),
			(3, 3, 30),
			(2, 4, 10),
			(1, 5, 6),
			(2, 6, 70),
			(4, 7, 65),
			(4, 8, 30),
			(2, 9, 12),
			(4, 10, 100),
			(3, 10, 82.85),
			(1, 11, 10),
			(2, 12, 120),
			(1, 13, 90),
			(2, 14, 110),
			(2, 15, 100),
			(2, 15, 175),
			(2, 16, 10),
			(3, 17, 60.95),
			(4, 18, 90),
			(2, 19, 24);

INSERT INTO realiza(fk_cliente_codigo, fk_compra_codigo)
	values  (5,1),
			(5,2),
			(6,3),
			(6,4),
			(6,5),
			(3,6),
			(3,7),
			(3,8),
			(4,9),
			(4,10),
			(4,11),
			(2,12),
			(4,13),
			(4,14),
			(2,15),
			(1,16),
			(4,17),
			(1,18),
			(2,19);

INSERT INTO tipo_logradouro(tipo)
	values  ('RUA'),
			('AV'),
			('CHÁCARA'),
			('CONDOMÍNIO');
			
INSERT INTO tipo_pagamento(tipo_pagamento_pk, tipo_pagamento)
	values  (1, 'DINHEIRO'),
			(2, 'PIX'),
			(3, 'CARTÃO DE CRÉDITO'),
			(4, 'CARTÃO DE DÉBITO');
			
INSERT INTO tipo_produto(tipo_produto)
	values  ('Prato Salgado'),
			('Bebida'),
			('Sobremesa');
			
INSERT INTO uf(nome)
	values ('ES');
--foi	
ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_CONTATO
    FOREIGN KEY (FK_contato_PK)
    REFERENCES contato (contato_PK);
--foi
ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_ENDERECO
    FOREIGN KEY (FK_endereco_PK)
    REFERENCES ENDERECO (endereco_PK);
 --foi
ALTER TABLE CARDAPIO ADD CONSTRAINT FK_CARDAPIO_TIPO_PRODUTO
    FOREIGN KEY (FK_tipo_produto_PK)
    REFERENCES TIPO_PRODUTO (tipo_produto_PK);
--foi 
ALTER TABLE FORMA_PAGAMENTO ADD CONSTRAINT FK_FORMA_PAGAMENTO_TIPO_PAGAMENTO
    FOREIGN KEY (FK_tipo_pagamento_PK)
    REFERENCES tipo_pagamento (tipo_pagamento_PK);
--foi
ALTER TABLE FORMA_PAGAMENTO ADD CONSTRAINT FK_FORMA_PAGAMENTO_COMPRA
    FOREIGN KEY (fk_compra_codigo)
    REFERENCES COMPRA (codigo);
--foi
ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_TIPO_LOGRADOURO
    FOREIGN KEY (fk_tipo_logradouro)
    REFERENCES TIPO_LOGRADOURO (codigo);
--foi
ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_BAIRRO
    FOREIGN KEY (fk_BAIRRO)
    REFERENCES BAIRRO (codigo);
--foi
ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_CIDADE
    FOREIGN KEY (fk_CIDADE)
    REFERENCES CIDADE (codigo);
--foi	
ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_UF
    FOREIGN KEY (fk_UF)
    REFERENCES UF (codigo);
--foi
ALTER TABLE REALIZA ADD CONSTRAINT FK_REALIZA_COMPRA
    FOREIGN KEY (fk_COMPRA_codigo)
    REFERENCES COMPRA (codigo);
--foi 
ALTER TABLE REALIZA ADD CONSTRAINT FK_REALIZA_CLIENTE
    FOREIGN KEY (fk_CLIENTE_codigo)
    REFERENCES CLIENTE (codigo);
--foi
ALTER TABLE Compra_cardapio ADD CONSTRAINT FK_Compra_cardapio_CARDAPIO
    FOREIGN KEY (fk_CARDAPIO_codigo)
    REFERENCES CARDAPIO (codigo);
--foi 
ALTER TABLE Compra_cardapio ADD CONSTRAINT FK_Compra_cardapio_COMPRA
    FOREIGN KEY (fk_COMPRA_codigo)
    REFERENCES COMPRA (codigo);