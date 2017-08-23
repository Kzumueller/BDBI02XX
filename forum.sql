#Create table

#MySQL
CREATE TABLE `forum` 
(`Id` INT(11) PRIMARY KEY AUTO_INCREMENT, 
`antwort_id` INT(11) NOT NULL, 
`antwort` BOOLEAN, # == TINYINT
`name` VARCHAR(255), 
`email` VARCHAR(255), 
`titel` VARCHAR(255), 
`inhalt` TEXT, 
`zeit` DATETIME NOT NULL DEFAULT CURRENT_TIMSTAMP); #Nuetzlich, um die aktuelle Zeit automatisch zu setzen, Datentyp TIMESTAMP legt allerdings automatisch ein Attribut "on update CURRENT_TIMESTAMP" an, was fuer den Anwendungsfall eher ungeeignet ist

#Java DB SQL
CREATE TABLE forum
(Id INT NOT NULL PRIMARY KEY 
GENERATED ALWAYS AS IDENTITY
(START WITH 1, INCREMENT BY 1), 
antwort_id INT NOT NULL, 
antwort SMALLINT, -- Kompatibilitaet 
name VARCHAR(255), 
email VARCHAR(255), 
titel VARCHAR(255), 
inhalt VARCHAR(5000), 
zeit TIMESTAMP NOT NULL);

#Insert

#MySQL
INSERT INTO `forum`
VALUES(0, 0, 0, "Admin", "admin@hszg.de", "Willkommen", "Willkommen im Forum!", "2015-04-05 12:05:45.198"); # Id = 0 -> AUTO_INCREMENT magic

#Java DB SQL
INSERT INTO forum (antwort_id, antwort, name, email, titel, inhalt, zeit)
VALUES(0, 0, 'Admin', 'admin@hszg.de', 'Willkommen', 'Willkommen im Forum!', '2015-04-05 12:05:45.198');
