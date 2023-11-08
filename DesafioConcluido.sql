-- ### DESAFIO DIO BANCO DE DADOS ###

-- 1) Buscar o nome e ano dos filmes
SELECT
	[Nome]
	,[Ano]
FROM
	[dbo].[Filmes]

-- 2) Buscar o nome, ano e duração dos filmes, ordenados por ordem crescente pelo ano
SELECT
	[Nome]
	,[Ano]
	,[Duracao]
FROM
	[dbo].[Filmes]
ORDER BY
	[Ano]

-- 3) Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT
	[Nome]
	,[Ano]
	,[Duracao]
FROM
	[dbo].[Filmes]
WHERE
	[Nome] = 'De Volta para o Futuro'

-- 4) Buscar os filmes lançados em 1997
SELECT 
	*
FROM
	[dbo].[Filmes]
WHERE
	[Ano] = 1997

-- 5) Buscar os filmes lançados APÓS o ano 2000
SELECT
	*
FROM
	[dbo].[Filmes]
WHERE
	[Ano] > 2000

-- 6) Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT
	*
FROM
	[dbo].[Filmes]
WHERE
	[Duracao] > 100
	AND [Duracao] < 150
ORDER BY
	[Duracao]

-- 7) Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela quantidade em ordem decrescente
SELECT
	[Ano]
	,COUNT(*) AS [Quantidade]
FROM
	[dbo].[Filmes]
GROUP BY
	[Ano]
ORDER BY
	[Quantidade] DESC

-- 8) Buscar os Atores do gênero masculino.
SELECT
	*
FROM
	[dbo].[Atores]
WHERE
	[Genero] = 'M'

-- 9) Buscar os Atores do gênero feminino e ordenando pelo PrimeiroNome
SELECT
	*
FROM
	[dbo].[Atores]
WHERE
	[Genero] = 'F'
ORDER BY
	[PrimeiroNome]

-- 10) Buscar o nome do filme e o gênero
SELECT
	filmes.[Nome]
	,generos.[Genero]
FROM
	[dbo].[Filmes] AS filmes
	INNER JOIN [dbo].[FilmesGenero] AS filmesGen ON (filmes.Id = filmesGen.IdFilme)
	INNER JOIN [dbo].[Generos] AS generos ON (filmesGen.IdGenero = generos.Id)

-- 11) Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT
	filmes.[Nome]
	,generos.[Genero]
FROM
	[dbo].[Filmes] AS filmes
	INNER JOIN [dbo].[FilmesGenero] AS filmesGen ON (filmes.Id = filmesGen.IdFilme)
	INNER JOIN [dbo].[Generos] AS generos ON (filmesGen.IdGenero = generos.Id)
WHERE
	generos.[Genero] = 'Mistério' -- OU generos.[Id] = 10

-- 12) Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT
	filmes.[Nome]
	,atores.[PrimeiroNome]
	,atores.[UltimoNome]
	,elenco.[Papel]
FROM
	[dbo].[Filmes] AS filmes
	INNER JOIN [dbo].[ElencoFilme] AS elenco ON (filmes.Id = elenco.IdFilme)
	INNER JOIN [dbo].[Atores] AS atores ON (elenco.IdAtor = Atores.Id)
