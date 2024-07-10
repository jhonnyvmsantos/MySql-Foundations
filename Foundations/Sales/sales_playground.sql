USE db_sales;

SELECT a._name AS _provider, COUNT(b.id) AS qtd_product
FROM tbl_provider AS a 
INNER JOIN tbl_product b ON a.id = b.id_provider
GROUP BY a._name;

SELECT a._name AS category, COUNT(b.id) AS qtd_product
FROM tbl_category AS a 
LEFT JOIN tbl_product b ON a.id = b.id_category
GROUP BY a._name;

SELECT DISTINCT c._name AS seller, d._name AS city, e.initials AS uf,b._name AS shop
FROM tbl_sale AS a
INNER JOIN tbl_shop AS b ON a.id_shop = b.id
INNER JOIN tbl_seller AS c ON a.id_seller = c.id
INNER JOIN tbl_city AS d ON b.id_city = d.id
INNER JOIN tbl_uf AS e ON d.id_uf = e.id
WHERE e.initials='sp';

SELECT a._name, b.date_reg, a.id
FROM tbl_client AS a
LEFT JOIN tbl_sale AS b ON b.id_client = a.id
WHERE b.date_reg > DATE_SUB(NOW(), INTERVAL 60 DAY)
AND b.id_client IS NOT NULL;

UPDATE tbl_product SET peso= peso + 1.5 WHERE id_provider = 3;
