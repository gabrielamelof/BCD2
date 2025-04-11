DROP DATABASE IF EXISTS Banco_bercario;
CREATE DATABASE IF NOT EXISTS Banco_bercario;
USE Banco_bercario;

CREATE TABLE medico (
	id_medico INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255), 
    crm VARCHAR(10), 
    telefone VARCHAR(15), 
    especialidade VARCHAR(255)
);

CREATE TABLE mae(
	id_mae INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255), 
    endereco VARCHAR(255), 
    telefone VARCHAR(15), 
    data_nascimento DATE
);
CREATE TABLE crianca (
	id_crianca INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255), 
    data_nascimento DATE, 
    peso FLOAT, 
    altura FLOAT, 
    id_medico INT, 
    id_mae INT, 
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_mae) REFERENCES mae(id_mae)
    
);

INSERT INTO medico (nome, crm, telefone, especialidade)
VALUES
	('Adrian', '1234567891', '123456789', 'obstetra'),
	('Beatriz', '9876543210', '987654321', 'dentista'),
	('Carlos', '1122334455', '112233445', 'médico'),
	('Daniela', '2233445566', '223344556', 'enfermeira'),
	('Eduardo', '3344556677', '334455667', 'fisioterapeuta'),
	('Fernanda', '4455667788', '445566778', 'psicóloga');

INSERT INTO mae(nome, endereco, telefone, data_nascimento)
VALUES 
	('Adrian Silva', 'Rua das Flores, 123, São Paulo - SP', '1234567891', '1985-06-15'),
	('Beatriz Lima', 'Avenida Brasil, 456, Rio de Janeiro - RJ', '9876543210', '1990-11-25'),
	('Carlos Pereira', 'Rua do Sol, 789, Belo Horizonte - MG', '1122334455', '1982-03-10'),
	('Daniela Costa', 'Rua da Paz, 1011, Curitiba - PR', '2233445566', '1995-08-30'),
	('Eduardo Almeida', 'Avenida Paulista, 2020, São Paulo - SP', '3344556677', '1987-12-05'),
	('Fernanda Souza', 'Rua das Acácias, 303, Porto Alegre - RS', '4455667788', '1992-05-20');
    
INSERT INTO crianca(nome, peso, altura, data_nascimento, id_medico, id_mae)
VALUES
	('Lucas Oliveira', 3.250, 50.00, '2025-04-01', 2, 5),
	('Maria Souza', 2.850, 48.50, '2025-04-02', 2, 6),
	('Gabriel Santos', 3.100, 49.20, '2025-04-03', 3, 1),
	('Isabela Costa', 3.400, 51.00, '2025-04-04', 1, 4),
	('Ana Beatriz', 3.000, 49.80, '2025-04-05', 6, 2),
	('Miguel Almeida', 3.200, 50.30, '2025-04-06', 4, 3);