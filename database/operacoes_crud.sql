
INSERT INTO ongs (nome, cnpj, telefone, email, responsavel) 
VALUES ('Protetores de Animais', '11.222.333/0001-44', '(67) 3333-4444', 'contato@protetores.org', 'Pedro Almeida');

INSERT INTO especies (nome) 
VALUES ('Hamster');

INSERT INTO racas (nome, especie_id) 
VALUES ('Sírio', 5);

INSERT INTO usuarios (nome, email, telefone, cpf, data_nascimento) 
VALUES ('Mariana Santos', 'mariana.santos@email.com', '(67) 5555-6666', '111.222.333-44', '1992-11-20');

INSERT INTO pets (nome, especie_id, raca_id, ong_id, idade, sexo, porte, descricao, vacinado, castrado) 
VALUES ('Mel', 5, 5, 1, '6 meses', 'F', 'P', 'Brincalhona e curiosa', TRUE, FALSE);

INSERT INTO adocoes (pet_id, usuario_id, data_solicitacao, status) 
VALUES (4, 3, CURRENT_DATE, 'solicitada');

UPDATE adocoes 
SET status = 'aprovada', data_aprovacao = CURRENT_DATE 
WHERE id = 1;

UPDATE pets 
SET status = 'processo_adocao' 
WHERE id = 4;

--------------------------

UPDATE adocoes 
SET status = 'concluida', data_conclusao = CURRENT_DATE 
WHERE id = 1;

UPDATE pets 
SET status = 'adotado' 
WHERE id = 4;

--------------------------

UPDATE pets 
SET vacinado = TRUE, castrado = TRUE, descricao = 'Pet vacinado e castrado' 
WHERE id = 3;

UPDATE usuarios 
SET telefone = '(67) 7777-8888', endereco = 'Rua das Flores, 123 - Campo Grande/MS' 
WHERE id = 1;

DELETE FROM adocoes 
WHERE id = 2 
AND status IN ('solicitada', 'aprovada');

DELETE FROM pets 
WHERE id = 4 
AND id NOT IN (SELECT pet_id FROM adocoes WHERE status = 'concluida');

DELETE FROM usuarios 
WHERE id = 3 
AND id NOT IN (SELECT usuario_id FROM adocoes WHERE status = 'concluida');

