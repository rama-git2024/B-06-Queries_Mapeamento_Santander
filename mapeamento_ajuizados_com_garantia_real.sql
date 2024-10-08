WITH eventos AS (
    SELECT
        d.F14474 AS dossie,
        j.F01132 AS evento,
        a.F00385 AS data_evento,
        n.F27086 AS cpf_cnpj,
        CASE
            WHEN f.F25017 = 1 THEN 'EM ANDAMENTO'
            WHEN f.F25017 = 2 THEN 'EXTINTO'
            WHEN f.F25017 = 3 THEN 'SUSPENSO'
            WHEN f.F25017 = 4 THEN 'SUSPENSO'
            ELSE NULL
        END AS situacao,
        h.F00162 AS fase
    FROM [ramaprod].[dbo].T00069 AS a
    LEFT JOIN [ramaprod].[dbo].T00003 AS b ON a.F08501 = b.ID
    LEFT JOIN [ramaprod].[dbo].T00064 AS c ON a.F01133 = c.ID
    LEFT JOIN [ramaprod].[dbo].T00041 AS d ON a.F02003 = d.ID
    LEFT JOIN [ramaprod].[dbo].T00041 AS e ON a.F02003 = e.ID
    LEFT JOIN [ramaprod].[dbo].T00041 AS f ON a.F02003 = f.ID
    LEFT JOIN [ramaprod].[dbo].T02682 AS g ON f.F43687 = g.ID
    LEFT JOIN [ramaprod].[dbo].T00037 AS h ON f.F00177 = h.ID
    LEFT JOIN [ramaprod].[dbo].T00030 AS i ON f.F11578 = i.ID
    LEFT JOIN [ramaprod].[dbo].T00064 AS j ON a.F01133 = j.ID
    LEFT JOIN [ramaprod].[dbo].T00041 AS k ON a.F02003 = k.ID
    LEFT JOIN [ramaprod].[dbo].T00041 AS l ON a.F02003 = l.ID
    LEFT JOIN [ramaprod].[dbo].T00035 AS m ON f.F01187 = m.ID
    LEFT JOIN [ramaprod].[dbo].T00030 AS n ON f.F05220 = n.ID
    LEFT JOIN [ramaprod].[dbo].T00045 AS o ON f.F00217 = o.ID
    LEFT JOIN [ramaprod].[dbo].T01777 AS p ON f.F34969 = p.ID
    LEFT JOIN [ramaprod].[dbo].T00035 AS q ON p.F24930 = q.ID
    LEFT JOIN [ramaprod].[dbo].T00083 AS r ON f.F14465 = r.ID
    LEFT JOIN [ramaprod].[dbo].T00046 AS s ON r.F00488 = s.ID
    LEFT JOIN [ramaprod].[dbo].T02913 AS t ON d.F47450 = t.ID
    LEFT JOIN [ramaprod].[dbo].T00030 AS v ON f.F05220 = v.ID
    LEFT JOIN [ramaprod].[dbo].T02913 AS x ON v.F47449 = x.ID
    LEFT JOIN [ramaprod].[dbo].T02676 AS z ON d.F43645 = z.ID
    LEFT JOIN [ramaprod].[dbo].T02678 AS w ON d.F43647 = w.ID
    LEFT JOIN [ramaprod].[dbo].T02677 AS y ON d.F43646 = y.ID
    LEFT JOIN [ramaprod].[dbo].T00034 AS aa ON d.F01122 = aa.ID
    WHERE j.F01132 IN (
         'Execução 3.1 - Citação devedor principal',
        'Execução 3.2 - Citação coobrigado',
        'Monitória 2.1 - Citação devedor principal',
        'Monitória 2.2 - Citação coobrigado',
        'Cobrança 2.1 - Citação devedor principal',
        'Cobrança 2.2 - Citação coobrigado',
        'Monitória 2.3 - 1ª Citação negativa',
        'Monitória 2.4 - 2ª Citação negativa',
        'Monitória 2.5 - 3ª Citação negativa',
        'Monitória 2.6 - Certidão negativa',
        'Cobrança 2.3 - 1ª Citação negativa',
        'Cobrança 2.4 - 2ª Citação negativa',
        'Cobrança 2.5 - 3ª Citação negativa',
        'Cobrança 2.6 - Certidão negativa',
        'Execução 3.3 - 1ª Citação negativa',
        'Execução 3.4 - 2ª Citação negativa',
        'Execução 3.5 - 3ª Citação negativa',
        'Execução 3.6 - Certidão negativa',
        'Execução 8.3.4 - Remoção de bem penhorado',
        'BA 2.1 - Deferida liminar de BA/RP',
        'BA 3.1 - Retomada efetivada',
        'BA 3.2 - Retomada parcial',
        'BA 4.14 - Retomada efetivada',
        'BA 4.15 - Retomada parcial',
        'BA 3.4 - Mandado negativo',
        'BA 4.17 - Mandado negativo',
        'Execução 6.1.1 - Deferido bloqueio Bacenjud',
        'Execução 6.18.1 - Resultado pesquisa Infojud',
        'Execução 6.2.1 - Deferido bloqueio Renajud',
        'Execução 4.1.1 - Defesa sem efeito suspensivo',
        'Execução 4.1.6 - Exceção de pré-executividade',
        'Execução 4.1.7 - Embargos à execução',
        'Monitória 3.1 - Embargos monitórios',
        'Cobrança 3.1 - Contestação',
        'Monitória 4.1 - Procedente',
        'Cobrança 4.1 - Procedente',
        'BA 5.1 - Sentença procedente',
        'Homologação 4.1 - Procedente',
        'Monitória 4.2 - Improcedente',
        'Cobrança 4.2 - Improcedente',
        'Homologação 4.2 - Improcedente',
        'BA 5.3 - Sentença improcedente',
        'Monitória 6.4 - Recurso Provido',
        'BA 9.4 - Recurso provido',
        'Execução 15.4 - Recurso provido',
        'Cobrança 6.4 - Recurso provido',
        'Execução 15.6 - Recurso desprovido',
        'BA 9.6 - Recurso desprovido',
        'Monitória 6.6 - Recurso desprovido',
        'Cobrança 6.6 - Recurso desprovido',
        'Execução 6.1.2 - Indeferido',
        'Execução 6.2.2 - Indeferido',
        'Execução 6.3.2 - Indeferido',
        'Execução 6.4.2 - Indeferido',
        'Execução 6.5.2 - Indeferido',
        'Citação Positiva',
        'Citação Positiva - Comparecimento Espontâneo',
        'Cobrança 2.12 - Citação por acordo',
        'Execução 3.14 – Citação por acordo',
        'Monitória 2.12 - Citação por acordo',
        'BA 3.5 - Citação efetivada (sem retomada)',
        'BA 3.6 - Citação efetivada (com retomada)',
        'Monitória 1.1 - Determinada citação',
        'Execução 2.1 - Determinada citação',
        'Citação Negativa'
    ) OR h.F00162 IN ('Inicial', 'Irrecuperabilidade', 'Recursal - Tribunal estadual/regional', 'Recursal - Tribunal superior', 'RJ.10.1 - Recursal, Plano Rejeitado')
),
sub AS (
    SELECT
        d.F14474 as dossie_max,
        MAX(ef.evento) AS ultimo_evento,
        MAX(ef.data_evento) AS data_max,
        MAX(n.F27086) AS documento,
        MAX(ef.situacao) AS situacao_max,
        MAX(h.F00162) AS fase_max
    FROM [ramaprod].[dbo].T00069 AS a
    LEFT JOIN [ramaprod].[dbo].T00003 AS b ON a.F08501 = b.ID
    LEFT JOIN [ramaprod].[dbo].T00064 AS c ON a.F01133 = c.ID
    LEFT JOIN [ramaprod].[dbo].T00041 AS d ON a.F02003 = d.ID
    LEFT JOIN [ramaprod].[dbo].T00041 AS e ON a.F02003 = e.ID
    LEFT JOIN [ramaprod].[dbo].T00041 AS f ON a.F02003 = f.ID
    LEFT JOIN [ramaprod].[dbo].T02682 AS g ON f.F43687 = g.ID
    LEFT JOIN [ramaprod].[dbo].T00037 AS h ON f.F00177 = h.ID
    LEFT JOIN [ramaprod].[dbo].T00030 AS i ON f.F11578 = i.ID
    LEFT JOIN [ramaprod].[dbo].T00064 AS j ON a.F01133 = j.ID
    LEFT JOIN [ramaprod].[dbo].T00041 AS k ON a.F02003 = k.ID
    LEFT JOIN [ramaprod].[dbo].T00041 AS l ON a.F02003 = l.ID
    LEFT JOIN [ramaprod].[dbo].T00035 AS m ON f.F01187 = m.ID
    LEFT JOIN [ramaprod].[dbo].T00030 AS n ON f.F05220 = n.ID
    LEFT JOIN [ramaprod].[dbo].T00045 AS o ON f.F00217 = o.ID
    LEFT JOIN [ramaprod].[dbo].T01777 AS p ON f.F34969 = p.ID
    LEFT JOIN [ramaprod].[dbo].T00035 AS q ON p.F24930 = q.ID
    LEFT JOIN [ramaprod].[dbo].T00083 AS r ON f.F14465 = r.ID
    LEFT JOIN [ramaprod].[dbo].T00046 AS s ON r.F00488 = s.ID
    LEFT JOIN [ramaprod].[dbo].T02913 AS t ON d.F47450 = t.ID
    LEFT JOIN [ramaprod].[dbo].T00030 AS v ON f.F05220 = v.ID
    LEFT JOIN [ramaprod].[dbo].T02913 AS x ON v.F47449 = x.ID
    LEFT JOIN [ramaprod].[dbo].T02676 AS z ON d.F43645 = z.ID
    LEFT JOIN [ramaprod].[dbo].T02678 AS w ON d.F43647 = w.ID
    LEFT JOIN [ramaprod].[dbo].T02677 AS y ON d.F43646 = y.ID
    LEFT JOIN [ramaprod].[dbo].T00034 AS aa ON d.F01122 = aa.ID
    LEFT JOIN eventos AS ef ON d.F14474 = ef.dossie -- Correção no uso da CTE
    GROUP BY d.F14474
    HAVING MAX(ef.evento) is not null
)
SELECT
    dossie_max,
    documento,
    fase_max,
    situacao_max,
    ultimo_evento,
    (CASE

        WHEN situacao_max = 'EXTINTO' THEN 'EXTINTO'

        WHEN fase_max = 'Inicial' THEN 'FASE INICIAL'

        WHEN fase_max = 'Irrecuperabilidade' THEN 'IRRECUPERÁVEL'

        WHEN fase_max IN ('Recursal - Tribunal estadual/regional', 'Recursal - Tribunal superior', 'RJ.10.1 - Recursal, Plano Rejeitado') THEN 'FASE RECURSAL'

        WHEN ultimo_evento IN ('BA 2.1 - Deferida liminar de BA/RP') THEN 'LIMINAR DEFERIDA'

        WHEN ultimo_evento IN ('Execução 3.1 - Citação devedor principal', 'Execução 3.2 - Citação coobrigado', 'Monitória 2.1 - Citação devedor principal', 'Monitória 2.2 - Citação coobrigado', 
            'Cobrança 2.1 - Citação devedor principal', 'Cobrança 2.2 - Citação coobrigado', 'Citação Positiva', 'Citação Positiva - Comparecimento Espontâneo', 'Cobrança 2.12 - Citação por acordo',
        'Execução 3.14 – Citação por acordo', 'Monitória 2.12 - Citação por acordo','BA 3.5 - Citação efetivada (sem retomada)','BA 3.6 - Citação efetivada (com retomada)',
        'Monitória 1.1 - Determinada citação', 'Execução 2.1 - Determinada citação') THEN 'CITAÇÃO POSITIVA'

        WHEN ultimo_evento IN ('Monitória 2.3 - 1ª Citação negativa', 'Monitória 2.4 - 2ª Citação negativa','Monitória 2.5 - 3ª Citação negativa','Monitória 2.6 - Certidão negativa','Cobrança 2.3 - 1ª Citação negativa','Cobrança 2.4 - 2ª Citação negativa',
        'Cobrança 2.5 - 3ª Citação negativa','Cobrança 2.6 - Certidão negativa','Execução 3.3 - 1ª Citação negativa','Execução 3.4 - 2ª Citação negativa','Execução 3.5 - 3ª Citação negativa',
        'Execução 3.6 - Certidão negativa', 'Citação Negativa') THEN 'CITAÇÃO NEGATIVA'

        WHEN ultimo_evento IN ('Execução 8.3.4 - Remoção de bem penhorado','BA 3.1 - Retomada efetivada','BA 3.2 - Retomada parcial','BA 4.14 - Retomada efetivada','BA 4.15 - Retomada parcial') THEN 'RETOMADA REALIZADA'

        WHEN ultimo_evento IN ('BA 3.4 - Mandado negativo','BA 4.17 - Mandado negativo') THEN 'BEM NÃO LOCALIZADO'

        WHEN ultimo_evento IN ('Execução 6.1.1 - Deferido bloqueio Bacenjud','Execução 6.18.1 - Resultado pesquisa Infojud','Execução 6.2.1 - Deferido bloqueio Renajud') THEN 'CONSTRIÇÃO DE BENS DEFERIDO'

        WHEN ultimo_evento IN ( 'Execução 4.1.1 - Defesa sem efeito suspensivo','Execução 4.1.6 - Exceção de pré-executividade','Execução 4.1.7 - Embargos à execução','Monitória 3.1 - Embargos monitórios',
        'Cobrança 3.1 - Contestação') THEN 'DEFESA APRESENTADA'

        WHEN ultimo_evento IN ('Monitória 4.1 - Procedente','Cobrança 4.1 - Procedente','BA 5.1 - Sentença procedente','Homologação 4.1 - Procedente') THEN 'SENTENÇA PROCEDENTE'

        WHEN ultimo_evento IN ('Monitória 4.2 - Improcedente','Cobrança 4.2 - Improcedente','Homologação 4.2 - Improcedente','BA 5.3 - Sentença improcedente') THEN 'SENTENÇA IMPROCEDENTE'

        WHEN ultimo_evento IN ('Monitória 6.4 - Recurso Provido', 'BA 9.4 - Recurso provido', 'Execução 15.4 - Recurso provido', 'Cobrança 6.4 - Recurso provido') THEN 'ACÓRDÃO FAVORÁVEL'

        WHEN ultimo_evento IN ('Execução 15.6 - Recurso desprovido', 'BA 9.6 - Recurso desprovido', 'Monitória 6.6 - Recurso desprovido', 'Cobrança 6.6 - Recurso desprovido') THEN 'ACÓRDÃO DESFAVORÁVEL'

        WHEN ultimo_evento = 'Execução 5.22 - Esgotadas possibilidades de recuperação' THEN 'ARQUIVADO art. 921 , III'

        WHEN ultimo_evento IN ('Execução 6.1.2 -Indeferido', 'Execução 6.2.2 - Indeferido', 'Execução 6.3.2 - Indeferido', 'Execução 6.4.2 - Indeferido', 'Execução 6.5.2 - Indeferido') THEN 'CONSTRIÇÃO DE BENS INDEFERIDA'

        ELSE NULL
    END) AS status,
    data_max
FROM sub;