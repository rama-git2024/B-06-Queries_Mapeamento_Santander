SELECT
	b.F14474 AS dossie,
	REPLACE(REPLACE(REPLACE(d.F27086, '.', ''), '/', ''), '-', '') AS cpf,
    (CASE
        WHEN c.F01132 IN 
            ('Execução 7.1.1 - Penhora de valores suficiente', 'Execução 7.1.2 - Penhora de valores insuficiente', 'Execução 7.2.1 - Penhora de veículos suficiente',
            'Execução 7.2.2 - Penhora de veículos insuficiente', 'Execução 7.3.1 - Penhora de imóveis suficiente', 'Execução 7.3.2 - Penhora de imóveis insuficiente',
            'Execução 7.4.1 - penhora de bens móveis suficientes', 'Execução 7.4.2 - penhora de bens móveis insuficiente', 'Execução 7.5.1 - Penhora de títulos e valores mobiliários suficiente',
            'Execução 7.5.2 - Penhora de títulos e valores mobiliários insuficiente', 'Execução 7.6.1 - Penhora de semoventes suficiente', 'Execução 7.6.2 - Penhora de semoventes insuficiente',
            'Execução 7.7.1 - Penhora de navios / aeronaves suficiente', 'Execução 7.7.2 - Penhora de navios/aeronaves insuficiente', 'Execução 7.8.1 - Penhora de ações e quotas suficiente',
            'Execução 7.8.2 - Penhora de ações e quotas insuficiente', 'Execução 7.9.1 - Penhora de percentual de faturamento suficiente', 'Execução 7.9.2 - Penhora de percentual de faturamento insuficiente',
            'Execução 7.10.1 - Penhora de pedras e metais preciosos suficiente', 'Execução 7.10.2 - Penhora de pedras e metais preciosos insuficiente',
            'Execução 7.11.1 - Penhora de direitos aquisitivos suficiente', 'Execução 7.11.2 - Penhora de direitos aquisitivos insuficiente', 'Execução 7.12.1 - penhora de outros direitos suficiente',
            'Execução 7.12.2 - Penhora de outros direitos insuficiente', 'Execução 7.13.1 - Penhora no rosto dos autos suficiente', 'Execução 7.13.2 - Penhora no rosto dos autos insuficiente',
            'Execução 7.14.1 - Penhora de direitos creditórios suficiente', 'Execução 7.14.2 - Penhora de direitos creditórios insuficiente', 'Execução 7.15.1 - Penhora de vencimentos suficiente',
            'Execução 7.15.2 - Penhora de vencimentos insuficiente', 'Execução 7.16.1 - Penhora de moeda digital suficiente', 'Execução 7.16.2 - Penhora de moeda digital insuficiente')
            THEN 'Sim'
        ELSE 'Não'
    END) AS penhora,
	(CASE
		WHEN c.F01132 IN 
            ('Execução 7.1.1 - Penhora de valores suficiente', 'Execução 7.1.2 - Penhora de valores insuficiente', 'Execução 7.2.1 - Penhora de veículos suficiente',
            'Execução 7.2.2 - Penhora de veículos insuficiente', 'Execução 7.3.1 - Penhora de imóveis suficiente', 'Execução 7.3.2 - Penhora de imóveis insuficiente',
            'Execução 7.4.1 - penhora de bens móveis suficientes', 'Execução 7.4.2 - penhora de bens móveis insuficiente', 'Execução 7.5.1 - Penhora de títulos e valores mobiliários suficiente',
            'Execução 7.5.2 - Penhora de títulos e valores mobiliários insuficiente', 'Execução 7.6.1 - Penhora de semoventes suficiente', 'Execução 7.6.2 - Penhora de semoventes insuficiente',
            'Execução 7.7.1 - Penhora de navios / aeronaves suficiente', 'Execução 7.7.2 - Penhora de navios/aeronaves insuficiente', 'Execução 7.8.1 - Penhora de ações e quotas suficiente',
            'Execução 7.8.2 - Penhora de ações e quotas insuficiente', 'Execução 7.9.1 - Penhora de percentual de faturamento suficiente', 'Execução 7.9.2 - Penhora de percentual de faturamento insuficiente',
            'Execução 7.10.1 - Penhora de pedras e metais preciosos suficiente', 'Execução 7.10.2 - Penhora de pedras e metais preciosos insuficiente',
            'Execução 7.11.1 - Penhora de direitos aquisitivos suficiente', 'Execução 7.11.2 - Penhora de direitos aquisitivos insuficiente', 'Execução 7.12.1 - penhora de outros direitos suficiente',
            'Execução 7.12.2 - Penhora de outros direitos insuficiente', 'Execução 7.13.1 - Penhora no rosto dos autos suficiente', 'Execução 7.13.2 - Penhora no rosto dos autos insuficiente',
            'Execução 7.14.1 - Penhora de direitos creditórios suficiente', 'Execução 7.14.2 - Penhora de direitos creditórios insuficiente', 'Execução 7.15.1 - Penhora de vencimentos suficiente',
            'Execução 7.15.2 - Penhora de vencimentos insuficiente', 'Execução 7.16.1 - Penhora de moeda digital suficiente', 'Execução 7.16.2 - Penhora de moeda digital insuficiente')
        	THEN CAST(a.F00395 AS VARCHAR(2000))
        ELSE NULL
    END) AS descricao_penhora,
    a.F00385 AS data
