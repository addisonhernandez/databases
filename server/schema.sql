CREATE DATABASE IF NOT EXISTS chat;

USE chat;


-- ---
-- Table messages
--
-- ---

DROP TABLE IF EXISTS `Messages`;

CREATE TABLE `Messages` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `Message ID` INT NOT NULL,
  `Room Name` MEDIUMTEXT NULL,
  `Message Text` MEDIUMTEXT NULL,
  `Username` MEDIUMTEXT NULL,
  `Github Handle` VARCHAR(40) NULL,
  `Campus` MEDIUMTEXT NULL,
  `Created At` TIMESTAMP NULL,
  `Updated At` TIMESTAMP NULL,
  PRIMARY KEY (`id`, `Message ID`)
);


-- ---
-- Table rooms
--
-- ---

DROP TABLE IF EXISTS `Rooms`;

CREATE TABLE `Rooms` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `Room Name` VARCHAR(20) NOT NULL,
  `Messages` MEDIUMTEXT NULL,
  `Username` MEDIUMTEXT NULL,
  PRIMARY KEY (`id`, `Room Name`)
);



-- ---
-- Table users
--
-- ---

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(20) NOT NULL,
  `Messages` MEDIUMTEXT NULL,
  `Github Handle` VARCHAR(40) NULL,
  `Campus` MEDIUMTEXT NULL,
  PRIMARY KEY (`id`, `Username`)
);

/*Table Properties*/
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