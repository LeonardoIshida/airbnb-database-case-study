SELECT 
    L.id as id_locacao,
    P.id as id_prop,
    R.nome_locatario as nome_loc,
    R.sobrenome_locatario as sobrenome_loc,
    R.num_tel_locatario as num_tel_loc,
    data_check_out - data_check_in as dias_locados,
    P.preco_noite as preco_diaria
FROM 
    Reservar as R 
    JOIN
        Locacao as L 
        ON (R.id_locacao = L.id) 
    JOIN
        Propriedade as P 
        ON (R.id_prop = P.id)
WHERE
    R.confirmacao = TRUE and
    L.data_check_in - '2024-04-01' > 0;