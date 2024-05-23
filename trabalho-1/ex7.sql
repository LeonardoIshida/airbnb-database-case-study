-- Exercicio : Mostrar a média do preço da noite por dia de locação de todas as locações confirmadas e não confirmadas, agrupadas por mês

SELECT 
    valores_mensais_totais.mes, 
    preco_medio, 
    preco_medio_confirmado
FROM
    (
        SELECT
            TO_CHAR(data_check_in, 'MM')::INTEGER AS mes,
            ROUND(AVG (P.preco_noite), 2) as preco_medio
        FROM
            Locacao 
            JOIN 
                Reservar as R 
                ON Locacao.id = R.id_locacao
            JOIN
                Propriedade as P
                ON P.id = R.id_prop
        GROUP BY  
            mes
    ) as valores_mensais_totais
    LEFT OUTER JOIN (
        SELECT
            TO_CHAR(data_check_in, 'MM')::INTEGER AS mes,
            ROUND(AVG (P.preco_noite), 2)  as preco_medio_confirmado
        FROM
            Locacao 
            JOIN 
                Reservar as R 
                ON Locacao.id = R.id_locacao
            JOIN
                Propriedade as P
                ON P.id = R.id_prop
        WHERE
            r.confirmacao = TRUE
        GROUP BY  
            mes
    ) as valores_mensais_confirmados
    ON (valores_mensais_confirmados.mes = valores_mensais_totais.mes)
GROUP BY  
    valores_mensais_totais.mes,
    preco_medio, 
    preco_medio_confirmado
ORDER BY
    valores_mensais_totais.mes ASC