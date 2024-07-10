#ARQUIVO DE RELACIONAMENTO'S ENTRE AS TABELAS DO bd_sus

USE db_sus;

ALTER TABLE tbl_doctor ADD CONSTRAINT tbl_doctor_id_spe_fk 
FOREIGN KEY (id_spe) REFERENCES tbl_specialty (id);

ALTER TABLE tbl_input ADD CONSTRAINT tbl_input_id_pat_fk 
FOREIGN KEY (id_pat) REFERENCES tbl_patient (id);

ALTER TABLE tbl_room ADD CONSTRAINT tbl_room_id_spe_fk 
FOREIGN KEY (id_spe) REFERENCES tbl_specialty (id);

ALTER TABLE tbl_agenda ADD CONSTRAINT tbl_agenda_id_pat_fk 
FOREIGN KEY (id_pat) REFERENCES tbl_patient (id);
    
ALTER TABLE tbl_agenda ADD CONSTRAINT tbl_agenda_id_room_fk 
FOREIGN KEY (id_room) REFERENCES tbl_room (id);
    
ALTER TABLE tbl_agenda ADD CONSTRAINT tbl_agenda_id_doc_fk 
FOREIGN KEY (id_doc) REFERENCES tbl_doctor (id);