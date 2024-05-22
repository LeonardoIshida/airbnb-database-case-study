-- Exercicio: Mostrar locatários que são mais jovens que algum anfitrião

SELECT 
    Nome
FROM
    Usuario
WHERE 
    (tipo = 'locatário' OR tipo = 'locatário e proprietário')
    AND dt_nascimento > (
        SELECT 
            MIN(dt_nascimento)
        FROM 
            Usuario
        WHERE 
            tipo = 'proprietário' OR tipo = 'locatário e proprietário'
    );


-- Exercicio: Mostrar locatários que são mais jovens que todos anfitriões

SELECT 
    Nome
FROM 
    Usuario 
WHERE 
    (tipo = 'locatário' OR U.tipo = 'locatário e proprietário')
    AND U.dt_nascimento > (
        SELECT 
            MAX(dt_nascimento) 
        FROM 
            Usuario 
        WHERE 
            tipo = 'proprietário' OR tipo = 'locatário e proprietário'
    );
