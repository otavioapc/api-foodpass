CREATE DATABASE foodpass;
USE foodpass;

-- ========================
-- Tabela: Restaurante
-- ========================
CREATE TABLE restaurante (
    id_restaurante INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    horario_funcionamento VARCHAR(50),
    ativo BOOLEAN DEFAULT TRUE
);

-- Tabela: Funcionario
CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    saldo_atual DECIMAL(10,2) DEFAULT 0.00,
    ativo BOOLEAN DEFAULT TRUE
);

-- Tabela: Prato
CREATE TABLE prato (
    id_prato INT AUTO_INCREMENT PRIMARY KEY,
    id_restaurante INT NOT NULL,
    nome_prato VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    promocao BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante)
);

-- Tabela: Movimentacao de Saldo
CREATE TABLE movimentacao_saldo (
    id_movimentacao INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT,
    tipo ENUM('entrada', 'saida') NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    descricao VARCHAR(200),
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

-- Tabela: Pagamento Simulado
CREATE TABLE pagamento_simulado (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT,
    id_restaurante INT,
    valor DECIMAL(10,2) NOT NULL,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
    FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante)
);