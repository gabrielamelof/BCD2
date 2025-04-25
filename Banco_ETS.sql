DROP DATABASE IF EXISTS Banco_ETS;
CREATE DATABASE IF NOT EXISTS Banco_ETS; 
USE Banco_ETS;

CREATE TABLE instrutores (
	id_instrutor INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255), 
    disponibilidade INT
); 

CREATE TABLE semestre(
	id_semestre INT AUTO_INCREMENT PRIMARY KEY, 
    nome_semestre VARCHAR(25)
);

CREATE TABLE turmas (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(50), 
    id_semestre INT, 
    data_ingresso DATE,  
    id_instrutor INT, 
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id_instrutor), 
    FOREIGN KEY (id_semestre) REFERENCES semestre(id_semestre)
);

CREATE TABLE materias (
	id_materia INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255), 
    carga_horaria INT
);


CREATE TABLE materia_semestre(
	id_materia_semestre INT AUTO_INCREMENT PRIMARY KEY, 
    id_materia INT, 
    id_semestre INT, 
	FOREIGN KEY (id_materia) REFERENCES materias(id_materia), 
    FOREIGN KEY (id_semestre) REFERENCES semestre(id_semestre)
);

CREATE TABLE instrutores_turmas (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    id_instrutor INT, 
    id_turma INT, 
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id_instrutor), 
    FOREIGN KEY (id_turma) REFERENCES turmas(id)
);


CREATE TABLE instrutores_materias (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    id_instrutor INT, 
    id_materia INT, 
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id_instrutor), 
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
);

CREATE TABLE materias_turmas(
	id INT AUTO_INCREMENT PRIMARY KEY, 
    id_materia INT, 
    id_turma INT, 
    FOREIGN KEY (id_turma) REFERENCES turmas(id), 
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
);


-- INSERÇÃO DE DADOS

INSERT INTO instrutores (nome, disponibilidade) 
VALUES
	('João Silva', 45),
	('Maria Oliveira', 30),
	('Carlos Pereira', 25),
	('Fernanda Costa', 40),
	('Lucas Santos', 50);

INSERT INTO semestre(nome_semestre)
VALUES
	('1 semestre'), 
    ('2 semestre'), 
    ('3 semestre');

INSERT INTO turmas (nome, id_semestre, data_ingresso, id_instrutor) 
VALUES
	('Matemática I', 1, '2025-02-10', 1),
	('Física Geral', 3, '2025-03-01', 2),
	('Química Orgânica', 3, '2025-01-15', 3),
	('Introdução à Programação', 2, '2025-02-05', 4),
	('Literatura Brasileira', 2, '2025-03-20', 5);

INSERT INTO materias (nome, carga_horaria) 
VALUES
	('Matemática Discreta', 60),
	('Cálculo I', 75),
	('Física Geral I', 80),
	('Química Geral', 70),
	('Estruturas de Dados', 60);

INSERT INTO instrutores_turmas(id_instrutor, id_turma) 
VALUES
	(1, 1),  
	(2, 2),  
	(3, 3),  
	(4, 4),  
	(5, 5);

INSERT INTO instrutores_materias(id_instrutor, id_materia) 
VALUES
	(1, 1),  
	(2, 2),  
	(3, 3),  
	(4, 4),  
	(5, 5);

INSERT INTO materia_semestre(id_materia, id_semestre)
VALUES 
	(2, 3), 
    (1, 2), 
    (3, 3),
    (4, 2), 
    (5, 1);
    
INSERT INTO materias_turmas (id_materia, id_turma) 
VALUES
	(1, 1),  
	(2, 2), 
	(3, 3),  
	(4, 4),  
	(5, 5);

-- Consultas

SELECT 
	turmas.nome as Nome_Turma,
    instrutores.nome as Nome_Padrinho, 
    instrutores.disponibilidade as Disponibilidade_instrutor, 
    materias.nome as Nome_materia
FROM instrutores 
INNER JOIN instrutores_turmas ON instrutores.id_instrutor = instrutores_turmas.id_instrutor
INNER JOIN turmas ON instrutores_turmas.id_turma = turmas.id
INNER JOIN instrutores_materias ON instrutores_turmas.id_instrutor = instrutores_materias.id_instrutor
INNER JOIN materias ON instrutores_materias.id_materia = materias.id_materia;



SELECT 
	materias.nome as Nome_Materia, 
    materias.carga_horaria as Carga_horaria, 
    semestre.nome_semestre as Semestre
FROM materias 
INNER JOIN materia_semestre ON materias.id_materia = materia_semestre.id_materia
INNER JOIN semestre ON materia_semestre.id_semestre = semestre.id_semestre; 


SELECT
	turmas.nome as Nome_Turma, 
    turmas.data_ingresso as Data_Ingresso, 
    materias.nome as Nome_Materia
FROM turmas
INNER JOIN materias_turmas ON turmas.id = materias_turmas.id
INNER JOIN  materia_semestre ON materias_turmas.id_materia = materia_semestre.id_materia
INNER JOIN materias ON materias_turmas.id_materia = materias.id_materia
WHERE materia_semestre.id_semestre = 2;
    
    

