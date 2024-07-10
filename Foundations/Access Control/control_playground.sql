USE db_control;

SELECT a.id, a._name FROM tbl_student AS a;

/* Consulta atraves do ano e mes, necessita do formato de data para o campo escolhido */
SELECT a.id, a._name, a.cpf, a.date_birth, a.date_reg
FROM tbl_student AS a
WHERE YEAR(date_birth) = 2000 AND MONTH(date_birth) = 2;

/* Consulta atraves do ano ou (mes e dia) epecifico */
SELECT a.id, a._name, a.cpf, a.date_birth, a.date_reg
FROM tbl_student AS a
WHERE YEAR(date_birth) = 2000 OR (MONTH(date_birth) = 2 AND DAY(date_birth) = 2);

/* Método ineficiente de selecionar multiplos valores. Possivel utilizar 'NOT' p/negar tal clausula */
SELECT a.id, a._name, a.cpf, a.date_birth, a.date_reg
FROM tbl_student AS a
WHERE YEAR(date_birth) = 2000 OR YEAR(date_birth) = 2002 OR YEAR(date_birth) = 2004;

/* forma eficiente de selecionar multiplos valores, possivel utilizar 'NOT' p/negar tal clausula */
SELECT a.id, a._name, a.cpf, a.date_birth, a.date_reg
FROM tbl_student AS a
WHERE YEAR(date_birth) IN(2000,2002,2004);

INSERT INTO tbl_access (id_student) VALUES (1), (2), (5);

SELECT a.id, a._name, a.cpf, a.date_birth, a.date_reg, b.date_access
FROM tbl_student AS a
INNER JOIN tbl_access AS b on a.id = b.id_student /* INNER JOIN busca tudo que está na "esquerda/direita" IGUALMENTE (a partir do FROM, o que foi listado está na ESQUERDA) */
WHERE YEAR(date_birth) NOT IN(2000,2002,2004); /* NOT nega os valORes selecionados */

SELECT a.id, a._name, a.cpf, a.date_birth, a.date_reg, b.date_access
FROM tbl_student AS a
LEFT JOIN tbl_access AS b on a.id = b.id_student /* LEFT JOIN busca tudo que está na ESQUERDA independende se o que está na direita existe ou não */
WHERE YEAR(date_birth) NOT IN(2000,2002,2004);

SELECT a.id, a._name, a.cpf, a.date_birth, a.date_reg, b.date_access
FROM tbl_student AS a
RIGHT JOIN tbl_access AS b on a.id = b.id_student /* RIGHT JOIN busca tudo que está na DIREITA independende se o que está na esquerda existe ou não */
WHERE YEAR(date_birth) NOT IN(2000,2002,2004) AND b.date_access IS NOT NULL; /* NULL é chamado utilizANDo IS ou NOT IS */