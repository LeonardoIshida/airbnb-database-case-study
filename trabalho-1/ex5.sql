-- Exercicio: Mostrar relacao inteira
SELECT *
FROM 
    Propriedade
ORDER BY 
    id ASC
LIMIT 15;

-- Exercicio: Mostrar quantas Propriedades existem de cada classe
SELECT 
    tipo_hospedagem,
    COUNT(*)
FROM 
    Propriedade
GROUP BY 
    tipo_hospedagem;

-- Exercicio: Mostrar quantas Propriedades existem de cada Cidade
SELECT 
    L.cidade,
    COUNT(P.id)
FROM
    Propriedade as P 
    RIGHT OUTER JOIN
        Localizacao as L 
        ON (P.cidade, P.estado, P.pais) = 
            (L.cidade, L.estado, L.pais)
GROUP BY 
    L.cidade
ORDER BY 
    COUNT(P.id) DESC,
    L.cidade ASC
LIMIT 15;