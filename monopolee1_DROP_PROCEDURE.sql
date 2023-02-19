DROP PROCEDURE b_chance1;
DROP PROCEDURE b_chance2;
DROP PROCEDURE b_community_chest1;
DROP PROCEDURE b_community_chest2;
DROP PROCEDURE b_go_to_jail;
DROP PROCEDURE b_in_jail;
DROP PROCEDURE b_go;

DROP PROCEDURE p_oak_house;
DROP PROCEDURE p_owens_park;
DROP PROCEDURE p_AMBS;
DROP PROCEDURE p_coop;
DROP PROCEDURE p_kilburn;
DROP PROCEDURE p_uni_place;
DROP PROCEDURE p_victoria;
DROP PROCEDURE p_piccadilly;


UPDATE audit
SET
 bank_balance = CASE WHEN location_id = 1
 THEN call p_oak_house
 ELSE 0
 END;


#VIEW
#bank_balance,time, auditはselect内には書かない
CREATE VIEW gameView AS
 SELECT  audit.time,   location.location_id, location.location_name, audit.bank_balance, player_name, token_id
 FROM audit
 INNER JOIN location
 ON audit.location_id = location.location_id
 INNER JOIN player
 ON audit.player_id = player.player_id;
 #WHERE time IS NOT NULL;

SELECT * FROM gameView;
#INNER JOIN location
#ON audit.location_id = location.location_id;
 
 DROP VIEW gameView;

#32+4 =36行