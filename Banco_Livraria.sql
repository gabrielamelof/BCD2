DROP DATABASE IF EXISTS Banco_Livraria; 
CREATE DATABASE IF NOT EXISTS Banco_Livraria; 
USE Banco_Livraria; 

CREATE TABLE autores (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(255), 
    data_nascimento DATE, 
    data_morte DATE, 
);

CREATE TABLE editora (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(255)
);
CREATE TABLE livros (
	nome VARCHAR(255), 
    ano_publicacao DATE, 
    avaliacao DECIMAL(2,1), 
    id_editora INT, 
    FOREIGN KEY (id_editora) REFERENCES editora(id)
);