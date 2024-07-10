#ARQUIVO DE INSERT'S NO BANCO.

#-------------------------------------------------------------------------------------------------

INSERT INTO tbl_specialty (_name) VALUES ('NEUROLOGIA'), ('ORTOPEDIA'), ('CARDIOLOGIA');

#-------------------------------------------------------------------------------------------------

INSERT INTO tbl_patient (name_pat, phone_pat, celular_pat, email, name_resp, phone_resp)
VALUES ('AUGUSTO DOS ANJOS', '2587-9635', '2365-5897', 'augusto.anjos@gmail.com', 'Adriana Oliveira', '4888-5192'), 
('MARIO DE ANDRADE', '2357-9514', '5923-5769', 'mario.andrade@gmail.com', 'Pedro Pedrosvaski', '4890-5222'), 
('SANTOS DUMONT', '2357-2145', '2365-6987', 'santos.dumont@gmail.com', 'Linux Manous', '1479-5324'),
('ALBERT EINSTEIN', '2595-2587', '2354-8936', 'albert.einstein@gmail.com', 'Kaio Kaindo', '2158-5325'), 
('NIKOLA TESLA', '3217-5324', '2587-9122', 'nikola.tesla@gmail.com', 'Poliana Heomita', '4598-5348');

#-------------------------------------------------------------------------------------------------

INSERT INTO tbl_doctor (id_spe, _name, email, phone, celular) VALUES 
(1, 'JOÃO DA SILVA', 'joaosilva@gmail.com', '2234-5581', '7894-5612'), 
(2, 'ANA MARIA', 'ana_mari@gmail.com', '4514-9663', '7854-5677'), 
(3, 'CARLOS ALBERT', 'carlos.albert@gmail.com', '0551-9990', '1494-5625'), 
(1, 'JUNIOR ALBERTO', 'j.alberto@gmail.com', '1234-5678', '7855-5413');

#-------------------------------------------------------------------------------------------------

INSERT INTO tbl_room (_number, id_spe) VALUES ('SALA 01', 1), ('SALA 02', 2), ('SALA 03', 3);

#-------------------------------------------------------------------------------------------------

INSERT INTO tbl_agenda (id_room, id_doc, id_pat, date_sur, status_sur) VALUES (1, 4, 5, '05/09/2017', 'AGENDADO'), 
(3, 1, 1, '15/12/2017', 'AGENDADO'), (2, 3, 2, '15/10/2017', 'AGENDADO'), 
(1, 2, 3, '11/11/2017', 'AGENDADO');

# DELETE FROM tbl_patient WHERE id = 1;
