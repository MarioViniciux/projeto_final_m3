CREATE DATABASE IF NOT EXISTS FinalProject;

CREATE TABLE IF NOT EXISTS Categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Acessibilidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    acessibilidade VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS novo_servico(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    contato VARCHAR(20),
    descricao TEXT,
    requisitos TEXT,
    funcionamento VARCHAR(12),
    rua VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    cep VARCHAR(10),
    FK_categoria INT,
    FOREIGN KEY (FK_categoria) REFERENCES categoria(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS servico(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    contato VARCHAR(20),
    descricao TEXT,
    requisitos TEXT,
    funcionamento VARCHAR(20),
    status ENUM("Ativo", "Inativo"),
    rua VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    cep VARCHAR(10),
    FK_categoria INT,
    FOREIGN KEY (FK_categoria) REFERENCES categoria(id) ON DELETE CASCADE
);