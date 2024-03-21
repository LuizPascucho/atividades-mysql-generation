CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	quantidade INT,
    validade DATE,
	preco DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_categorias(
	id bigint AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(255) NOT NULL,
	genero VARCHAR(255) NOT NULL
);

INSERT INTO tb_produtos(nome, quantidade, validade, preco) 
values ("dipirona", 30, "2027-05-02", 8.00 );
INSERT INTO tb_produtos(nome, quantidade, validade, preco) 
values ("metformina", 60, "2027-03-10", 13.00);
INSERT INTO tb_produtos(nome, quantidade, validade, preco) 
values ("leite em pó", 50, "2027-01-01", 35.00);
INSERT INTO tb_produtos(nome, quantidade, validade, preco) 
values ("insulina", 100, "2027-05-12", 80.00);
INSERT INTO tb_produtos(nome, quantidade, validade, preco) 
values ("aspirina", 120, "2027-07-02", 15.00);
INSERT INTO tb_produtos(nome, quantidade, validade, preco) 
values ("balinha", 200, "2027-11-12", 4.00);
INSERT INTO tb_produtos(nome, quantidade, validade, preco) 
values ("omega 3", 25, "2027-02-01", 50.00);
INSERT INTO tb_produtos(nome, quantidade, validade, preco) 
values ("Whey Protein", 150, "2027-01-10", 100.00);

INSERT INTO tb_categorias(tipo, genero)
values ("comprimido", "remédio");
INSERT INTO tb_categorias(tipo, genero)
values ("aplicar", "hormônio");
INSERT INTO tb_categorias(tipo, genero)
values ("comestivel", "alimento");
INSERT INTO tb_categorias(tipo, genero)
values ("gelatinoso", "vitamina");
INSERT INTO tb_categorias(tipo, genero)
values ("em pó", "suplemento");

ALTER TABLE tb_produtos ADD categoriasid BIGINT;

-- Restrição para adicionar a chave estrangeira de categoria

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias 
FOREIGN KEY (categoriasid) REFERENCES tb_categorias (id);

SELECT * FROM tb_produtos;
SELECT * FROM tb_categorias;

UPDATE tb_produtos SET categoriasid = 1 WHERE id = 1;
UPDATE tb_produtos SET categoriasid = 1 WHERE id = 2;
UPDATE tb_produtos SET categoriasid = 5 WHERE id = 3;
UPDATE tb_produtos SET categoriasid = 2 WHERE id = 4;
UPDATE tb_produtos SET categoriasid = 1 WHERE id = 5;
UPDATE tb_produtos SET categoriasid = 3 WHERE id = 6;
UPDATE tb_produtos SET categoriasid = 4 WHERE id = 7;
UPDATE tb_produtos SET categoriasid = 5 WHERE id = 8;

SELECT * FROM tb_produtos WHERE preco > 50;
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 60;
SELECT * FROM tb_produtos WHERE nome LIKE "%m%";

SELECT nome, preco, quantidade, tb_categorias.tipo,  tb_categorias.genero
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoriasid = tb_categorias.id;

SELECT nome, preco, quantidade, tb_categorias.genero, tb_categorias.tipo
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriasid = tb_categorias.id
WHERE tb_categorias.tipo = "comprimido";