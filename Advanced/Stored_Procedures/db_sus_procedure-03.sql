#ARQUIVO DE STORED PROCEDURE (FUNÇÃO) DO bd_sus

#PROCEDURE abaixo está com parametro's de saída definido(s)

DELIMITER $
	
    CREATE PROCEDURE count_pat(OUT total_pat INT(10))
	BEGIN
		
        SELECT COUNT(a.id) INTO total_pat
        FROM tbl_patient AS a;
        #Utiliza de INTO para transferir os dados recebidos para o parametro
    END
$

CALL count_pat(@total_pat); #O "@" está definindo uma var, que receberá o valor transferido anteriormente

SELECT @total_pat AS num_doc; #Nesse contexto, o "@" está chamando a var já criada anteriormente e nos apresentando seu valor