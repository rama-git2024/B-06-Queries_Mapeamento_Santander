WITH eventos AS (
    SELECT
        d.F14474 AS dossie,
        a.F04461 AS pasta,
        j.F01132 AS evento,
        n.F27086 AS cpf_cnpj,
        aa.F00156 AS tipo_acao,
        CASE
            WHEN f.F25017 = 1 THEN 'EM ANDAMENTO'
            WHEN f.F25017 = 2 THEN 'EXTINTO'
            WHEN f.F25017 = 3 THEN 'SUSPENSO'
            WHEN f.F25017 = 4 THEN 'SUSPENSO'
            ELSE NULL
        END AS situacao,
        h.F00162 AS fase,
        CAST(a.F00385 AS DATE) AS data_evento
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
    WHERE 
        (j.F01132 IN (
           'Execução 1.1 - Data distribuição da ação',
           'BA 1.1 - Distribuição da ação',
           'Monitória 1.4 - Ajuizamento',
           'Cobrança 1.4 - Ajuizamento',
           'CS 1.2 - Iniciado o cumprimento de sentença',

           'BA 2.1 - Deferida liminar de BA/RP',

           'BA 4.2 - Purga da mora (Valores insuficientes)',
           'BA 4.1 - Purga da mora (Valores suficientes)',

           'BA 3.4 - Mandado negativo',
           'BA 4.6 - Novo mandado para o mesmo endereço',
           'BA 4.7 - Novo mandado para novos endereços',
           'BA 4.17 - Mandado negativo',

           'Execução 2.1 - Determinada citação',
           'Execução 3.10 - Tentativa de citação por carta precatória',
           'Execução 3.3 - 1ª citação negativa',
           'Execução 3.4 - 2ª citação negativa',
           'Execução 3.5 - 3ª Citação negativa',
           'Execução 3.6 - Certidão negativa', 
           'Execução 3.7 - Requerida Citação - Edital (L.I.N.S.)',
           'Execução 3.8 - Requerida citação - Hora Certa',
           'Execução 3.9 - Citação Especial indeferida',

           'Execução 2.2 - Deferido arresto liminar',
           'Execução 2.8 - Registro arresto',

           'Execução 3.1 - Citação devedor principal',
           'Execução 3.2 - Citação coobrigado',
           'Execução 3.11 - Citação por Carta Precatória positiva',

           'Execução 6.3.1 - Deferida penhora de veículo',
           'Execução 6.4.1 - Deferida penhora de imóvel',
           'Execução 6.5.1 - Deferida penhora de bens móveis em geral',
           'Execução 6.6.1 - Deferida penhora de títulos e valores mobiliários',
           'Execução 6.7.1 - Deferida penhora de semoventes',
           'Execução 6.8.1 - Deferida penhora de navios / aeronaves',
           'Execução 6.9.1 - Deferida penhora de ações e quotas sociais',
           'Execução 6.10.1 - Deferida penhora de percentual de faturamento',
           'Execução 6.11.1 - Deferida penhora de pedras e metais preciosos',
           'Execução 6.12.1 - Deferida penhora de direitos aquisitivos',
           'Execução 6.13.1 - Deferida penhora de outros direitos',
           'Execução 6.14.1 - Deferida penhora no rosto dos autos',
           'Execução 6.15.1 - Deferida penhora de direitos creditórios',
           'Execução 6.16.1 - Deferida penhora de vencimentos',
           'Execução 6.17.1 - Deferida penhora de moeda digital',
           'Execução 6.18.2 - Bloqueio de documentos concluído',
           'Execução 4.1.4 - Pagamento do débito (insuficiente)',
           'Execução 7.1.2 - Penhora de valores insuficiente',
           'Execução 7.2.2 - Penhora de veículos insuficiente',
           'Execução 7.3.2 - Penhora de imóveis insuficiente',
           'Execução 7.4.2 - Penhora de bens móveis insuficiente',
           'Execução 7.5.2 - Penhora de títulos e valores mobiliários insuficiente',
           'Execução 7.6.2 - Penhora de semoventes insuficiente',
           'Execução 7.7.2 - Penhora de navios/aeronaves insuficiente',
           'Execução 7.8.2 - Penhora de ações e quotas insuficiente',
           'Execução 7.9.2 - Penhora de percentual de faturamento insuficiente',
           'Execução 7.10.2 - Penhora de pedras e metais preciosos insuficiente',
           'Execução 7.11.2 - Penhora de direitos aquisitivos insuficiente',
           'Execução 7.12.2 - Penhora de outros direitos insuficiente',
           'Execução 7.13.2 - Penhora no rosto dos autos insuficiente',
           'Execução 7.14.2 - Penhora de direitos creditórios insuficiente',
           'Execução 7.15.2 - Penhora de vencimentos insuficiente',
           'Execução 7.16.2 - Penhora de moeda digital insuficiente',
           'Execução 7.1.1 - Penhora de valores suficiente',
           'Execução 7.2.1 - Penhora de veículos suficiente',
           'Execução 7.3.1 - Penhora de imóveis suficiente',
           'Execução 7.4.1 - penhora de bens móveis suficientes',
           'Execução 7.5.1 - Penhora de títulos e valores mobiliários suficiente',
           'Execução 7.6.1 - Penhora de semoventes suficiente',
           'Execução 7.7.1 - Penhora de navios / aeronaves suficiente',
           'Execução 7.8.1 - Penhora de ações e quotas suficiente',
           'Execução 7.9.1 - Penhora de percentual de faturamento suficiente',
           'Execução 7.10.1 - Penhora de pedras e metais preciosos suficiente',
           'Execução 7.11.1 - Penhora de direitos aquisitivos suficiente',
           'Execução 7.12.1 - penhora de outros direitos suficiente',
           'Execução 7.13.1 - Penhora no rosto dos autos suficiente',
           'Execução 7.14.1 - Penhora de direitos creditórios suficiente',
           'Execução 7.15.1 - Penhora de vencimentos suficiente',
           'Execução 7.16.1 - Penhora de moeda digital suficiente',

           'Execução 5.1 - Pedido de bloqueio Bacenjud',
           'Execução 5.2 - Pedido de bloqueio Renajud',
           'Execução 5.21 - pedido de bloqueio de documentos',
           'Execução 6.1.1 - Deferido bloqueio Bacenjud',
           'Execução 6.18.2 - Bloqueio de documentos concluído',
           'Execução 6.2.1 - Deferido bloqueio Renajud',
           'Execução 7.1.3 - Impugnação de bloqueio',

           'Execução 11.1 - Requerida expedição de alvará',
           'Execução 11.2 - Deferida expedição de alvará',
           'Execução 11.3 - Alvará expedido',
           'Execução 11.4 - Alvará retirado',

           'Cobrança 1.1 - Determinada citação',
           'Cobrança 2.10 - Tentativa de citação por carta precatória',
           'Cobrança 2.3 -  1ª Citação negativa',
           'Cobrança 2.4 -  2ª Citação negativa',
           'Cobrança 2.5 -  3ª Citação negativa',
           'Cobrança 2.7 -  Requerida Citação - Edital (L.I.N.S.)',
           'Cobrança 2.8 -  Requerida Citação - Hora Certa',
           'Cobrança 2.9 -  Citação Especial Indeferida',
           'Monitória 1.1 - Determinada citação',
           'Monitória 2.10 - Tentativa de citação por carta precatória',
           'Monitória 2.3 - 1ª citação negativa',
           'Monitória 2.4 -2ª citação negativa',
           'Monitória 2.5 - 3ª citação negativa',
           'Monitória 2.6 - Certidão negativa',
           'Monitória 2.7 - Requerida Citação - Edital (L.I.N.S.)',
           'Monitória 2.8 - Requerida Citação - Hora Certa',
           'Monitória 2.9 - Citação Especial Indeferida',

           'Cobrança 2.1 -  Citação devedor principal',
           'Cobrança 2.11 -  Citação por carta precatória positiva',
           'Cobrança 2.2 -  Citação coobrigado',
           'Monitória 2.1 - Citação devedor principal',
           'Monitória 2.11- Citação por carta precatória positiva',
           'Monitória 2.2 - Citação coobrigado',

           'Suspensão do Feito',
           'Arquivamento Administrativo por falta de bens',
           'Execução 13.3 - Parecer de irrecuperabilidade elaborado',

           'Sentença de Extinção da Execução',
           'Sentença Extinção da Busca e Apreensão'


        ) OR h.F00162 IN ('Inicial', 'Irrecuperabilidade','Pré-ajuizamento', 'Suspenso') OR aa.F00156 = 'Pré-ajuizamento') 
        AND f.F25017 = 1 
),
sub AS (
    SELECT
        d.F14474 as dossie_max,
        a.F04461 AS pasta_max,
        MAX(ef.evento) AS ultimo_evento,
        MAX(ef.data_evento) AS data_max,
        MAX(n.F27086) AS documento,
        MAX(ef.situacao) AS situacao_max,
        MAX(h.F00162) AS fase_max,
        MAX(aa.F00156) AS tipo_acao_max
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
    GROUP BY a.F04461, d.F14474
    HAVING MAX(ef.evento) is not null

)
SELECT
    pasta_max,
    dossie_max,
    documento,
    fase_max,
    situacao_max,
    ultimo_evento,
    tipo_acao_max,
    (CASE

        WHEN tipo_acao_max = 'Pré-ajuizamento' THEN 'Pré-ajuizamento'

        WHEN fase_max = 'Pré-ajuizamento' THEN 'Pré-ajuizamento'

        WHEN fase_max = 'Inicial' THEN 'Pré-ajuizamento'

        WHEN situacao_max = 'EXTINTO' THEN 'Proc. Extinto'

        WHEN fase_max = 'Irrecuperabilidade' THEN 'Proc. Suspenso'

        WHEN fase_max = 'Suspenso' THEN 'Proc. Suspenso'

        WHEN ultimo_evento IN ('Suspensão do Feito','Arquivamento Administrativo por falta de bens','Execução 13.3 - Parecer de irrecuperabilidade elaborado') THEN 'Proc. Suspenso'

        WHEN ultimo_evento IN ('Sentença de Extinção da Execução', 'Sentença Extinção da Busca e Apreensão') THEN 'Proc. Extinto'

        WHEN ultimo_evento IN ('Execução 1.1 - Data distribuição da ação','BA 1.1 - Distribuição da ação','Monitória 1.4 - Ajuizamento','Cobrança 1.4 - Ajuizamento', 'CS 1.2 - Iniciado o cumprimento de sentença') THEN 'Ação Distribuida'

        WHEN ultimo_evento = 'BA 2.1 - Deferida liminar de BA/RP' THEN 'Liminar Deferida'

        WHEN  ultimo_evento IN ('BA 4.2 - Purga da mora (Valores insuficientes)','BA 4.1 - Purga da mora (Valores suficientes)') THEN 'Purgação da Mora'

        WHEN ultimo_evento IN ('BA 3.4 - Mandado negativo','BA 4.6 - Novo mandado para o mesmo endereço','BA 4.7 - Novo mandado para novos endereços',
            'BA 4.17 - Mandado negativo') THEN ' Mandado Negativo'

        WHEN ultimo_evento IN ( 'Execução 2.1 - Determinada citação','Execução 3.10 - Tentativa de citação por carta precatória','Execução 3.3 - 1ª citação negativa',
           'Execução 3.4 - 2ª citação negativa','Execução 3.5 - 3ª Citação negativa','Execução 3.7 - Requerida Citação - Edital (L.I.N.S.)','Execução 3.8 - Requerida citação - Hora Certa',
           'Execução 3.9 - Citação Especial indeferida') THEN 'Citação Neg./Tentativa'

        WHEN ultimo_evento IN ('Execução 2.2 - Deferido arresto liminar','Execução 2.8 - Registro arresto') THEN 'Arresto Deferido'

        WHEN ultimo_evento IN ( 'Execução 3.1 - Citação devedor principal','Execução 3.2 - Citação coobrigado','Execução 3.11 - Citação por Carta Precatória positiva') THEN 'Citação Positiva'

        WHEN ultimo_evento IN ('Execução 6.3.1 - Deferida penhora de veículo','Execução 6.4.1 - Deferida penhora de imóvel','Execução 6.5.1 - Deferida penhora de bens móveis em geral',
           'Execução 6.6.1 - Deferida penhora de títulos e valores mobiliários','Execução 6.7.1 - Deferida penhora de semoventes','Execução 6.8.1 - Deferida penhora de navios / aeronaves',
           'Execução 6.9.1 - Deferida penhora de ações e quotas sociais','Execução 6.10.1 - Deferida penhora de percentual de faturamento','Execução 6.11.1 - Deferida penhora de pedras e metais preciosos',
           'Execução 6.12.1 - Deferida penhora de direitos aquisitivos','Execução 6.13.1 - Deferida penhora de outros direitos','Execução 6.14.1 - Deferida penhora no rosto dos autos',
           'Execução 6.15.1 - Deferida penhora de direitos creditórios','Execução 6.16.1 - Deferida penhora de vencimentos','Execução 6.17.1 - Deferida penhora de moeda digital','Execução 6.18.2 - Bloqueio de documentos concluído',
           'Execução 4.1.4 - Pagamento do débito (insuficiente)','Execução 7.1.2 - Penhora de valores insuficiente','Execução 7.2.2 - Penhora de veículos insuficiente','Execução 7.3.2 - Penhora de imóveis insuficiente',
           'Execução 7.4.2 - Penhora de bens móveis insuficiente','Execução 7.5.2 - Penhora de títulos e valores mobiliários insuficiente','Execução 7.6.2 - Penhora de semoventes insuficiente',
           'Execução 7.7.2 - Penhora de navios/aeronaves insuficiente','Execução 7.8.2 - Penhora de ações e quotas insuficiente','Execução 7.9.2 - Penhora de percentual de faturamento insuficiente',
           'Execução 7.10.2 - Penhora de pedras e metais preciosos insuficiente','Execução 7.11.2 - Penhora de direitos aquisitivos insuficiente','Execução 7.12.2 - Penhora de outros direitos insuficiente',
           'Execução 7.13.2 - Penhora no rosto dos autos insuficiente','Execução 7.14.2 - Penhora de direitos creditórios insuficiente','Execução 7.15.2 - Penhora de vencimentos insuficiente',
           'Execução 7.16.2 - Penhora de moeda digital insuficiente','Execução 7.1.1 - Penhora de valores suficiente','Execução 7.2.1 - Penhora de veículos suficiente','Execução 7.3.1 - Penhora de imóveis suficiente',
           'Execução 7.4.1 - penhora de bens móveis suficientes','Execução 7.5.1 - Penhora de títulos e valores mobiliários suficiente','Execução 7.6.1 - Penhora de semoventes suficiente','Execução 7.7.1 - Penhora de navios / aeronaves suficiente',
           'Execução 7.8.1 - Penhora de ações e quotas suficiente','Execução 7.9.1 - Penhora de percentual de faturamento suficiente','Execução 7.10.1 - Penhora de pedras e metais preciosos suficiente',
           'Execução 7.11.1 - Penhora de direitos aquisitivos suficiente','Execução 7.12.1 - penhora de outros direitos suficiente','Execução 7.13.1 - Penhora no rosto dos autos suficiente',
           'Execução 7.14.1 - Penhora de direitos creditórios suficiente','Execução 7.15.1 - Penhora de vencimentos suficiente','Execução 7.16.1 - Penhora de moeda digital suficiente') THEN 'Penhora Deferida'

        WHEN ultimo_evento IN ( 'Execução 5.1 - Pedido de bloqueio Bacenjud','Execução 5.2 - Pedido de bloqueio Renajud','Execução 5.21 - pedido de bloqueio de documentos',
           'Execução 6.1.1 - Deferido bloqueio Bacenjud','Execução 6.18.2 - Bloqueio de documentos concluído','Execução 6.2.1 - Deferido bloqueio Renajud','Execução 7.1.3 - Impugnação de bloqueio') THEN 'Bloqueio Deferido'

        WHEN ultimo_evento IN ('Execução 11.1 - Requerida expedição de alvará','Execução 11.2 - Deferida expedição de alvará','Execução 11.3 - Alvará expedido',
           'Execução 11.4 - Alvará retirado') THEN 'Levantamento de Alvará'

        WHEN ultimo_evento IN ('Cobrança 1.1 - Determinada citação','Cobrança 2.10 - Tentativa de citação por carta precatória',
           'Cobrança 2.3 -  1ª Citação negativa','Cobrança 2.4 -  2ª Citação negativa','Cobrança 2.5 -  3ª Citação negativa','Cobrança 2.7 -  Requerida Citação - Edital (L.I.N.S.)','Cobrança 2.8 -  Requerida Citação - Hora Certa',
           'Cobrança 2.9 -  Citação Especial Indeferida','Monitória 1.1 - Determinada citação','Monitória 2.10 - Tentativa de citação por carta precatória','Monitória 2.3 - 1ª citação negativa',
           'Monitória 2.4 -2ª citação negativa','Monitória 2.5 - 3ª citação negativa','Monitória 2.7 - Requerida Citação - Edital (L.I.N.S.)','Monitória 2.8 - Requerida Citação - Hora Certa',
           'Monitória 2.9 - Citação Especial Indeferida', 'Monitória 2.6 - Certidão negativa') THEN 'Citação Neg./Tentativa'

        WHEN ultimo_evento IN ('Cobrança 2.1 -  Citação devedor principal','Cobrança 2.11 -  Citação por carta precatória positiva',
           'Cobrança 2.2 -  Citação coobrigado','Monitória 2.1 - Citação devedor principal','Monitória 2.11- Citação por carta precatória positiva','Monitória 2.2 - Citação coobrigado') THEN 'Citação Positiva'

        ELSE NULL
    END) AS status,
    data_max
FROM sub

