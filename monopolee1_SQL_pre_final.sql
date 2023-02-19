
#1 set the variable
SET @player_id = 3;
SET @current1 = (select location_id from audit where player_id =@player_id); 
SET @dice = 5;
SET @dice2 = 0;
SET @newlocation = @current1 + @dice + @dice2;


#2 change the location_id
UPDATE audit
SET 
audit.location_id = (MOD(@newlocation, 16))
WHERE player_id  = @player_id and location_id = @current1 ;



#3 Bonus

#Chance1
DELIMITER /
CREATE PROCEDURE b_chance1()
BEGIN
 UPDATE audit
 SET bank_balance =  bank_balance - 150 
 WHERE location_id = 2 and player_id  = @player_id;
UPDATE audit
 SET bank_balance =  bank_balance + 50
 WHERE  (MOD(@newlocation, 16)) = 2 and player_id  != @player_id;
END /
DELIMITER ;

#Chance2
DELIMITER /
CREATE PROCEDURE b_chance2()
BEGIN
 UPDATE audit
 SET location_id =  location_id + 3
 WHERE location_id = 10 and player_id  = @player_id;
END /
DELIMITER ;

#Community_chest1
DELIMITER /
CREATE PROCEDURE b_community_chest1()
BEGIN
 UPDATE audit
 SET bank_balance =  bank_balance +100 
 WHERE location_id = 6 and player_id  = @player_id;
 END /
DELIMITER ;

#Community_chest2
DELIMITER /
CREATE PROCEDURE b_community_chest2()
BEGIN
 UPDATE audit
 SET bank_balance =  bank_balance -30
 WHERE location_id = 14 and player_id  = @player_id;
 END /
DELIMITER ;


#Free Parking
#No code because there is no action

#Go to Jail
DELIMITER /
CREATE PROCEDURE b_go_to_jail()
BEGIN
 UPDATE audit
 SET audit.location_id =  4
 WHERE  (MOD(@newlocation, 16))= 12 and player_id  = @player_id;
 END /
DELIMITER ;

#in jail
DELIMITER /
CREATE PROCEDURE b_in_jail()
BEGIN
 UPDATE audit
 SET location_id = @dice2
 WHERE @dice =  6 and location_id = 4 and player_id  = @player_id;
END /
DELIMITER ;

#go
DELIMITER /
CREATE PROCEDURE b_go()
BEGIN
 UPDATE audit
 SET bank_balance =  bank_balance + 200
 WHERE location_id = 0 and player_id  = @player_id;
 UPDATE audit
 SET bank_balance =  bank_balance + 200
 WHERE (MOD(@newlocation, 16)) != 12 and @newlocation > 16 and player_id  = @player_id;
 END /
DELIMITER ;


#bonus execution
call b_chance1();

call b_chance2();

call b_community_chest1();

call b_community_chest2();

call b_go_to_jail();

call b_in_jail;

call b_go;

 
#---------------------------------------------------------------
#4 property

# oak_house
DELIMITER /
CREATE PROCEDURE p_oak_house()
BEGIN
 UPDATE audit
 SET bank_balance =  bank_balance -100
 WHERE player_id  = @player_id and location_id  = 9;
 
 UPDATE property
 SET owner = @player_id
 WHERE property.owner IS NULL and property_id = (MOD(@newlocation, 16));
 
 UPDATE audit
 SET  bank_balance =  bank_balance + 200
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 1 and owner IS NOT NULL) =2)
     and ((
	SELECT owner
     FROM property 
     WHERE  property_id = 9) = player_id)
     and   (MOD(@newlocation, 16))=9
     ;
     
 UPDATE audit
 SET  bank_balance =  bank_balance - 100
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 1 and owner IS NOT NULL) =2)
     and player_id  = @player_id and location_id  = 9
     ;
     
 UPDATE audit
 SET  bank_balance =  bank_balance + 100
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 1 and owner IS NOT NULL) =1)
     and ((
	SELECT owner
     FROM property 
     WHERE  property_id = 9) = player_id)
     and  (MOD(@newlocation, 16))=9
     ;
 END /
DELIMITER ;
call p_oak_house;


