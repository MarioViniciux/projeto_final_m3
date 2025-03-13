CREATE TABLE IF NOT EXISTS LocalGratuitoDB (
		id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    senha VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS categoria(
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS acessibilidade(
    id INT PRIMARY KEY AUTO_INCREMENT,
    acessibilidade VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS novo_servico(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    contato VARCHAR(20) NOT NULL,
    descricao TEXT,
    requisitos TEXT NOT NULL,
    funcionamento VARCHAR(20),
    status ENUM("aprovado", "pendente", "rejeitado") DEFAULT "pendente",
    rua VARCHAR(50) NOT NULL,
    numero VARCHAR(10) DEFAULT "N/A",
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FK_categoria INT NOT NULL,
    FK_admin INT,
    FOREIGN KEY (FK_categoria) REFERENCES categoria(id) ON DELETE CASCADE,
    FOREIGN KEY (FK_admin) REFERENCES admin(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS novo_servico_temp(
		id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    contato VARCHAR(20) NOT NULL,
    descricao TEXT,
    requisitos TEXT NOT NULL,
    funcionamento VARCHAR(20),
    rua VARCHAR(50) NOT NULL,
    numero VARCHAR(10) DEFAULT "N/A",
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    acessibilidade TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FK_categoria INT NOT NULL,
    FOREIGN KEY (FK_categoria) REFERENCES categoria(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS servico(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    contato VARCHAR(20) NOT NULL,
    descricao TEXT,
    requisitos TEXT NOT NULL,
    funcionamento VARCHAR(20),
    status ENUM("ativo", "inativo") DEFAULT "ativo",
    rua VARCHAR(50) NOT NULL,
    numero VARCHAR(10) DEFAULT "N/A",
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FK_categoria INT NOT NULL,
    FOREIGN KEY (FK_categoria) REFERENCES categoria(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS avaliacao(
    id INT PRIMARY KEY AUTO_INCREMENT,
    feedback TEXT NOT NULL,
    pontuacao TINYINT,
    data DATETIME DEFAULT CURRENT_TIMESTAMP,
    FK_servico INT NOT NULL,
    FOREIGN KEY (FK_servico) REFERENCES servico(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS avaliacao_temp ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    browser_id INT NOT NULL UNIQUE,
    feedback TEXT, 
    pontuacao TINYINT,
    data DATETIME DEFAULT CURRENT_TIMESTAMP, 
    concluido BOOLEAN,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FK_servico INT NOT NULL, 
    FOREIGN KEY (FK_servico) REFERENCES servico(id) ON DELETE CASCADE
); 

CREATE TABLE IF NOT EXISTS denuncia(
    id INT PRIMARY KEY AUTO_INCREMENT,
    feedback TEXT NOT NULL,
    data DATETIME DEFAULT CURRENT_TIMESTAMP,
    FK_servico INT NOT NULL,
    FOREIGN KEY (FK_servico) REFERENCES servico(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS denuncia_temp ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    browser_id INT NOT NULL UNIQUE,
    feedback TEXT, 
    data DATETIME DEFAULT CURRENT_TIMESTAMP, 
    concluido BOOLEAN,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FK_servico INT NOT NULL, 
    FOREIGN KEY (FK_servico) REFERENCES servico(id) ON DELETE CASCADE
); 

CREATE TABLE IF NOT EXISTS servico_acessibilidade (
    id_servico INT,
    id_acessibilidade INT,
    PRIMARY KEY (id_servico, id_acessibilidade),
    FOREIGN KEY (id_servico) REFERENCES servico(id) ON DELETE CASCADE,
    FOREIGN KEY (id_acessibilidade) REFERENCES acessibilidade(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS novo_servico_acessibilidade (
    id_novo_servico INT,
    id_acessibilidade INT,
    PRIMARY KEY (id_novo_servico, id_acessibilidade),
    FOREIGN KEY (id_novo_servico) REFERENCES novo_servico(id) ON DELETE CASCADE,
    FOREIGN KEY (id_acessibilidade) REFERENCES acessibilidade(id) ON DELETE CASCADE
);