FROM [ramaprod].[dbo].T00069 AS a
LEFT JOIN [ramaprod].[dbo].T00041 AS b ON a.F02003 = b.ID
LEFT JOIN [ramaprod].[dbo].T00064 AS c ON a.F01133 = c.ID
LEFT JOIN [ramaprod].[dbo].T00030 AS d ON b.F05220 = d.ID
WHERE
    (CASE
        WHEN c.F01132 IN 
            ('Execução 7.1.1 - Penhora de valores suficiente', 'Execução 7.1.2 - Penhora de valores insuficiente', 'Execução 7.2.1 - Penhora de veículos suficiente',
            'Execução 7.2.2 - Penhora de veículos insuficiente', 'Execução 7.3.1 - Penhora de imóveis suficiente', 'Execução 7.3.2 - Penhora de imóveis insuficiente',
            'Execução 7.4.1 - penhora de bens móveis suficientes', 'Execução 7.4.2 - penhora de bens móveis insuficiente', 'Execução 7.5.1 - Penhora de títulos e valores mobiliários suficiente',
            'Execução 7.5.2 - Penhora de títulos e valores mobiliários insuficiente', 'Execução 7.6.1 - Penhora de semoventes suficiente', 'Execução 7.6.2 - Penhora de semoventes insuficiente',
            'Execução 7.7.1 - Penhora de navios / aeronaves suficiente', 'Execução 7.7.2 - Penhora de navios/aeronaves insuficiente', 'Execução 7.8.1 - Penhora de ações e quotas suficiente',
            'Execução 7.8.2 - Penhora de ações e quotas insuficiente', 'Execução 7.9.1 - Penhora de percentual de faturamento suficiente', 'Execução 7.9.2 - Penhora de percentual de faturamento insuficiente',
            'Execução 7.10.1 - Penhora de pedras e metais preciosos suficiente', 'Execução 7.10.2 - Penhora de pedras e metais preciosos insuficiente',
            'Execução 7.11.1 - Penhora de direitos aquisitivos suficiente', 'Execução 7.11.2 - Penhora de direitos aquisitivos insuficiente', 'Execução 7.12.1 - penhora de outros direitos suficiente',
            'Execução 7.12.2 - Penhora de outros direitos insuficiente', 'Execução 7.13.1 - Penhora no rosto dos autos suficiente', 'Execução 7.13.2 - Penhora no rosto dos autos insuficiente',
            'Execução 7.14.1 - Penhora de direitos creditórios suficiente', 'Execução 7.14.2 - Penhora de direitos creditórios insuficiente', 'Execução 7.15.1 - Penhora de vencimentos suficiente',
            'Execução 7.15.2 - Penhora de vencimentos insuficiente', 'Execução 7.16.1 - Penhora de moeda digital suficiente', 'Execução 7.16.2 - Penhora de moeda digital insuficiente')
            THEN 'Sim'
        ELSE 'Não'
    END) <> 'Não'
ORDER BY data DESC;











