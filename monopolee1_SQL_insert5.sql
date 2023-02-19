#colour table

# 1 
INSERT INTO type VALUES
    (0, 'bonus'),
    (1, 'property')
    ;

# 2   
INSERT INTO location VALUES
	(0,'Go', 0),
	(1,'Kilburn',1),
	(2,'Chance 1',0),
    (3,'Uni Place',1),
    (4,'In Jail',0), 
	(5,'Victoria',1),
	(6,'Community Chest 1',0),
    (7,'Picadilly',1),
    (8,'Free Parking',0),
    (9,'Oak House',1),
    (10,'Chance 2',0),
    (11,'Owens Park',1),
	(12,'Go to Jail',0),
    (13,'AMBS',1),
    (14,'Community Chest 2',0),
    (15,'Co-op',1)
    ;
    
#3
INSERT INTO bonus VALUES
	('Chance 1',2,'Pay each of the other players £50'),
	('Chance 2',10, 'Move forward 3 spaces'),
	('Community Chest 1',6, 'For winning a Beayty Contest, you win £100'),
	('Community Chest 2', 14,'Your library books are overdue. Play a fine of £30'),
    ('Free Parking', 8,'No action'),
    ('Go to Jail', 12, 'Go to Jail, do not pass GO, do not collect £200'),
    ('In Jail', 4, 'No Action'), 
    ('Go', 0, 'Collect £200');

#4
INSERT INTO token VALUES
    (1,'Battleship'),
    (2,'Dog'),
    (3,'Car'),
    (4,'Thimble'),
    (5,'Top hat'),
    (6,'boot')
    ;
    
#5
INSERT INTO player VALUES
    (1, 'Mary', 1),
    (2, 'Bill', 2),
    (3, 'Jane', 3),
    (4, 'Norman', 4)
    ;
 
#6
INSERT INTO audit
    (
     audit_id,
     player_id,
     location_id,
     bank_balance,
     time)
     VALUES
    (1,1,8,190,default),
    (2,2,11,500,default),
    (3,3,13,150,default),
    (4,4,1,250,default)
    ;
#7
INSERT INTO colour VALUES
    (1, 'Orange'),
    (2, 'Blue'),
    (3, 'Yello'),
    (4, 'Green');
    
#8
INSERT INTO property VALUES
	('Oak House', 9, 1, 100, 4),
    ('Owens Park', 11, 1, 30, 4),
    ('AMBS',13, 2, 400, NULL),
	('Co-op', 15, 2, 30, 3),
    ('Kilburn',1, 3, 120, NULL),
    ('Uni Place',3, 3, 100, 1),
    ('Victoria',5, 4, 75, 2),
    ('Picadilly',7, 4, 35, NULL)
    ;


