CREATE DATABASE db_foundations; /* Cria um banco de dados */

USE db_foundations; /* Seleciona o banco de dados */

# DROP DATABASE db_foundations; /* Dropa o banco de dados */

CREATE TABLE tbl_course ( /* Cria uma tabela */
	id INT AUTO_INCREMENT PRIMARY KEY, # TIPO DE DADO INTEIRO COM INCREMENTAÇÃO DE VALOR AUTOMÁTICA - CHAVE PRIMÁRIA
	_name VARCHAR(50) NOT NULL, # TIPO DE DADO STRING COM LIMITE DE 50 CARACTERES - DEVE-SE SER PREENCHIDO
    _desc VARCHAR(150) DEFAULT '' # TIPO DE DADO STRING COM LIMITE DE 150 CARACTERES E VALOR DEFAULT EM BRANCO 
);

/* O TIPO DE DADO "VARCHAR", ARMAZENA O VALOR ADICIONADO E DESCARTA O RESTANTE DE CARACTERES NÃO PREENCHIDOS, DE 
ACORDO COM O LIMITE ESTABELECIDO */

CREATE TABLE tbl_student (
	id INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
	id_course INT,
	_name VARCHAR(50) NOT NULL,
	date_birth DATE NOT NULL, # TIPO DE DADO "DATE" (EM FORMATO AMERICANO)
	andress VARCHAR(40) DEFAULT "",
	phone VARCHAR(11) DEFAULT "",
	FOREIGN KEY (id_course) REFERENCES tbl_course(id) # DEFININDO UM CAMPO COMO CHAVE ESTRANGEIRA
);

CREATE TABLE tbl_teacher (
	id INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
	_name VARCHAR(50) NOT NULL,
	date_birth DATE NOT NULL, 
	andress VARCHAR(30),
    phone VARCHAR(11) DEFAULT "",
	identification CHAR(9) NOT NULL # TIPO DE DADO STRING COM LIMITE DE 9 CARACTERES
);

/* O TIPO DE DADO "CHAR" TEM UM NÚMERO DE CARACTERES ESTIPULADO E SE MANTÉM ASSIM, MESMO QUE NÃO SEJA TOTALMENTE PREENCHIDO */

# ------------------------------------------------------------------------------------------------------------------

INSERT INTO tbl_course (_name) VALUES ("Contabilidade"), ("Administração"), ("Desenvolvimento de Sistema"), ("Rede de Computadores"),
("Logistica"), ("Eletroeletronica"), ("Automação Industrial");

SELECT * FROM tbl_course; /* Consultar todos os dados na tabela ("*" Seleciona todos os dados) */

# DROP TABLE tbl_course; /* Dropa a tabela */

# ------------------------------------------------------------------------------------------------------------------

/* Inserção de dados na tabela */
INSERT INTO tbl_student (id_course, _name, date_birth, andress, phone) VALUES (5, "Ricardo Vanzin", "2006-10-02", "Rua carambolas", "420"), 
(4, "ManoelGgomes", "1597-08-02", "Rua amendoas", "190");

ALTER TABLE tbl_student ADD COLUMN name_resp VARCHAR(50) DEFAULT ''; /* Adiciona uma nova coluna (campo) à tabela */

# DROP TABLE tbl_student;

SELECT * FROM tbl_student;

/* Consultar dados na tabela de acordo com uma claúsula específicada */
SELECT * FROM tbl_student WHERE id = 2; 

/* Atualizar um dado especifico da tabela (forma padrão) */
UPDATE tbl_student SET phone = "50" WHERE id = 1;

/* Deletar um dado especifico da tabela (forma padrão) */
DELETE FROM tbl_student WHERE id = 2;

/* SEM A CLAUSULA QUE ESPECIFICA O DADO A SER ALTERADP/DELETADO, TODOS OS DADOS SERÃO AFETADOS !!! */

# ------------------------------------------------------------------------------------------------------------------

INSERT INTO tbl_teacher (_name, date_birth, andress, identification) VALUES ("Frederico da Silva", "2001-09-11", "Rua americanas 23", "rg1239827"), 
("Luiz Silveira", "1999-11-09", "Rua linux 24", "rg1239829");

SELECT * FROM tbl_teacher;

# DROP TABLE tbl_teacher;

DELETE FROM tbl_teacher WHERE id = 1;

# TRUNCATE tbl_teacher; /* Reseta os dados da tabela */

/* Consultando dados especificos da tabela */
SELECT a.id AS id_student, a._name AS student, b._name AS course, b._desc AS course_desc
FROM tbl_student AS a
INNER JOIN tbl_course AS b ON a.id_course = b.id;

/* "AS" DEFINE UM NOVO NOME TEMPORARIO (APELIDO) PARA UM CAMPO OU TABELA (USADO PARA IDENTIFICAÇÃO). 
"INNER JOIN" CONECTA TABELAS ATRAVES DE UMA CLAUSULA (UTILIZANDO DADOS EM ACORDO ENTRE AS TABELAS) */