CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_pizzas(
    id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	quantidade INT,
    pedidos INT,
	preco DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_categorias(
	id bigint AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(255) NOT NULL,
	tamanho VARCHAR(255) NOT NULL
);

INSERT INTO tb_pizzas(nome, quantidade, pedidos, preco) 
values ("mussarela", 30, 25, 28.00 );
INSERT INTO tb_pizzas(nome, quantidade, pedidos, preco) 
values ("portuguesa", 10, 36, 30.00);
INSERT INTO tb_pizzas(nome, quantidade, pedidos, preco) 
values ("calabresa", 13, 15, 25.00);
INSERT INTO tb_pizzas(nome, quantidade, pedidos, preco) 
values ("italiana", 17, 10, 31.00);
INSERT INTO tb_pizzas(nome, quantidade, pedidos, preco) 
values ("romeu e julieta", 20, 10, 21.00);
INSERT INTO tb_pizzas(nome, quantidade, pedidos, preco) 
values ("prestigio", 10, 12, 24.00);
INSERT INTO tb_pizzas(nome, quantidade, pedidos, preco) 
values ("sensação", 20, 8, 34.00);
INSERT INTO tb_pizzas(nome, quantidade, pedidos, preco) 
values ("frango", 15, 11, 22.00);

INSERT INTO tb_categorias(tipo, tamanho)
values ("salgado", "grande");
INSERT INTO tb_categorias(tipo, tamanho)
values ("doce", "grande");
INSERT INTO tb_categorias(tipo, tamanho)
values ("salgado", "broto");
INSERT INTO tb_categorias(tipo, tamanho)
values ("doce", "broto");
INSERT INTO tb_categorias(tipo, tamanho)
values ("salgado", "médio");

ALTER TABLE tb_pizzas ADD categoriasid BIGINT;

-- Restrição para adicionar a chave estrangeira de categoria

ALTER TABLE tb_pizzas ADD CONSTRAINT fk_pizzas_categorias 
FOREIGN KEY (categoriasid) REFERENCES tb_categorias (id);

SELECT * FROM tb_pizzas;
SELECT * FROM tb_categorias;

UPDATE tb_pizzas SET categoriasid = 1 WHERE id = 1;
UPDATE tb_pizzas SET categoriasid = 3 WHERE id = 2;
UPDATE tb_pizzas SET categoriasid = 5 WHERE id = 3;
UPDATE tb_pizzas SET categoriasid = 1 WHERE id = 4;
UPDATE tb_pizzas SET categoriasid = 2 WHERE id = 5;
UPDATE tb_pizzas SET categoriasid = 4 WHERE id = 6;
UPDATE tb_pizzas SET categoriasid = 2 WHERE id = 7;
UPDATE tb_pizzas SET categoriasid = 3 WHERE id = 8;

SELECT * FROM tb_pizzas WHERE preco > 25;
SELECT * FROM tb_pizzas WHERE preco BETWEEN 20 AND 25;
SELECT * FROM tb_pizzas WHERE nome LIKE "%m%";

SELECT nome, preco, quantidade, tb_categorias.tipo, tb_categorias.tamanho
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoriasid = tb_categorias.id;

SELECT nome, preco, quantidade, tb_categorias.tamanho, tb_categorias.tipo
FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoriasid = tb_categorias.id
WHERE tb_categorias.tipo = "doce";