CREATE DATABASE db_sus;

USE db_sus;

# DROP DATABASE db_sus;

CREATE TABLE tbl_specialty (
	id INT UNSIGNED AUTO_INCREMENT, #UNSIGNED rejeita qualquer numero negativo, aceitando apenas numeros positivos
    _name VARCHAR (100) NOT NULL,
    CONSTRAINT tbl_specialty_pk PRIMARY KEY (id)
);

CREATE TABLE tbl_doctor (
	id INT UNSIGNED AUTO_INCREMENT,
    id_spe INT UNSIGNED NOT NULL,
    _name VARCHAR (500) NOT NULL,
    email VARCHAR (100) NOT NULL,
    celular VARCHAR (11) NOT NULL,
	phone VARCHAR (10),
	CONSTRAINT tbl_doctor_pk PRIMARY KEY (id)
);

CREATE TABLE tbl_room (
	id INT UNSIGNED AUTO_INCREMENT,
    id_spe INT UNSIGNED NOT NULL,
    _number VARCHAR (10) NOT NULL,
    CONSTRAINT tbl_room_pk PRIMARY KEY (id)
);

CREATE TABLE tbl_patient (
	id INT UNSIGNED AUTO_INCREMENT,
    name_pat VARCHAR (500) NOT NULL,
    email VARCHAR (100) NOT NULL,
    celular_pat VARCHAR (11) NOT NULL,
    name_resp VARCHAR (500) NOT NULL,
    phone_resp VARCHAR (10) NOT NULL,
	phone_pat VARCHAR (10) NOT NULL,
	CONSTRAINT tbl_patient_pk PRIMARY KEY (id)
);

CREATE TABLE tbl_patient_bkp (
	id INT UNSIGNED AUTO_INCREMENT,
    name_pat VARCHAR (500) NOT NULL,
    email VARCHAR (100) NOT NULL,
    celular_pat VARCHAR (11) NOT NULL,
    name_resp VARCHAR (500) NOT NULL,
    phone_resp VARCHAR (10) NOT NULL,
	phone_pat VARCHAR (10) NOT NULL,
    date_delete DATETIME,
	CONSTRAINT tbl_patient_bkp_pk PRIMARY KEY (id)
);


CREATE TABLE tbl_input (
	id INT UNSIGNED AUTO_INCREMENT,
    id_pat INT UNSIGNED NOT NULL,
    _name VARCHAR (100) NOT NULL,
    qtd_inp DECIMAL (10,2) NOT NULL,
    CONSTRAINT tbl_input_pk PRIMARY KEY (id)
);

CREATE TABLE tbl_agenda (
	id INT UNSIGNED AUTO_INCREMENT,
    id_room INT UNSIGNED NOT NULL,
    id_pat INT UNSIGNED NOT NULL,
    id_doc INT UNSIGNED NOT NULL,
    date_sur VARCHAR (10) NOT NULL,
    status_sur ENUM ("Agendado", "Concluído", "Cancelado") NOT NULL,
    CONSTRAINT tbl_agenda_pk PRIMARY KEY (id)
);