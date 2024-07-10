#ARQUIVO DE SELECT'S DO bd_sus.

CREATE VIEW listing_geral_patient AS
SELECT * FROM tbl_patient;

CREATE VIEW listing_geral_patient_bkp AS
SELECT * FROM tbl_patient_bkp;

CREATE VIEW listing_geral_doc AS
SELECT * FROM tbl_doctor;

#------------------------------------------------------------------------------------------------

CREATE VIEW listing_doc_spe AS (
	SELECT a._name AS doctor, a.phone, a.celular, a.email, b._name AS specialty
	FROM tbl_doctor AS a
	INNER JOIN tbl_specialty AS b ON b.id = a.id_spe
);

#------------------------------------------------------------------------------------------------

CREATE VIEW listing_room_spe AS (
	SELECT a._number, b._name
	FROM tbl_room AS a
	INNER JOIN tbl_specialty AS b ON b.id = a.id_spe
);

#------------------------------------------------------------------------------------------------

CREATE VIEW listing_doc_spe_room AS (
	SELECT 
		c._number AS room, b._name AS doctor, b.celular AS celular_doctor,
		d.name_pat AS patient, d.celular_pat AS celular_patient, 
		d.name_resp AS responsible, d.phone_resp AS phone_responsible,
		a.date_sur AS date_surgery, a.status_sur AS status_surgery
	FROM tbl_agenda AS a
	INNER JOIN tbl_doctor AS b ON b.id = a.id_doc
	INNER JOIN tbl_room AS c ON c.id = a.id_room
	INNER JOIN tbl_patient AS d ON d.id = a.id_pat
);

#SELECIONANDO VIEWS

/*
SELECT * FROM listing_geral_patient;
SELECT * FROM listing_geral_patient_bkp;

SELECT * FROM listing_geral_doc
WHERE id_doc = 2;

SELECT * FROM listing_doc_spe_room;
SELECT * FROM listing_room_spe;
SELECT * FROM listing_doc_spe;
*/

#DROPANDO VIEWs

# DROP VIEW listing_geral_patient;
# DROP VIEW listing_geral_patient_bkp;
# DROP VIEW listing_doc_spe_room;
# DROP VIEW listing_room_spe;
# DROP VIEW listing_doc_spe;