PRAGMA foreign_keys = ON;

-- TABELA: LOJA

CREATE TABLE loja (
    id_loja INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cidade TEXT NOT NULL,
    endereco TEXT NOT NULL
);

-- TABELA: FUNCIONARIO


CREATE TABLE funcionario (
    id_funcionario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL,
    cargo TEXT NOT NULL,
    id_loja INTEGER NOT NULL,

    FOREIGN KEY (id_loja)
        REFERENCES loja(id_loja)
);

-- TABELA: FORNECEDOR

CREATE TABLE fornecedor (
    id_fornecedor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cnpj TEXT NOT NULL,
    telefone TEXT NOT NULL
);

-- TABELA: CATEGORIA

CREATE TABLE categoria (
    id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
);

-- TABELA: PRODUTO

CREATE TABLE produto (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    estoque INTEGER NOT NULL,
    preco REAL NOT NULL,
    id_categoria INTEGER NOT NULL,
    id_fornecedor INTEGER NOT NULL,

    FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria),

    FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedor(id_fornecedor)
);

-- TABELA: CLIENTE

CREATE TABLE cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL,
    telefone TEXT NOT NULL
);

-- TABELA: VENDA

CREATE TABLE venda (
    id_venda INTEGER PRIMARY KEY AUTOINCREMENT,
    data DATE NOT NULL,
    valor_total REAL NOT NULL,

    id_cliente INTEGER NOT NULL,
    id_funcionario INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
	id_loja INTEGER NOT NULL,

    FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),

    FOREIGN KEY (id_funcionario)
        REFERENCES funcionario(id_funcionario),

    FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto),
		
	FOREIGN KEY (id_loja)
        REFERENCES loja (id_loja),
);

-- TABELA: PAGAMENTO

CREATE TABLE pagamento (
    id_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
    data DATE NOT NULL,
    forma_pagamento TEXT NOT NULL,
    valor_pagamento REAL NOT NULL,
    id_venda INTEGER NOT NULL,

    FOREIGN KEY (id_venda)
        REFERENCES venda(id_venda)
);

CREATE TABLE produto_fornecedor (
    id_produto INTEGER NOT NULL,
    id_fornecedor INTEGER NOT NULL,

    PRIMARY KEY (id_produto, id_fornecedor),

    FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto),

    FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedor(id_fornecedor)
);