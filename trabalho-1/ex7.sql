-- Exercicio : Mostrar a média de valor total por dia de locação de todas as locações confirmadas e não confirmadas, agrupadas por mês e ano.

SELECT
    TO_CHAR(data_check_in, 'YYYY')::INTEGER AS ano,
    TO_CHAR(data_check_in, 'MM')::INTEGER AS mes,
    ROUND(AVG(valor_total / (data_check_out - data_check_in)), 2) AS valor_medio_geral, 
    ROUND(
        AVG(CASE WHEN r.confirmacao = TRUE THEN valor_total / (data_check_out - data_check_in) ELSE NULL END), 
        2
    ) AS valor_medio_confirmados
FROM 
    Locacao 
LEFT JOIN 
    Reservar r 
    ON Locacao.id = r.id_locacao
GROUP BY 
    ano, 
    mes
ORDER BY 
    ano, 
    mes;