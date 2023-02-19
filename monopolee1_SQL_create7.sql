#colour table
#1
CREATE TABLE type(
    type INT NOT NULL,
	type_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (type));
    
#2	
CREATE TABLE location(
    location_id INT,
    location_name VARCHAR(30) NOT NULL,
	type int NOT NULL,
	PRIMARY KEY (location_id),
	FOREIGN KEY (type) REFERENCES type(type)
	);
    
#3
CREATE TABLE bonus (
	bonus_name VARCHAR(30),
    bonus_id int NOT NULL,
	discription VARCHAR(50),
	PRIMARY KEY (bonus_name),
    FOREIGN KEY (bonus_id) REFERENCES location(location_id));
 
#4    
CREATE TABLE token(
    token_id int,
    token_name varchar(30),
    PRIMARY KEY (token_id));
#5   
CREATE TABLE player(
    player_id INT,
	player_name VARCHAR(30) NOT NULL,
    token_id INT NOT NULL,
	PRIMARY KEY (player_id),
    FOREIGN KEY (token_id) REFERENCES token(token_id)
    );

#6
CREATE TABLE audit(
    audit_id INT,
    player_id INT NOT NULL,
    location_id INT NOT NULL,
    bank_balance INT NOT NULL,
    time INT DEFAULT 0,
    PRIMARY KEY (audit_id),
	FOREIGN KEY (player_id) REFERENCES player(player_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id));
#7
CREATE TABLE colour (
    colour_id int,
    colour_name VARCHAR(30),
	PRIMARY KEY (colour_id)
    );
    
#8
CREATE TABLE property (
    property_name VARCHAR(30),
    property_id int NOT NULL,
	colour_id int NOT NULL,
	purchase_cost int NOT NULL,
    owner int,
	PRIMARY KEY (property_name),
    FOREIGN KEY (owner) REFERENCES player(player_id),
	FOREIGN KEY (colour_id) REFERENCES colour(colour_id),
    FOREIGN KEY (property_id) REFERENCES location(location_id)
    );
    
