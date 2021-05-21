/*
Atividade 2
Crie um banco de dados para um e commerce, onde o sistema trabalhará com as
informações dos produtos deste ecommerce.
Crie uma tabela produtos e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos produtos para se trabalhar com o serviço deste ecommerce.
Popule esta tabela com até 8 dados;
Faça um select que retorne os produtos com o valor maior do que 500.
Faça um select que retorne os produtos com o valor menor do que 500.
Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

CREATE DATABASE db_estoques;  -- Criando um banco de dados
USE db_estoques;
CREATE TABLE tb_produtos(  -- Criando uma tabela
	id_produto INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) DEFAULT "Produto",
	custo FLOAT NOT NULL,
	quantidade INT NOT NULL,
	valor FLOAT NOT NULL,
    PRIMARY KEY(id_produto)
);

INSERT INTO tb_produtos(nome,custo,quantidade,valor)  -- Populando o banco de dados
VALUES
("Mochila",40.50,300,120),
("Camisa",19.90,74,50),
("Calça",30.30,100,65),
("Meia",15.50,4500,30),
("Boné",20.20,50,45.50),
("Tênis",300,300,600),
("Bermuda",32.50,85,69.99),
("Blusa",80,300,160);

SELECT * FROM tb_produtos WHERE valor > 500;  -- Exibe os pordutos com valor acima de 500
SELECT * FROM tb_produtos WHERE valor < 500;  -- Exibe os produtos com valor abaixo de 500

UPDATE tb_produtos SET quantidade = 0 WHERE id_produto = 1;  -- Atualizando informações

-- DROP TABLE tb_produtos;
-- DROP DATABASE db_estoques;