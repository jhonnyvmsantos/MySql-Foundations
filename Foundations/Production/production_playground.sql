USE db_production;

/* Funções de agregação
MAX retorna o valor MAXimo dentro de um grupo
MIN retorna o valor MINimo dentro de um grupo
AVG retorna a media dos valores do grupo
SUM soma os valores de um grupo
COUNT faz a contagem de elementos dentro de um grupo
DAY retorna o dia de uma data (cuidado ao usar, em relação aos meses)
MOUNTH retorna o mês de um data (cuidado ao usar, em relação aos anos)
YEAR retorna o ano de uma data
*/

SELECT b.id AS id_operator, b._name AS operator, CAST(a.dt_begin AS DATE) AS dt_begin, MIN(a.qtd_part) AS qtd_min, MAX(a.qtd_part) AS qtd_max,
AVG(qtd_part) AS qtd_media
FROM tbl_production AS a
inner join tbl_operator AS b on b.id = a.id_operator
WHERE dt_begin >= "2023-08-01 00:00"
AND dt_final <= "2023-08-30 23:59"
GROUP BY CAST(a.dt_begin AS DATE) #CASo utilize MIN e MAX, sem GROUP BY pode dar erro. Neste exemplo ele traria o MIN e MAX sem importar a data
# GROUP BY b.id, b._name 
ORDER BY CAST(a.dt_begin AS DATE);

SELECT CAST(dt_begin AS DATE) AS dt_begin, AVG(qtd_part) #SUM é uma somatória dos dados
FROM tbl_production AS a
# WHERE CAST(dt_begin AS DATE) = "2023-09-14"
GROUP BY CAST(dt_begin AS DATE)
ORDER BY CAST(dt_begin AS DATE);

SELECT id_machine, MONTH(dt_begin), SUM(qtd_part) AS total
FROM tbl_production
WHERE dt_begin >= "2023-01-01 00:00"
AND dt_final <= "2023-12-31 23:59"
GROUP BY id_machine, MONTH(dt_begin)
ORDER BY id_machine, MONTH(dt_begin);