/*
Atividade 4
Crie um banco de dados para um serviço de um açougue ou uma quitanda, o nome do
banco deverá ter o seguinte nome db_cidade_das_carnes ou db_cidade_das_frutas, onde o
sistema trabalhará com as informações dos produtos desta empresa.
O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.
siga exatamente esse passo a passo:
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desse açougue.
Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço desse açougue(não esqueça de
criar a foreign key de tb_categoria nesta tabela).
Popule esta tabela Categoria com até 5 dados.
Popule esta tabela Produto com até 8 dados.
Faça um select que retorne os Produtos com o valor maior do que 50 reais.
Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
Faça um select utilizando LIKE buscando os Produtos com a letra C.
Faça um um select com Inner join entre tabela categoria e produto.
Faça um select onde traga todos os Produtos de uma categoria específica
*/

CREATE DATABASE db_cidade_das_frutas;
USE db_cidade_das_frutas;

CREATE TABLE tb_categoria (
id_categoria INT NOT NULL AUTO_INCREMENT,
nome VARCHAR (255),
tipo VARCHAR (255), 
PRIMARY KEY (id_categoria)
);

CREATE TABLE tb_produto (
id_produto INT NOT NULL AUTO_INCREMENT,
nome VARCHAR (255),
descricao VARCHAR (255), 
peso VARCHAR (255),
valor INT,
fk_categoria INT,
PRIMARY KEY (id_produto),
FOREIGN KEY (fk_categoria) REFERENCES tb_categoria (id_categoria)
);

INSERT INTO tb_categoria (nome, tipo)
VALUES
("Frutas", "Orgânico"),
("Verduras", "Orgânico"),
("Grãos", "Orgânico"),
("Legumes", "Orgânico"),
("Congelados", "Industrializado");

INSERT INTO tb_produto (nome, peso, valor, fk_categoria)
VALUES
("Maçã","1Kg",10,1),
("Banana","500g",6,1),
("Alface","200g",3,2),
("Coentro","150g",25,2),
("Ervilha","300g",6,3),
("Feijão","10Kg",80,3),
("Beterraba","700g",19,4),
("Polpa de Suco","100g",3,5);


SELECT tb_produto.nome AS Produto, tb_categoria.tipo AS Tipo, tb_produto.valor AS Valor
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE valor > 50
ORDER BY valor ASC;

SELECT tb_produto.nome AS produto, tb_categoria.tipo AS Tipo, tb_produto.valor AS Valor
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE valor BETWEEN 3 AND 60
ORDER BY tb_produto.valor ASC;

SELECT * FROM tb_produto WHERE nome LIKE '%C%';

SELECT * FROM tb_produto INNER JOIN tb_categoria ON tb_produto.fk_categoria = tb_categoria.id_categoria;

SELECT tb_produto.nome AS nome, tb_categoria.nome AS Categoria
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE id_categoria = 2;
