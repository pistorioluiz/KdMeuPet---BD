

CREATE TABLE especies (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE racas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    especie_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (especie_id) REFERENCES especies(id) ON DELETE CASCADE
);

CREATE TABLE ongs (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco TEXT,
    responsavel VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    cpf VARCHAR(14) UNIQUE,
    endereco TEXT,
    data_nascimento DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TYPE sexo_type AS ENUM ('M', 'F');
CREATE TYPE porte_type AS ENUM ('P', 'M', 'G');
CREATE TYPE pet_status_type AS ENUM ('disponivel', 'adotado', 'processo_adocao');
CREATE TYPE adocao_status_type AS ENUM ('solicitada', 'aprovada', 'concluida', 'cancelada');

CREATE TABLE pets (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    especie_id INT NOT NULL,
    raca_id INT,
    ong_id INT NOT NULL,
    idade VARCHAR(20),
    sexo sexo_type,
    porte porte_type,
    descricao TEXT,
    vacinado BOOLEAN DEFAULT FALSE,
    castrado BOOLEAN DEFAULT FALSE,
    status pet_status_type DEFAULT 'disponivel',
    data_entrada DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (especie_id) REFERENCES especies(id),
    FOREIGN KEY (raca_id) REFERENCES racas(id),
    FOREIGN KEY (ong_id) REFERENCES ongs(id)
);

CREATE TABLE adocoes (
    id SERIAL PRIMARY KEY,
    pet_id INT NOT NULL,
    usuario_id INT NOT NULL,
    data_solicitacao DATE NOT NULL,
    data_aprovacao DATE,
    data_conclusao DATE,
    status adocao_status_type DEFAULT 'solicitada',
    observacao TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pet_id) REFERENCES pets(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
