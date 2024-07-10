#ARQUIVO DE STORED PROCEDURE (FUNÇÃO) DO bd_sus

#PROCEDURE abaixo está sem parametro's definido(s)

DELIMITER $

CREATE PROCEDURE listing_agenda()
BEGIN

	SELECT 
		c._number AS room, b._name AS doctor, b.celular AS celular_doctor,
		d.name_pat AS patient, d.celular_pat AS celular_patient, 
		d.name_resp AS responsible, d.phone_resp AS phone_responsible,
		a.date_sur AS date_surgery, a.status_sur AS status_surgery
	FROM tbl_agenda AS a
	INNER JOIN tbl_doctor AS b ON b.id = a.id_doc
	INNER JOIN tbl_room AS c ON c.id = a.id_room
	INNER JOIN tbl_patient AS d ON d.id = a.id_pat;

END

$

CALL listing_agenda();
#DROP PROCEDURE listing_agenda;