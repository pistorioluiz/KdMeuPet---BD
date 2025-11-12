
SELECT p.nome as pet, e.nome as especie, r.nome as raca, o.nome as ong, p.idade, p.sexo
FROM pets p
JOIN especies e ON p.especie_id = e.id
JOIN racas r ON p.raca_id = r.id
JOIN ongs o ON p.ong_id = o.id
WHERE p.status = 'disponivel';

SELECT u.nome as adotante, p.nome as pet, a.data_solicitacao, a.status
FROM adocoes a
JOIN usuarios u ON a.usuario_id = u.id
JOIN pets p ON a.pet_id = p.id
WHERE a.status IN ('solicitada', 'aprovada');

SELECT o.nome as ong, 
       COUNT(p.id) as total_pets,
       SUM(CASE WHEN p.status = 'disponivel' THEN 1 ELSE 0 END) as disponiveis,
       SUM(CASE WHEN p.status = 'adotado' THEN 1 ELSE 0 END) as adotados
FROM ongs o
LEFT JOIN pets p ON o.id = p.ong_id
GROUP BY o.id, o.nome;

SELECT e.nome as especie, COUNT(p.id) as quantidade
FROM especies e
LEFT JOIN pets p ON e.id = p.especie_id
GROUP BY e.id, e.nome
ORDER BY quantidade DESC;

