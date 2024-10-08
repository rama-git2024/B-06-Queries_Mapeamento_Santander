WITH subquery AS (
    SELECT
        b.F14474 AS dossie,
        d.F27086 AS cpf,
        m.F01130 AS carteira,
        e.F00162 AS fase,
        CASE WHEN c.F01132 = 'Operação com Garantia' THEN 1 ELSE 0 END AS evento_garantia,
        CASE
            WHEN c.F01132 = 'Operação com Garantia' 
                AND (a.F00395 LIKE '%Veículo%' OR a.F00395 LIKE '%veiculo%' OR a.F00395 LIKE '%Caminhão%' OR a.F00395 LIKE '%caminhão%' OR a.F00395 LIKE '%camionete%' OR 
                        a.F00395 LIKE '%camioneta%' OR a.F00395 LIKE '%reboque%' OR a.F00395 LIKE '%carro%' OR a.F00395 LIKE '%auto%' OR a.F00395 LIKE '%AUTO%' OR a.F00395 LIKE '%máquina%' OR a.F00395 LIKE '%Máquina%' 
                        OR a.F00395 LIKE '%maquinário%' OR a.F00395 LIKE '%Maquin%' OR a.F00395 LIKE '%MÁQUI%' OR a.F00395 LIKE '%MAQUI%' 
                    OR a.F00395 LIKE '%kit%' OR a.F00395 LIKE '%KIT%' OR a.F00395 LIKE '%cam%' OR a.F00395 LIKE '%Cam%' OR a.F00395 LIKE '%Auto%' OR a.F00395 LIKE '%Auto%' OR a.F00395 LIKE '%trator%' OR a.F00395 LIKE '%Modelo%'
                    OR a.F00395 LIKE '%MODELO%'  OR a.F00395 LIKE '%Marca%' OR a.F00395 LIKE '%MARCA%' OR a.F00395 LIKE '%chassi%' OR a.F00395 LIKE '%Chassi%' OR a.F00395 LIKE '%CHASSI%' 
                    OR a.F00395 LIKE '%Renava%' OR a.F00395 LIKE '%RENAV%' OR a.F00395 LIKE '%renav%' OR a.F00395 LIKE '%Veíc%' OR a.F00395 LIKE '%Marca%' OR a.F00395 LIKE '%marca%')
                THEN 'MÓVEL'
            WHEN c.F01132 = 'Operação com Garantia'
                AND (a.F00395 LIKE '%imóvel%' OR a.F00395 LIKE '%Imóvel%' OR a.F00395 LIKE '%casa%' OR a.F00395 LIKE '%apar%' OR a.F00395 LIKE 'Terren' OR a.F00395 LIKE 'terren' 
                    OR a.F00395 LIKE '%fidu%' OR a.F00395 LIKE '%FIDU%' OR a.F00395 LIKE '%ap%' OR a.F00395 LIKE '%box%' OR a.F00395 LIKE '%ideal%' OR a.F00395 LIKE '%fração%' OR a.F00395 LIKE '%Fração%')
                THEN 'IMÓVEL'
            ELSE 'NÃO É GARANTIA REAL'
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
        (CASE WHEN c.F01132 = 'Operação com Garantia' THEN 1 ELSE 0 END) = 1
        AND b.F14474 IS NOT NULL
)
SELECT
    dossie,
    MAX(cpf) AS doc,
    MAX(fase) AS fase_max,
    MAX(evento_garantia) AS evento_max,
    MAX(garantia) AS garantia_max,
    MAX(descricao_garantia) AS descricao_garantia_max
FROM subquery
GROUP BY dossie