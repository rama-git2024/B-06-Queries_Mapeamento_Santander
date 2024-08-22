SELECT
	b.F14474 AS dossie,
	d.F27086 AS cpf,
    m.F01130 AS carteira,
    e.F00162 AS fase,
	CASE
		WHEN c.F01132 = 'Operação com Garantia' 
            AND a.F00395 IS NULL
            THEN 'Aval'
		WHEN c.F01132 = 'Operação com Garantia' 
			AND (a.F00395 LIKE '%Creditórios%' OR a.F00395 LIKE '%creditórios%' OR a.F00395 LIKE '%Creditorios%' OR a.F00395 LIKE '%creditorios%') 
        	THEN 'Direitos Creditórios'
        WHEN c.F01132 = 'Operação com Garantia'
            AND (a.F00395 LIKE '%Veículo%' OR a.F00395 LIKE '%veiculo%' OR a.F00395 LIKE '%Caminhão%' OR a.F00395 LIKE '%caminhão%' OR a.F00395 LIKE '%camionete%' OR 
                	a.F00395 LIKE '%camioneta%' OR a.F00395 LIKE '%reboque%' OR a.F00395 LIKE '%carro%' OR a.F00395 LIKE '%auto%' OR a.F00395 LIKE '%AUTO%')
            THEN 'Veículo'
        WHEN c.F01132 = 'Operação com Garantia'
        	AND (a.F00395 LIKE '%máquina%' OR a.F00395 LIKE '%Máquina%' OR a.F00395 LIKE '%maquinário%' OR a.F00395 LIKE '%Maquin%' OR a.F00395 LIKE '%MÁQUI%' OR a.F00395 LIKE '%MAQUI%' 
        		OR a.F00395 LIKE '%kit%' OR a.F00395 LIKE '%KIT%')
            THEN 'Maquinário'
        WHEN c.F01132 = 'Operação com Garantia'
        	AND (a.F00395 LIKE '%imóvel%' OR a.F00395 LIKE '%Imóvel%' OR a.F00395 LIKE '%casa%' OR a.F00395 LIKE '%apar%' OR a.F00395 LIKE 'Terren' OR a.F00395 LIKE 'terren' 
        		OR a.F00395 LIKE '%fidu%' OR a.F00395 LIKE '%FIDU%')
            THEN 'Imóvel'
        WHEN c.F01132 = 'Operação com Garantia' THEN 'Sim'
        ELSE 'Não'
    END garantia,
    CASE
    	WHEN c.F01132 = 'Operação com Garantia' THEN CAST(a.F00395 AS VARCHAR(5000))
    END AS descricao_garantia
FROM [ramaprod].[dbo].T00069 AS a
LEFT JOIN [ramaprod].[dbo].T00041 AS b ON a.F02003 = b.ID
LEFT JOIN [ramaprod].[dbo].T00064 AS c ON a.F01133 = c.ID
LEFT JOIN [ramaprod].[dbo].T00030 AS d ON b.F05220 = d.ID
LEFT JOIN [ramaprod].[dbo].T00037 AS e ON b.F00177 = e.ID
LEFT JOIN [ramaprod].[dbo].T00035 AS m ON b.F01187 = m.ID
WHERE 
	d.F27086 IS NOT NULL
	AND
	(CASE
		WHEN c.F01132 = 'Operação com Garantia' 
            AND a.F00395 IS NULL
            THEN 'Aval'
		WHEN c.F01132 = 'Operação com Garantia' 
			AND (a.F00395 LIKE '%Creditórios%' OR a.F00395 LIKE '%creditórios%' OR a.F00395 LIKE '%Creditorios%' OR a.F00395 LIKE '%creditorios%') 
        	THEN 'Direitos Creditórios'
        WHEN c.F01132 = 'Operação com Garantia'
            AND (a.F00395 LIKE '%Veículo%' OR a.F00395 LIKE '%veiculo%' OR a.F00395 LIKE '%Caminhão%' OR a.F00395 LIKE '%caminhão%' OR a.F00395 LIKE '%camionete%' OR 
                	a.F00395 LIKE '%camioneta%' OR a.F00395 LIKE '%reboque%' OR a.F00395 LIKE '%carro%' OR a.F00395 LIKE '%auto%' OR a.F00395 LIKE '%AUTO%')
            THEN 'Veículo'
        WHEN c.F01132 = 'Operação com Garantia'
        	AND (a.F00395 LIKE '%máquina%' OR a.F00395 LIKE '%Máquina%' OR a.F00395 LIKE '%maquinário%' OR a.F00395 LIKE '%Maquin%' OR a.F00395 LIKE '%MÁQUI%' OR a.F00395 LIKE '%MAQUI%' 
        		OR a.F00395 LIKE '%kit%' OR a.F00395 LIKE '%KIT%')
            THEN 'Maquinário'
        WHEN c.F01132 = 'Operação com Garantia'
        	AND (a.F00395 LIKE '%imóvel%' OR a.F00395 LIKE '%Imóvel%' OR a.F00395 LIKE '%casa%' OR a.F00395 LIKE '%apar%' OR a.F00395 LIKE 'Terren' OR a.F00395 LIKE 'terren' 
        		OR a.F00395 LIKE '%fidu%' OR a.F00395 LIKE '%FIDU%')
            THEN 'Imóvel'
        WHEN c.F01132 = 'Operação com Garantia' THEN 'Sim'
        ELSE 'Não'
    END) <> 'Ñão' AND
    m.F01130 = 'E1'
