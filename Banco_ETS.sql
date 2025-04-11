DROP DATABASE IF EXISTS Banco_ETS;
CREATE DATABASE IF NOT EXISTS Banco_ETS; 
USE Banco_ETS;

CREATE TABLE instrutores (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255)
); 

CREATE TABLE turmas (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(50), 
    semestre ENUM('Semestre 1', 'Semestre 2', 'Semestre 3'), 
    data_ingresso DATE,  
    id_instrutor INT, 
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id)
);

CREATE TABLE materias (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255), 
    carga_horaria INT, 
    semestre ENUM('Semestre 1', 'Semestre 2', 'Semestre 3')
);

CREATE TABLE instrutores_turmas (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    id_instrutor INT, 
    id_turma INT, 
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id), 
    FOREIGN KEY (id_turma) REFERENCES turmas(id)
);

CREATE TABLE instrutores_materias (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    id_instrutor INT, 
    id_materia INT, 
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id), 
    FOREIGN KEY (id_materia) REFERENCES materias(id)
);

CREATE TABLE materias_turmas(
	id INT AUTO_INCREMENT PRIMARY KEY, 
    id_materia INT, 
    id_turma INT, 
    FOREIGN KEY (id_turma) REFERENCES turmas(id), 
    FOREIGN KEY (id_materia) REFERENCES materias(id)
);


-- INSERÇÃO DE DADOS

INSERT INTO instrutores (nome) VALUES
('João Silva'),
('Maria Oliveira'),
('Carlos Pereira'),
('Fernanda Costa'),
('Lucas Santos');

INSERT INTO turmas (nome, semestre, data_ingresso, id_instrutor) VALUES
('Matemática I', 'Semestre 1', '2025-02-10', 1),
('Física Geral', 'Semestre 2', '2025-03-01', 2),
('Química Orgânica', 'Semestre 3', '2025-01-15', 3),
('Introdução à Programação', 'Semestre 1', '2025-02-05', 4),
('Literatura Brasileira', 'Semestre 2', '2025-03-20', 5);

INSERT INTO materias (nome, carga_horaria, semestre) VALUES
('Matemática Discreta', 60, 'Semestre 1'),
('Cálculo I', 75, 'Semestre 1'),
('Física Geral I', 80, 'Semestre 2'),
('Química Geral', 70, 'Semestre 1'),
('Estruturas de Dados', 60, 'Semestre 2');

INSERT INTO instrutores_turmas(id_instrutor, id_turma) VALUES
(1, 1),  
(2, 2),  
(3, 3),  
(4, 4),  
(5, 5);

INSERT INTO instrutores_materias(id_instrutor, id_materia) VALUES
(1, 1),  
(2, 2),  
(3, 3),  
(4, 4),  
(5, 5);

INSERT INTO materias_turmas (id_materia, id_turma) VALUES
(1, 1),  
(2, 2), 
(3, 3),  
(4, 4),  
(5, 5);


