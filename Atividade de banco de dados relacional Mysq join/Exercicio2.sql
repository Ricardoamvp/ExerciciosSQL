/*
Atividade 2
Crie um banco de dados para um serviço de pizzaria de uma empresa, o nome do banco
deverá ter o seguinte nome db_pizzaria_legal, onde o sistema trabalhará com as
informações dos produtos desta empresa.
O sistema trabalhará com 2 tabelas tb_pizza e tb_categoria.
siga exatamente esse passo a passo:
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.
Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço dessa pizzaria(não esqueça de
criar a foreign key de tb_categoria nesta tabela).
Popule esta tabela Categoria com até 5 dados.
Popule esta tabela pizza com até 8 dados.
Faça um select que retorne os Produtos com o valor maior do que 45 reais.
Faça um select trazendo os Produtos com valor entre 29 e 60 reais.
Faça um select utilizando LIKE buscando os Produtos com a letra C.
Faça um um select com Inner join entre tabela categoria e pizza.
Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são pizza doce).
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categoria (
id_categoria INT AUTO_INCREMENT,
doce TINYINT NOT NULL,
salgado TINYINT NOT NULL,
vegano TINYINT NOT NULL,
PRIMARY KEY(id_categoria)
);

CREATE TABLE tb_pizza (
id_pizza INT AUTO_INCREMENT,
id_categoria INT,
sabor VARCHAR(255),
tamanho VARCHAR(255),
borda_recheada TINYINT NOT NULL,
tamanho_massa VARCHAR(255),
valor FLOAT,
PRIMARY KEY(id_pizza),
FOREIGN KEY(id_categoria) REFERENCES tb_categoria(id_categoria)
);

INSERT tb_categoria (doce, salgado, vegano)
VALUES
(1,0,0), -- doce 
(1,0,1), -- doce vegano
(0,1,1), -- salgado vegano
(0,1,0), -- salgado
(1,1,1); -- agridoce vegano

INSERT tb_pizza (sabor, tamanho, borda_recheada, tamanho_massa,id_categoria, valor)
VALUES
("Frango","Médio",1,"Médio",4,50),
("Atum","Grande",1,"Grande",4,40),
("Chocolate","Pequeno",0,"Médio",1,45),
("Escarola","Médio",1,"Médio",4,35),
("Calabresa","Gigante",1,"Médio",4,55),
("Banana com Canela","Médio",0,"Pequeno",2,50),
("Bacon","Médio",1,"Grande",4,60),
("Portuguesa","Médio",1,"Médio",4,30);

SELECT * FROM tb_pizza WHERE valor > 45;

SELECT * FROM tb_pizza WHERE valor BETWEEN 29 AND 60;

SELECT * FROM tb_pizza WHERE sabor LIKE "%C%";

SELECT * FROM tb_categoria c 
INNER JOIN tb_pizza p 
ON c.id_categoria = p.id_categoria;

SELECT * FROM tb_pizza WHERE id_categoria = 4;