# owens_park
DELIMITER /
CREATE PROCEDURE p_owens_park()
BEGIN
 UPDATE audit
 SET bank_balance =  bank_balance -30
 WHERE player_id  = @player_id and location_id  = 11;
 
 UPDATE property
 SET owner = @player_id
 WHERE property.owner IS NULL and property_id = (MOD(@newlocation, 16));
 
 UPDATE audit
 SET  bank_balance =  bank_balance + 60
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 1 and owner IS NOT NULL) =2)
     and ((
	SELECT owner
     FROM property 
     WHERE  property_id = 11) = player_id)
     and   (MOD(@newlocation, 16))=11
     ;
     
 UPDATE audit
 SET  bank_balance =  bank_balance - 30
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 1 and owner IS NOT NULL) =2)
     and player_id  = @player_id and location_id  = 11
     ;
     
 UPDATE audit
 SET  bank_balance =  bank_balance + 30
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 1 and owner IS NOT NULL) =1)
     and ((
	SELECT owner
     FROM property 
     WHERE  property_id = 11) = player_id)
     and  (MOD(@newlocation, 16))=11
     ;
 END /
DELIMITER ;
call p_owens_park;

# AMBS
DELIMITER /
CREATE PROCEDURE p_AMBS()
BEGIN
 UPDATE audit
 SET bank_balance =  bank_balance -400
 WHERE player_id  = @player_id and location_id  = 13;
 
 UPDATE property
 SET owner = @player_id
 WHERE property.owner IS NULL and property_id = (MOD(@newlocation, 16));
 
 UPDATE audit
 SET  bank_balance =  bank_balance + 400
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 2 and owner IS NOT NULL) =2)
     and ((
	SELECT owner
     FROM property 
     WHERE  property_id = 13) = player_id)
     and   (MOD(@newlocation, 16))=13
     ;
     
 UPDATE audit
 SET  bank_balance =  bank_balance - 400
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 2 and owner IS NOT NULL) =2)
     and player_id  = @player_id and location_id  = 13
     ;
     
 UPDATE audit
 SET  bank_balance =  bank_balance + 400
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 2 and owner IS NOT NULL) =1)
     and ((
	SELECT owner
     FROM property 
     WHERE  property_id = 13) = player_id)
     and  (MOD(@newlocation, 16))=913
     ;
 END /
DELIMITER ;
call p_AMBS;

#co-op
DELIMITER /
CREATE PROCEDURE p_coop()
BEGIN
 UPDATE audit
 SET bank_balance =  bank_balance -30
 WHERE player_id  = @player_id and location_id  = 15;
  
 UPDATE property
 SET owner = @player_id
 WHERE property.owner IS NULL and property_id = (MOD(@newlocation, 16));
 
 UPDATE audit
 SET  bank_balance =  bank_balance + 60
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 2  and owner IS NOT NULL) =2)
     and ((
	SELECT owner
     FROM property 
     WHERE  property_id = 15) = player_id)
     and  (MOD(@newlocation, 16))=15
     ;
  
 UPDATE audit
 SET  bank_balance =  bank_balance - 30
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 2 and owner IS NOT NULL) =2)
	 and player_id  = @player_id and location_id  = 15
     ;
  
 UPDATE audit
 SET  bank_balance =  bank_balance + 30
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 2 and owner IS NOT NULL) =1)
     and ((
     SELECT owner 
       FROM property 
       WHERE  property_id = 15) =player_id)
     and (MOD(@newlocation, 16))=15
     #and location_id  = 15
     ;
END /
DELIMITER ;
call p_coop;

#Kilburn
DELIMITER /
CREATE PROCEDURE p_kilburn()
BEGIN
 UPDATE audit
 SET bank_balance =  bank_balance -120
 WHERE player_id  = @player_id and location_id  = 1;
 UPDATE property
 SET owner = @player_id
 WHERE property.owner IS NULL and property_id = (MOD(@newlocation, 16));
 UPDATE audit
 SET  bank_balance =  bank_balance + 240
 WHERE  ( (SELECT count(property_id)
     FROM property
     WHERE colour_id = 3 and owner IS NOT NULL) =2)
     and ((
	SELECT owner
     FROM property 
     WHERE  property_id = 1) = player_id)
     and   (MOD(@newlocation, 16))=1;
  UPDATE audit
 SET  bank_balance =  bank_balance - 120
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 3 and owner IS NOT NULL) =2)
	 and player_id  = @player_id and location_id  = 1;
 UPDATE audit
 SET  bank_balance =  bank_balance + 120
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 3 and owner IS NOT NULL) = 1)
     and ((
     SELECT owner
     FROM property
     WHERE property_id = 9) = player_id)
     and   (MOD(@newlocation, 16))=1
     ;
END /
DELIMITER ;
call p_kilburn;

