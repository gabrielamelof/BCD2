DROP DATABASE IF EXISTS Banco_floricultura;
CREATE DATABASE IF NOT EXISTS Banco_floricultura; 
USE Banco_floricultura; 

CREATE TABLE cliente(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY, 
    rg VARCHAR(12), 
    nome VARCHAR(255), 
    telefone VARCHAR(12), 
    endereco VARCHAR(255)
);

CREATE TABLE produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY, 
    nome_produto VARCHAR(255), 
    tipo ENUM('flor', 'vaso', 'planta', 'muda'), 
    preco DECIMAL(5,2), 
    qnt_estoque INT
);


CREATE TABLE compra (
	id_compra INT AUTO_INCREMENT PRIMARY KEY, 
    data_compra DATE, 
    valor_compra DECIMAL(10,2), 
    id_cliente INT, 
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


INSERT INTO cliente(rg, nome, telefone, endereco) VALUES
('123456789', 'Ana Paula Silva', '11987654321', 'Rua das Flores, 123 - São Paulo'),
('987654321', 'Carlos Eduardo Lima', '21999887766', 'Av. Atlântica, 456 - Rio de Janeiro'),
('456789123', 'Juliana Mendes', '31988776655', 'Rua Ouro Preto, 789 - Belo Horizonte'),
('789123456', 'Marcos Vinícius Rocha', '51977665544', 'Av. Ipiranga, 321 - Porto Alegre'),
('321654987', 'Fernanda Souza', '85966554433', 'Rua das Acácias, 654 - Fortaleza');


INSERT INTO produtos(nome_produto, tipo, preco, qnt_estoque) VALUES
('Rosa Vermelha', 'flor', 15.50, 50),
('Vaso de Cerâmica', 'vaso', 35.75, 100),
('Orquídea Branca', 'planta', 50.00, 30),
('Muda de Alecrim', 'muda', 8.90, 120),
('Cacto Decorativo', 'planta', 25.30, 80),
('Vaso de Plástico', 'vaso', 10.00, 150),
('Tulipa Amarela', 'flor', 18.20, 70),
('Muda de Manjericão', 'muda', 5.50, 200);

INSERT INTO compra(data_compra, valor_compra, id_cliente) VALUES 
('2025-04-01', 120.75, 1),
('2025-04-03', 200.50, 2),
('2025-04-05', 350.00, 3),
('2025-04-07', 78.90,  4),
('2025-04-09', 150.25, 5);