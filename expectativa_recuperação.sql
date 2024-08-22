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
    e.F00162 AS fase,
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
    END) AS garantia,
    (CASE
        WHEN c.F01132 = 'Execução 2.10 Pesquisa patrimonial negativa' OR c.F01132 = 'Execução 13.1 - Pesquisa patrimonial negativa' OR c.F01132 = 'Execução 2.9 - Pesquisa Patrimonial Positiva'
            OR c.F01132 = 'Pesquisa Patrimonial' OR c.F01132 = 'Pesquisa Patrimonial Positiva'
            THEN 'Sim'
        WHEN c.F01132 = 'Pesquisa Patrimonial Negativa' THEN 'Negativa'
        ELSE 'Não'
    END) AS pesquisa_patrimonial,
    (CASE
        WHEN c.F01132 = 'Execução 13.4 - Parecer de irrecuperabilidade aprovado' OR c.F01132 = 'Parecer de Irrecuperabilidade' OR c.F01132 = 'Parecer de irrecuperabilidade aprovado'
        THEN 'Sim'
        ELSE 'Não'
    END) AS irrecuperabilidade,
    CASE
        WHEN c.F01132 = 'Operação com Garantia' THEN CAST(a.F00395 AS VARCHAR(5000))
    END AS descricao_garantia
FROM [ramaprod].[dbo].T00069 AS a
LEFT JOIN [ramaprod].[dbo].T00041 AS b ON a.F02003 = b.ID
LEFT JOIN [ramaprod].[dbo].T00064 AS c ON a.F01133 = c.ID
LEFT JOIN [ramaprod].[dbo].T00030 AS d ON b.F05220 = d.ID
LEFT JOIN [ramaprod].[dbo].T00037 AS e ON b.F00177 = e.ID
LEFT JOIN [ramaprod].[dbo].T00035 AS m ON b.F01187 = m.ID
)
SELECT
    dossie,
    cpf,
    max(carteira) AS carreira,
    max(situacao) AS situacao,
    max(garantia) AS garantia,
    max(descricao_garantia) AS descricao_garantia,
    max(pesquisa_patrimonial) AS patrimonial,
    max(irrecuperabilidade) AS irrecuperabilidade,
    max(CASE
        WHEN situacao = 'Em encerramento' OR irrecuperabilidade = 'Sim' THEN 'Irrecuperável'
        WHEN (garantia = 'Sim' OR pesquisa_patrimonial = 'Sim') THEN 'Provável'
        WHEN fase = 'Citação' OR fase = 'Pesquisa Patrimonial' THEN 'Possível'
        WHEN pesquisa_patrimonial = 'Negativa' AND garantia = 'Não' THEN 'Remoto'
    END) AS status
FROM subquery 
GROUP BY dossie, cpf
HAVING 
    max(carteira) = 'E1'
