/*
Atividade 1
Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter
o seguinte nome db_generation_game_online, onde, o sistema trabalhará com as
informações dos personagens desse game.
O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.
siga exatamente esse passo a passo:
Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos
relevantes da classe para se trabalhar com o serviço desse game Online.
Crie uma tabela tb_personagem e utilizando a habilidade de abstração e determine 5
atributos relevantes para se trabalhar com o serviço desse game Online
(não esqueça de criar a foreign key de tb_classe nesta tabela).
Popule esta tabela classe com até 5 dados.
Popule esta tabela personagem com até 8 dados.
Faça um select que retorne os personagens com o poder de ataque maior do que 200.
Faça um select trazendo os personagens com poder de defesa entre 100 e 200.
Faça um select utilizando LIKE buscando os personagens com a letra C.
Faça um um select com Inner join entre tabela classe e personagem.
Faça um select onde traga todos os personagem de uma classe específica (exemplo todos
os personagens que são arqueiros).
*/

CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;
CREATE TABLE tb_classe (
	id_classe INT AUTO_INCREMENT,
    nome VARCHAR(255),
    combate VARCHAR(255),
    velocidade_ataque FLOAT,
	PRIMARY KEY(id_classe)
);

CREATE TABLE tb_personagem (
	id_personagem INT AUTO_INCREMENT,
    tb_classes INT,
	nickname VARCHAR(255),
    raca VARCHAR(255),
    vida_base INT,
    defesa_base INT,
    dano_base INT,
	PRIMARY KEY(id_personagem),
    FOREIGN KEY(tb_classes) REFERENCES tb_classe(id_classe)
);

INSERT INTO tb_classe (nome, combate, velocidade_ataque) 
VALUES
("Tanque","Corpo a corpo",0.5),
("Arqueiro","A distância",1.5),
("Assassino","Corpo a corpo",2),
("Mago","A distância",0.3),
("Guerreiro","Corpo a corpo",1);

INSERT INTO tb_personagem (nickname, tb_classes, raca, vida_base, defesa_base, dano_base) 
VALUES
("Ramvp",1,"Orc",2000,400,200),
("Kamada",1,"Troll",1500,300,500),
("Ezak",1,"Goblin",800,500,600),
("Trepudox",2,"Humano",1000,600,400),
("DeadGamer",3,"Elfo",900,450,400),
("Mash",4,"Anão",800,700,200),
("Cyber",1,"Gnomo",700,500,600),
("Ramvp10",1,"Zumbi",300,180,900);

SELECT * FROM tb_personagem WHERE dano_base > 200; 

SELECT * FROM tb_personagem WHERE defesa_base BETWEEN 100 AND 200;

SELECT * FROM tb_personagem WHERE nickname LIKE "%C%";

SELECT nickname,nome FROM tb_classe 
INNER JOIN tb_personagem 
ON tb_classe.id_classe = tb_personagem.tb_classes;

SELECT * FROM tb_classe INNER JOIN tb_personagem ON tb_classe.id_classe = tb_personagem.tb_classes WHERE tb_classes = "1";