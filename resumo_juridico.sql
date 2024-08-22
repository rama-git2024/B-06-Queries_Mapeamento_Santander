Solicitação de Documentos
Solicitado Kit Contrato
Solicitada Planilha de Cálculos
Solicitada Notificação
Retorno diligência - e-mail
Aguardando Pesquisa Patrimonial
Fora da Régua de Ajuizamento
Prazo Prescricional
Encerramento Definitivo




WITH subquery AS (
    SELECT 
        b.F14474 AS dossie,
        MAX(b.F01187) AS produto,
        MAX(b.F35249) AS data_benner,
        MAX (
            CASE
                WHEN b.F25017 = 1 THEN 'Ativo'
                WHEN b.F25017 = 2 THEN 'Encerrado'
                WHEN b.F25017 = 3 THEN 'Acordo'         
                WHEN b.F25017 = 4 THEN 'Em encerramento'
                ELSE 'Em precatório (Ativo)'
            END 
            ) AS situacao,
        MAX(d.F00162) AS fase,
        MAX(c.F00091) AS adverso_nome,
        MAX(c.F27086) AS cpf,
        STUFF((
            SELECT ', ' + c.F01132
            FROM [ramaprod].[dbo].T00069 AS a1
            LEFT JOIN [ramaprod].[dbo].T00064 AS c ON a1.F01133 = c.ID
            WHERE a1.F02003 = b.ID
            FOR XML PATH(''), TYPE
        ).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS eventos
    FROM [ramaprod].[dbo].T00041 AS b
    LEFT JOIN [ramaprod].[dbo].T00069 AS a ON a.F02003 = b.ID
    LEFT JOIN [ramaprod].[dbo].T00030 AS c ON b.F05220 = c.ID
    LEFT JOIN [ramaprod].[dbo].T00037 AS d ON b.F00177 = d.ID
    GROUP BY b.F14474, b.ID
)
SELECT
	dossie,
	cpf,
	data_benner,
	(CASE 
		WHEN (CHARINDEX('Solicitação de Documentos', eventos) > 0 OR CHARINDEX('Solicitado Kit Contrato', eventos) > 0 OR CHARINDEX('Solicitada Planilha de Cálculos', eventos) > 0
			OR CHARINDEX('Solicitada Notificação', eventos) > 0 OR CHARINDEX('Aguardando Pesquisa Patrimonial', eventos) > 0)
			AND CHARINDEX('Retorno diligência - e-mail', eventos) = 0 
			AND CHARINDEX('Fora da Régua de Ajuizamento', eventos) = 0
			AND CHARINDEX('Prazo Prescricional', eventos) = 0
			AND CHARINDEX('Encerramento Definitivo', eventos) = 0
		THEN 'Aguardando Documentação'
		WHEN CHARINDEX('Fora da Régua de Ajuizamento', eventos) > 0 THEN 'Fora da Régua de Ajuizamento'
		WHEN (CHARINDEX('Retorno diligência - e-mail', eventos) > 0 OR CHARINDEX('Prazo Prescricional', eventos) > 0 OR CHARINDEX('Encerramento Definitivo', eventos) > 0) THEN 'Outros'			
      ELSE NULL
	END) AS resumo
FROM subquery
where situacao <> 'Encerrado'