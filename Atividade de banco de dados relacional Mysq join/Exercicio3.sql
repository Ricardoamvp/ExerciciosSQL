/*
Atividade 3
Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco
deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as
informações dos produtos desta empresa.
O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.
siga exatamente esse passo a passo:
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.
Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço deste farmacia(não
esqueça de criar a foreign key de tb_categoria nesta tabela).
Popule esta tabela Categoria com até 5 dados.
Popule esta tabela Produto com até 8 dados.
Faça um select que retorne os Produtos com o valor maior do que 50 reais.
Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
Faça um select utilizando LIKE buscando os Produtos com a letra B.
Faça um um select com Inner join entre tabela categoria e produto.
Faça um select onde traga todos os Produtos de uma categoria específica
*/

CREATE DATABASE db_farmacia_do_bem;
USE db_farmacia_do_bem;

CREATE TABLE tb_categoria(
	id_categoria INT AUTO_INCREMENT,
    remedio_precisa_receita TINYINT,
    tarja VARCHAR(20),
    marca VARCHAR(255),
    PRIMARY KEY(id_categoria)
);

CREATE TABLE tb_produto(
	id_produto INT NOT NULL AUTO_INCREMENT,
    fk_categoria INT NOT NULL,
    nome VARCHAR(255),
    descricao VARCHAR(255) NULL,
    idade_minima INT,
    quantidade VARCHAR(255),
    valor INT,
    PRIMARY KEY(id_produto),
    FOREIGN KEY(fk_categoria) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria (remedio_precisa_receita, tarja, marca) 
VALUES
(0,"Sem tarja","EMS"),
(0,"Tarja Amarela","Eurofarma"),
(0,"Tarja Vermelha","Neo Química"),
(1,"Tarja Vermelha","Teuto"),
(1,"Tarja Preta","Merck");

INSERT INTO tb_produto (nome, descricao, idade_minima, quantidade, valor, fk_categoria)
VALUES
("Paracetamol","Remédio1",12,"20 Comprimidos",30,1),
("Tylenol","Remédio2",12,"50ml",25,1),
("Medicamento Generico","",18,"40 Comprimidos",70,2),
("Medicamento Vermelho","Remédio4",18,"100ml",45,3),
("Medicamento Receitado", "Remédio5",18,"20ml",80,4),
("Medicamento Preto","",18,"5 Comprimidos",55,5),
("Eno","Remédio indicado para azia",8,"10 Doses",30,1),
("Dorflex","Rémedio para dor muscular",12,"50 Comprimidos",50,1);

SELECT tb_produto.nome AS Remédio, tb_produto.valor AS Preço, tb_categoria.marca AS Categoria
FROM tb_produto
INNER JOIN tb_categoria 
ON tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE valor < 50
ORDER BY valor ASC;

SELECT tb_produto.nome AS Remédio, tb_produto.valor AS Preço, tb_categoria.marca AS Categoria
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE valor BETWEEN 3 AND 60
ORDER BY valor ASC;

SELECT * FROM tb_produto WHERE nome LIKE "%D%";

SELECT * FROM tb_produto INNER JOIN tb_categoria ON tb_produto.fk_categoria = tb_categoria.id_categoria;

SELECT tb_produto.nome AS Remédio, tb_produto.valor AS Preço, tb_categoria.marca AS Categoria, tb_categoria.tarja AS Tarja, tb_categoria.remedio_precisa_receita AS Receita
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE id_categoria = 5
ORDER BY valor ASC;