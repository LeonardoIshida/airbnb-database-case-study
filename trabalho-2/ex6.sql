-- A estrutura da relação, mostrando os atributos de 10 tuplas aleatoriamente;

SELECT 
    *
FROM 
    Propriedade
ORDER BY 
    RANDOM()
LIMIT 10;

-- Mostre quantas Propriedades existem de cada classe (casa inteira, etc.);

SELECT 
    tipo_hospedagem, 
    COUNT(*)
FROM 
    Propriedade
GROUP BY 
    tipo_hospedagem

-- Mostre quantas localizações existem na base

SELECT 
    COUNT(*) as numero_de_localizacoes
FROM (
  SELECT DISTINCT 
    bairro
  FROM 
    Propriedade
) as localizacoes_distintas;