CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_colaboradores(
    id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
	idade INT,
    admissao DATE,
	salario DECIMAL NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_colaboradores(nome, cargo, idade, admissao, salario)
VALUES ("Jose", "analista", 28, "2023-03-12", 3000.00),
("Maria", "diretora", 30, "2021-08-11", 7000.00),
("Ricardo", "conferente", 23, "2024-01-03", 1700.00),
("Aline", "supervisora", 27, "2022-05-10", 2500.00),
("Leandro", "atendente", 25,  "2023-06-09", 1600.00);

SELECT * FROM tb_colaboradores;

SELECT nome, salario FROM tb_colaboradores WHERE salario > 2000;
SELECT nome, salario FROM tb_colaboradores WHERE salario < 2000;