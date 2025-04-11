-- drop datatabase Banco_Alunos
CREATE DATABASE Banco_Alunos;
USE Banco_Alunos;


-- CRIAÇÂO DAS TABELAS
CREATE TABLE Curso (
	id_curso INT AUTO_INCREMENT PRIMARY KEY, 
    nome_curso VARCHAR(100), 
    turno VARCHAR(50)
    
);


CREATE TABLE Alunos (
	id_aluno INT AUTO_INCREMENT PRIMARY KEY, 
    nome_aluno VARCHAR(100), 
    id_curso INT, 
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
    
);

CREATE TABLE Disciplina(
	id_disc INT AUTO_INCREMENT PRIMARY KEY, 
    nome_disciplina VARCHAR(100), 
    carga_hora INT, 
    id_curso INT, 
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- ALTERAÇÂO DAS TABELAS 
ALTER TABLE Curso ADD ano INT;
ALTER TABLE Disciplina ADD sala VARCHAR(15);

INSERT INTO Curso(nome_curso, turno)
VALUES
	('Informática', 'Tarde'),
    ('Eletrônica', 'Manhã'), 
    ('Mecatrônica', 'Tarde'); 
    
INSERT INTO Disciplina(nome_disciplina, carga_hora, id_curso)
VAlUES
	('POO', 100, 1), 
    ('BD', 150, 1), 
    ('Digital', 300, 2), 
    ('Analógica', 200, 2), 
    ('Dessenho Técnico', 250, 3), 
    ('Usinagem', 250, 3);

INSERT INTO Alunos(nome_aluno, id_curso)
VALUES 
	('Gabriela', 1), 
    ('Letícia', 2), 
    ('Fran', 3);

-- SELECTS     
SELECT * FROM Alunos;
SELECT * FROM Curso; 
SELECT * FROM Disciplina; 

-- UPDATES 
UPDATE Disciplina SET carga_hora = 90 WHERE id_curso IN (1,2,3);
SELECT carga_hora FROM Disciplina;

UPDATE Curso SET turno = 'noite' WHERE id_curso IN (2);

-- SELECTS PERSONALIZADOS 
-- Todos os nomes dos alunos dos cursos de informática​
SELECT nome_aluno 
FROM Alunos 
WHERE id_curso = 1;

-- Todos os alunos que pagam a disciplina POO​
SELECT Alunos.nome_aluno FROM Alunos
JOIN Curso on Alunos.id_curso = Curso.id_curso
WHERE Curso.nome_curso = 'Informática'; 


-- Todos os cursos que possuem a disciplina BD​
SELECT nome_curso FROM Curso, Disciplina
WHERE Curso.id_curso = 1;

-- Todas as disciplinas que são do curso de informática e os dados desse curso​
SELECT * FROM Disciplina, Curso
WHERE id_curso = 1; 


-- Todos os nomes dos cursos com os nomes das suas disciplinas e a carga horária​
SELECT nome_curso, nome_disciplina, carga_hora FROM Curso, Disciplina 
WHERE Curso.id_curso = Disciplina.id_curso;

-- Todas as matriculas dos alunos de informática e eletrônica​
SELECT * FROM Alunos 
Where id_curso = 1 OR id_curso = 2;

-- Todas as disciplinas que são do curso de informática e os dados desse curso​.
SELECT nome_disciplina, nome_curso, turno  FROM Disciplina, Curso
WHERE Curso.id_curso = 1; 

-- Todos os nomes dos alunos e seus cursos​
SELECT nome_aluno, nome_curso FROM Alunos, Curso;

-- Os nomes dos alunos e suas disciplinas em ordem alfabética.
SELECT nome_aluno, nome_disciplina FROM Alunos, Disciplina
ORDER BY nome_aluno;


