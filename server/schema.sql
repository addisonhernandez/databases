CREATE DATABASE IF NOT EXISTS chat;

USE chat;

DROP TABLE IF EXISTS `Messages`, `Rooms`, `Users`, `Friends`;

-- ---
-- Table messages
--
-- ---

CREATE TABLE `Messages` (
  `Message ID` INT NOT NULL AUTO_INCREMENT,
  -- `Room Name` INTEGER NULL,
  `Room Name` VARCHAR(20) NULL,
  `Message Text` MEDIUMTEXT,
  -- `Username` INTEGER NULL,
  `Username` VARCHAR(20) NULL,
  `Created At` TIMESTAMP NULL,
  `Updated At` TIMESTAMP NULL,
  PRIMARY KEY (`Message ID`)
);


-- ---
-- Table rooms
--
-- ---

CREATE TABLE `Rooms` (
  `Room ID` INTEGER NOT NULL AUTO_INCREMENT,
  `Room Name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Room ID`)
);



-- ---
-- Table users
--
-- ---

CREATE TABLE `Users` (
  `User ID` INTEGER NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(20) NOT NULL,
  `Github Handle` VARCHAR(40) NULL,
  `Campus` VARCHAR(20) NULL,
  `Friend` INTEGER,
  PRIMARY KEY (`User ID`)
);

-- ---
-- Table Friends
--
-- ---

CREATE TABLE `Friends`(
  `Friend ID` INTEGER NOT NULL AUTO_INCREMENT,
  `User` INTEGER NOT NULL,
  `Friend` INTEGER NOT NULL,
  PRIMARY KEY (`Friend ID`)
);


-- ---
-- Foreign Keys
-- ---

-- ALTER TABLE `Messages` ADD FOREIGN KEY (Username) REFERENCES `Users` (`User ID`);
-- ALTER TABLE `Messages` ADD FOREIGN KEY (`Room Name`) REFERENCES `Rooms` (`Room ID`);
ALTER TABLE `Users` ADD FOREIGN KEY (Friend) REFERENCES `Friends` (`Friend ID`);
ALTER TABLE `Friends` ADD FOREIGN KEY (User) REFERENCES `Users` (`User ID`);
ALTER TABLE `Friends` ADD FOREIGN KEY (Friend) REFERENCES `Users` (`User ID`);

-- ALTER TABLE `Rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Testing*/
-- INSERT INTO `Rooms` (`id`,`Room Name`,`Messages`,`Username`) VALUES
-- ('','','','');
-- INSERT INTO `Users` (`id`,`Username`,`Messages`,`Github Handle`,`Campus`) VALUES
-- ('','','','','');
-- INSERT INTO `Messages` (`id`,`Message ID`,`Room Name`,`Message Text`,`Username`,`Github Handle`,`Campus`,`Created At`,`Updated At`) VALUES
-- ('','','','','','','','','');


/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/


/* Example response from chatterbox server:

One message:
{
  "message_id": 57108,  <- NOT NULL ID
  "roomname": "lobby", <- have a rooms table
  "text": "asd",
  "username": "j", <- have a users table
  "github_handle": "haleyjung",
  "campus": "rfe",
  "created_at": "2022-03-12T20:37:45.546Z",
  "updated_at": "2022-03-12T20:37:45.546Z"
},

Rooms:
  roomname <- NOT NULL id?
  messages (foreign)
  usernames (foreign)

Users:
  username <- NOT NULL id
  messages (foreign)
  github_handle
  campus

*/