SELECT TRIM(value) AS listed_in_item, COUNT(*) AS count
FROM netflix
CROSS APPLY STRING_SPLIT(listed_in, ',')
GROUP BY TRIM(value)
ORDER BY count DESC


SELECT *
FROM netflix

SELECT TRIM(value) AS directors_item, COUNT(*) AS count
FROM netflix
CROSS APPLY STRING_SPLIT(director, ',')
GROUP BY TRIM(value)
ORDER BY count DESC


SELECT TRIM(value) AS directors_item, COUNT(*) AS count
FROM netflix
CROSS APPLY STRING_SPLIT(country, ',')
GROUP BY TRIM(value)
ORDER BY count DESC