#ARQUIVO DE TRIGGER'S DAS TABELAS DO bd_sus;

USE db_sus;

#DESCRIBE tbl_patiente_bkp; # Mostra os dados (Descrição) da tabela referente

#O "$" age como um delimitador de inicio da Trigger
DELIMITER $

#Criação do corpo da Trigger (CREATE TRIGGER <nome_trigger> <(BEFORE || AFTER)> <ação> ON <tabela_referente>)
CREATE TRIGGER trg_delete_pat BEFORE DELETE ON tbl_patient

FOR EACH ROW #Na linha que sofre a ação de DELETE
BEGIN
#Comando a ser executado
	INSERT INTO tbl_patiente_bkp 
	SET 
	id = OLD.id,
	name_pat = OLD.name_pat,
	celular_pat = OLD.celular_pat,
	email = OLD.email,
	name_resp = OLD.name_resp,
	phone_resp = OLD.phone_resp,
	phone_pat = OLD.phone_pat,
	date_delete = NOW();

#Finalizador das instruções p/execução da TRIGGER
END
#Encerrando a área que define o corpo da TRIGGER
$

#DROP TRIGGER trg_delete_pat;
