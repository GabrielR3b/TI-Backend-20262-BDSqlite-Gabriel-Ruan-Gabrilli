
SELECT * FROM loja;

SELECT * FROM funcionario;

SELECT * FROM fornecedor;

SELECT * FROM categoria;

SELECT * FROM produto;

SELECT * FROM cliente;

SELECT * FROM venda;

SELECT * FROM pagamento;



SELECT *
FROM loja
WHERE cidade = 'Aracati';

SELECT *
FROM funcionario
WHERE cargo = 'Vendedor';

SELECT *
FROM fornecedor
WHERE nome = 'Nike Brasil';

SELECT *
FROM categoria
WHERE nome = 'Futebol';

SELECT *
FROM produto
WHERE preco > 150;

SELECT *
FROM cliente
WHERE nome = 'João Silva';

SELECT *
FROM venda
WHERE valor_total > 200;

SELECT *
FROM pagamento
WHERE forma_pagamento = 'PIX';



SELECT *
FROM loja
ORDER BY nome ASC;

SELECT *
FROM funcionario
ORDER BY nome ASC;

SELECT *
FROM fornecedor
ORDER BY nome ASC;

SELECT *
FROM categoria
ORDER BY nome ASC;

SELECT *
FROM produto
ORDER BY preco DESC;

SELECT *
FROM cliente
ORDER BY nome ASC;

SELECT *
FROM venda
ORDER BY valor_total DESC;

SELECT *
FROM pagamento
ORDER BY valor_pagamento DESC;



SELECT
    produto.nome AS produto,
    produto.preco,
    categoria.nome AS categoria
FROM produto
JOIN categoria
    ON produto.id_categoria = categoria.id_categoria;

SELECT
    venda.id_venda,
    venda.data,
    cliente.nome AS cliente,
    funcionario.nome AS funcionario,
    produto.nome AS produto,
    venda.valor_total
FROM venda
JOIN cliente
    ON venda.id_cliente = cliente.id_cliente
JOIN funcionario
    ON venda.id_funcionario = funcionario.id_funcionario
JOIN produto
    ON venda.id_produto = produto.id_produto;

SELECT
    SUM(valor_total) AS faturamento_total
FROM venda;