-- Analisando valores por títulos
SELECT *
FROM netflix
ORDER BY director


-- Realizando filtro de categorias
SELECT TRIM(value) AS listed_in_item, COUNT(*) AS count
FROM netflix
CROSS APPLY STRING_SPLIT(listed_in, ',')
GROUP BY TRIM(value)
ORDER BY count DESC


-- Realizando filtro de diretores
SELECT TRIM(value) AS directors_item, COUNT(*) AS count
FROM netflix
CROSS APPLY STRING_SPLIT(director, ',')
GROUP BY TRIM(value)
ORDER BY count DESC


-- Realizando filtro de países
SELECT TRIM(value) AS directors_item, COUNT(*) AS count
FROM netflix
CROSS APPLY STRING_SPLIT(country, ',')
GROUP BY TRIM(value)
ORDER BY count DESC


-- Realizando filtro de países
SELECT TRIM(value) AS cast, COUNT(*) AS count
FROM netflix
CROSS APPLY STRING_SPLIT(cast, ',')
GROUP BY TRIM(value)
ORDER BY count DESC


-- Tratando títulos 
UPDATE netflix
SET title = REPLACE(title, '?', '');

UPDATE netflix
SET title = REPLACE(title, '#', '');


-- Removendo títulos vazios
DELETE FROM netflix WHERE NULLIF(title, ':') IS NULL;


-- Deletando filme com nome " : "
DELETE FROM netflix
WHERE show_id = (
  SELECT TOP 1 show_id
  FROM netflix
  ORDER BY title
)


