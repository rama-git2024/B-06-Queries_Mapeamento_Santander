SELECT
	a.F04461 AS pasta,
	MAX(d.F14474) AS dossie,
	MAX(e.F01062) AS criado_em,
	MAX(n.F27086) AS cpf_cnpj,
	MAX(n.F00091) AS adverso,
	MAX(aa.F00156) AS tipo_acao,
	MAX(h.F00162) AS fase,
	MAX(k.F02568) AS comarca,
	MAX(
	CASE
		WHEN f.F25017 = 1 THEN 'Ativo'
		WHEN f.F25017 = 2 THEN 'Encerrado'
		WHEN f.F25017 = 3 THEN 'Acordo'
		WHEN f.F25017 = 4 THEN 'Em encerramento'
		ELSE 'Em precatório (Ativo)'
	END)  AS situacao,
	MAX(i.F00091) AS advogado_interno,
	MAX(m.F01130) AS carteira,
	MAX(t.F47448) AS segmento_novo,
	MAX(x.F47448) AS segmento_novo_pessoa,
	MAX(f.F00179) AS valor_causa,
	MAX(
		CASE
			WHEN j.F01132 IN ('Homologação 1.3 - Ajuizamento', 'BA 1.1 - Distribuição da ação', 
				'Execução 1.1 - Data distribuição da ação', 'Monitória 1.4 - Ajuizamento', 'Cobrança 1.4 - Ajuizamento') THEN a.F00385
			ELSE NULL
		END) AS data_ajuizamento,
	MAX(
		CASE
			WHEN j.F01132 IN ('Cobrança 2.1 -  Citação devedor principal', 'Cobrança 2.11 -  Citação por carta precatória positiva', 'Cobrança 2.12 - Citação por acordo', 'Monitória 2.1 - Citação devedor principal',
				'Monitória 2.11- Citação por carta precatória positiva', 'Monitória 2.12 - Citação por acordo', 'Execução 3.1 - Citação devedor principal', 'Execução 3.11 - Citação por Carta Precatória positiva',
				'Execução 3.14 – Citação por acordo', 'BA 3.6 - Citação efetivada (com retomada)', 'BA 3.8 - Citação por carta precatória positiva', 'Cobrança 2.2 -  Citação coobrigado',
				'Monitória 2.2 - Citação coobrigado', 'Execução 3.2 - Citação coobrigado') THEN a.F00385
			ELSE NULL
		END) AS data_citacao
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
GROUP BY a.F04461
HAVING
	MAX(f.F25017) <> 2
	AND ( MAX(aa.F00156) NOT IN ('Ação de Falência', 'Ação de Recuperação Judicial', 'Ação de Revisão de Contrato', 'Diligência (CIV)', 'Notificação Extraj. Alienação Fiduciária',
		'Pré-ajuizamento') AND MAX(aa.F00156) NOT LIKE '%Cautelar%' )
	AND (MAX(h.F00162) NOT IN ('Acordo') AND MAX(h.F00162) NOT LIKE 'FL%' OR MAX(h.F00162) NOT LIKE 'RJ%')
ORDER BY criado_em DESC;