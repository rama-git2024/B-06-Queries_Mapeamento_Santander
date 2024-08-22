WITH subquery AS (
SELECT
    b.F14474 AS dossie,
    d.F27086 AS cpf,
    (CASE
        WHEN b.F25017 = 1 THEN 'Ativo'
        WHEN b.F25017 = 2 THEN 'Encerrado'
        WHEN b.F25017 = 3 THEN 'Acordo'
        WHEN b.F25017 = 4 THEN 'Em encerramento'
        ELSE 'Em precatório (Ativo)'
    END) AS situacao,
    m.F01130 AS carteira,
    CASE
        WHEN j.F01132 IN ('Execução 12.2 - Amortização de valores', 'BA 4.19 - Venda do bem', 'DP 1.6.1 - Operação liquidada') AND YEAR(a.F00385) = 2024 AND m.F01130 NOT LIKE 'IMOB%' THEN 'Sim'
        ELSE 'Não' 
    END AS tipo_financeiro,
    CASE
        WHEN j.F01132 IN ('Execução 12.2 - Amortização de valores', 'BA 4.19 - Venda do bem', 'DP 1.6.1 - Operação liquidada') AND YEAR(a.F00385) = 2024 AND m.F01130 NOT LIKE 'IMOB%' THEN CONVERT(VARCHAR, a.F00395)
        ELSE NULL 
    END AS valor_financeiro
FROM [ramaprod].[dbo].T00069 AS a
LEFT JOIN [ramaprod].[dbo].T00041 AS b ON a.F02003 = b.ID
LEFT JOIN [ramaprod].[dbo].T00064 AS c ON a.F01133 = c.ID
LEFT JOIN [ramaprod].[dbo].T00030 AS d ON b.F05220 = d.ID
LEFT JOIN [ramaprod].[dbo].T00037 AS e ON b.F00177 = e.ID
LEFT JOIN [ramaprod].[dbo].T00035 AS m ON b.F01187 = m.ID
LEFT JOIN [ramaprod].[dbo].T00064 AS j ON a.F01133 = j.ID
)
SELECT
    dossie,
    cpf,
    max(carteira) AS carreira,
    max(tipo_financeiro) AS financeiro,
    max(valor_financeiro) AS valor
FROM subquery 
GROUP BY dossie, cpf
