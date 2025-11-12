

INSERT INTO especies (nome) VALUES 
('Cachorro'),
('Gato'),
('Coelho'),
('Pássaro');


INSERT INTO racas (nome, especie_id) VALUES 
('Vira-lata', 1),
('Labrador', 1),
('Siames', 2),
('Persa', 2);


INSERT INTO ongs (nome, cnpj, telefone, email, responsavel) VALUES 
('Amigo Fiel', '12.345.678/0001-90', '(67) 9999-8888', 'contato@amigofiel.org', 'Maria Silva'),
('Patas Dadas', '98.765.432/0001-10', '(67) 7777-6666', 'patasdadas@email.com', 'João Santos');


INSERT INTO usuarios (nome, email, telefone, cpf, data_nascimento) VALUES 
('Ana Costa', 'ana.costa@email.com', '(67) 9999-1111', '123.456.789-00', '1990-05-15'),
('Carlos Lima', 'carlos.lima@email.com', '(67) 8888-2222', '987.654.321-00', '1985-08-20');


INSERT INTO pets (nome, especie_id, raca_id, ong_id, idade, sexo, porte, descricao, vacinado, castrado) VALUES 
('Rex', 1, 1, 1, '2 anos', 'M', 'M', 'Brincalhão e carinhoso', TRUE, TRUE),
('Luna', 2, 3, 2, '1 ano', 'F', 'P', 'Calma e amorosa', TRUE, TRUE),
('Thor', 1, 2, 1, '3 anos', 'M', 'G', 'Dócil e companheiro', TRUE, FALSE);

