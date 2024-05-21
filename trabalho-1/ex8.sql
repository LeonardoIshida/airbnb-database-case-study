SELECT 
    P.nome_dono,
    U.cidade,
    numero_prop,
    CB.num_conta,
    COUNT(CB.num_conta) as quant_locacoes
FROM 
    Reservar as R 
    JOIN 
        Propriedade as P 
        ON (R.id_prop = P.id) 
    JOIN (
        SELECT 
            P.nome_dono,
            P.sobrenome_dono,
            P.num_tel_dono,
            COUNT(*) as numero_prop
        FROM 
            Propriedade as P
        GROUP BY 
            P.nome_dono,
            P.sobrenome_dono,
            P.num_tel_dono
    ) as quant_propriedades 
        Using (nome_dono, sobrenome_dono, num_tel_dono) 
    JOIN
        Usuario as U 
        ON (P.nome_dono, P.sobrenome_dono, P.num_tel_dono) = 
            (U.nome, U.sobrenome, U.num_tel)
    JOIN 
        Conta_bancaria as CB 
            ON (P.nome_dono, P.sobrenome_dono, P.num_tel_dono) =
                (CB.nome_dono, CB.sobrenome_dono, CB.num_tel_dono)
GROUP BY 
    P.nome_dono,
    numero_prop,
    U.cidade,
    CB.num_conta
HAVING 
    COUNT(CB.num_conta) >= 3;