/*
Atividade 1
Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema
trabalhará com as informações dos funcionaries desta empresa.
Crie uma tabela de funcionaries e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionaries para se trabalhar com o serviço deste RH.
Popule esta tabela com até 5 dados;
Faça um select que retorne os funcionaries com o salário maior do que 2000.
Faça um select que retorne os funcionaries com o salário menor do que 2000.
Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

CREATE DATABASE db_funcionarios; -- Criando uma banco de dados
USE db_funcionarios;
CREATE TABLE tb_funcionarios (  -- Criando uma tabela
	id_funcionario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    email VARCHAR(255),
    cpf VARCHAR(11),
    idade INT,
    salario FLOAT NULL,  -- Salário pode ser nulo
    PRIMARY KEY(id_funcionario)
);

INSERT INTO tb_funcionarios (nome, email, cpf, idade, salario)  -- Populando uma tabela
VALUES 
("Ricardo","ricardo.amvp@gmail.com","12345678900",18,3000),
("Marco","marco.aurelio@hotmail.com","00987654321",18,3200),
("Lucas","lucas.cicala@outlook.com","45698712300",19,2700),
("Enzo","enzo.fernandez@yahoo.com.br","98745632100",18,2500),
("Victor","victor.iorio@uol.com.br","35795148620",20,2300),
("Matteo","matteo.creso@gmail.com","42687531590",20,1500);

SELECT * FROM tb_funcionarios WHERE salario > 2000;  -- Exibir funcionario com salário maior que 2000

SELECT * FROM tb_funcionarios WHERE salario < 2000;  -- Exibir funcionario com salário menor que 2000

UPDATE tb_funcionarios SET salario = 5000 WHERE id_funcionario = 1;  -- Atualizando um dado da tabela

-- DROP TABLE tb_funcionarios;
-- DROP DATABASE db_funcionarios;