#Uni Place
DELIMITER /
CREATE PROCEDURE p_uni_place()
BEGIN
 UPDATE audit
 SET bank_balance =  bank_balance -100
 WHERE player_id  = @player_id and location_id  = 3;
 
 UPDATE property
 SET owner = @player_id
 WHERE property.owner IS NULL and property_id = (MOD(@newlocation, 16));
 
 UPDATE audit
 SET  bank_balance =  bank_balance + 200
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 3 and owner IS NOT NULL) =2)
     and ((
	SELECT owner
     FROM property 
     WHERE  property_id = 3) = player_id)
     and   (MOD(@newlocation, 16))=3
     ;
  
 UPDATE audit
 SET  bank_balance =  bank_balance - 100
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE  colour_id = 3  =1 and owner IS NOT NULL) =2)
     and  player_id  = @player_id and location_id  = 3
     ;
    
 UPDATE audit
 SET  bank_balance =  bank_balance + 100
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 3 and owner IS NOT NULL) =1)
     and((
     SELECT owner
	 FROM property
     WHERE property_id = 3) = player_id)
     and    (MOD(@newlocation, 16))=3
     ;
END /
DELIMITER ;
call p_uni_place;


#Victoria
DELIMITER /
CREATE PROCEDURE p_victoria()
BEGIN
 UPDATE audit
 SET bank_balance =  bank_balance -75
 WHERE player_id  = @player_id and location_id  = 5;
 
 UPDATE property
 SET owner = @player_id
 WHERE property.owner IS NULL and property_id = (MOD(@newlocation, 16));
 
 UPDATE audit
 SET  bank_balance =  bank_balance + 150
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 4 and owner IS NOT NULL)  =2)
     and (
	SELECT owner
     FROM property 
     WHERE  property_id = 5) = player_id
     and   (MOD(@newlocation, 16))=5
     ;
  
 UPDATE audit
 SET  bank_balance =  bank_balance - 75
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 4 and owner IS NOT NULL) =2)
	 and player_id  = @player_id and location_id  = 5
     ;
  
 UPDATE audit
 SET  bank_balance =  bank_balance + 75
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 4 and owner IS NOT NULL) =1)
     and ((
     SELECT owner
     FROM property
     WHERE property_id = 5) = player_id)
     and   (MOD(@newlocation, 16))=5
     ;
END /
DELIMITER ;
call p_victoria;


#Piccadilly
DELIMITER /
CREATE PROCEDURE p_piccadilly()
BEGIN
 UPDATE audit						
 SET bank_balance =  bank_balance -35
 WHERE player_id  = @player_id and location_id  = 7;
 
 UPDATE property
 SET owner = @player_id
 WHERE property.owner IS NULL and property_id = (MOD(@newlocation, 16));
 
 UPDATE audit
 SET  bank_balance =  bank_balance + 70
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 4 and owner IS NOT NULL) =2)
     and ((
	SELECT owner
     FROM property 
     WHERE  property_id = 7) = player_id)
     and    (MOD(@newlocation, 16))=7
     ;
  
 UPDATE audit
 SET  bank_balance =  bank_balance - 35
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 4 and owner IS NOT NULL) =2)
	 and player_id  = @player_id and location_id  = 7
     ;
  
 UPDATE audit
 SET  bank_balance =  bank_balance + 35
 WHERE  ( (
   SELECT count(property_id)
     FROM property
     WHERE colour_id = 4 and owner IS NOT NULL) =1)
     and ((
     SELECT owner
     FROM property
     WHERE property_id = 7) =player_id)
     and   (MOD(@newlocation, 16))=7
     ;
END /
DELIMITER ;
call p_piccadilly;



#game time
SET SQL_SAFE_UPDATES = 0;
UPDATE audit
SET time = time +1;


INSERT INTO audit_history (
    player_id,
    location_id,
    bank_balance,
    time) SELECT player_id,
    location_id,
    bank_balance, time FROM audit;


#VIEW
#bank_balance,time, auditはselect内には書かない
CREATE VIEW gameView AS
 SELECT  audit.time,   location.location_id, location.location_name, audit.bank_balance, player_name, token_id
 FROM audit
 INNER JOIN location
 ON audit.location_id = location.location_id
 INNER JOIN player
 ON audit.player_id = player.player_id
 INNER JOIN player_token
 ON audit.player_id = player_token.player_id;
 #WHERE time IS NOT NULL;

SELECT * FROM gameView;
#INNER JOIN location
#ON audit.location_id = location.location_id;
 
 
