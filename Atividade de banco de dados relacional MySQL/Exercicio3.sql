/*
Atividade 3
Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as
informações dos alunos deste registro dessa escola.
Crie uma tabela alunos e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos alunos para se trabalhar com o serviço dessa escola.

Popule esta tabela com até 8 dados;
Faça um select que retorne os alunos com a nota maior do que 7.
Faça um select que retorne os alunos com a nota menor do que 7.
Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

CREATE DATABASE db_alunos;  -- Criando um banco de dados
USE db_alunos;
CREATE TABLE tb_alunos(  -- Criando uma tabela
	id_aluno INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255),
    sobrenome VARCHAR(255),
	idade INT,
	classe VARCHAR(255),
	nota FLOAT,
    PRIMARY KEY(id_aluno)
);

INSERT INTO tb_alunos(nome,sobrenome,idade,classe,nota)  -- Populando o banco de dados
VALUES
("Ricardo","Alex",18,"3A",7.5),
("Lucas","Cicala",18,"3B",5.5),
("Marco","Aurelio",18,"3C",3),
("Enzo","Fernandez",18,"3D",10);

SELECT * FROM tb_alunos WHERE nota > 7;  -- Exibe as notas acima de 7
SELECT * FROM tb_alunos WHERE nota < 7;  -- Exibe as notas abaixo de 7

UPDATE tb_alunos SET nota = 6 WHERE id_aluno = 2;  -- Atualizando informações

-- DROP TABLE tb_produtos;
-- DROP DATABASE db_estoques;