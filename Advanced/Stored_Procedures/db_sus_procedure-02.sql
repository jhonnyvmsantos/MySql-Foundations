#ARQUIVO DE STORED PROCEDURE (FUNÇÃO) DO bd_sus

#PROCEDURE abaixo está com parametro's de entrada definido(s)

DELIMITER $
	#IN na area dos param's serve p/definir uma entrada de dados (<IN> <nome_campo> <tipo>)
    CREATE PROCEDURE listing_agenda_param(IN id_doc_param INT)
    BEGIN
		
        SELECT 
		c._number AS room, b._name AS doctor, b.celular AS celular_doctor,
		d.name_pat AS patient, d.celular_pat AS celular_patient, 
		d.name_resp AS responsible, d.phone_resp AS phone_responsible,
		a.date_sur AS date_surgery, a.status_sur AS status_surgery
	FROM tbl_agenda AS a
	INNER JOIN tbl_doctor AS b ON b.id = a.id_doc
	INNER JOIN tbl_room AS c ON c.id = a.id_room
	INNER JOIN tbl_patient AS d ON d.id = a.id_pat
        WHERE a.id_doc = id_doc_param;
        #Utiliza do nome do parametro como um campo, com dados, comum
    END
    
$

CALL listing_agenda_param(1);
#DROP PROCEDURE listing_agenda_param;