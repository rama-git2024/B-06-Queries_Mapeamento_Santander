SELECT
	b.F14474 AS dossie,
	d.F27086 AS cpf,
    c.F01132 AS evento,
    e.F00162 AS fase,
	CASE
		WHEN c.F01132 = 'Execução 2.10 Pesquisa patrimonial negativa' OR c.F01132 = 'Execução 13.1 - Pesquisa patrimonial negativa' OR c.F01132 = 'Execução 2.9 - Pesquisa Patrimonial Positiva'
            OR c.F01132 = 'Pesquisa Patrimonial Negativa' OR c.F01132 = 'Pesquisa Patrimonial' OR c.F01132 = 'Pesquisa Patrimonial Positiva'
        	THEN CAST(a.F00395 AS VARCHAR(2000))
        ELSE NULL
    END pesquisa_patrimonial,
    a.F00385 AS data
FROM [ramaprod].[dbo].T00069 AS a
LEFT JOIN [ramaprod].[dbo].T00041 AS b ON a.F02003 = b.ID
LEFT JOIN [ramaprod].[dbo].T00064 AS c ON a.F01133 = c.ID
LEFT JOIN [ramaprod].[dbo].T00030 AS d ON b.F05220 = d.ID
LEFT JOIN [ramaprod].[dbo].T00037 AS e ON b.F00177 = e.ID
WHERE
    (CASE
        WHEN c.F01132 = 'Execução 2.10 Pesquisa patrimonial negativa' OR c.F01132 = 'Execução 13.1 - Pesquisa patrimonial negativa' OR c.F01132 = 'Execução 2.9 - Pesquisa Patrimonial Positiva'
            OR c.F01132 = 'Pesquisa Patrimonial Negativa' OR c.F01132 = 'Pesquisa Patrimonial' OR c.F01132 = 'Pesquisa Patrimonial Positiva'
            THEN CAST(a.F00395 AS VARCHAR(2000))
        ELSE NULL
    END ) IS NOT NULL