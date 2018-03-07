/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen 
Date:			3/7/2018
Description:	Creates the File table and respective stored procedures

*/


USE tafers;



-- ------------------------------------------------------------
-- Drop existing objects
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `tafers`.`File`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_File_Load`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_File_LoadAll`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_File_Add`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_File_Update`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_File_Delete`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_File_Search`;


-- ------------------------------------------------------------
-- Create table
-- ------------------------------------------------------------



CREATE TABLE `tafers`.`File` (
id INT AUTO_INCREMENT,
userId INT,
fileName VARCHAR(512),
uploadIP VARCHAR(64),
uploadDate DATETIME,
fileExtension VARCHAR(64),
fileSize INT,
fileType VARCHAR(256),
isPublic INT,
CONSTRAINT pk_File_id PRIMARY KEY (id),
CONSTRAINT fk_File_userId_User_id FOREIGN KEY (userId) REFERENCES User (id)
);


-- ------------------------------------------------------------
-- Create default SCRUD sprocs for this table
-- ------------------------------------------------------------


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_File_Load`
(
	 IN paramid INT
)
BEGIN
	SELECT
		`File`.`id` AS `id`,
		`File`.`userId` AS `userId`,
		`File`.`fileName` AS `fileName`,
		`File`.`uploadIP` AS `uploadIP`,
		`File`.`uploadDate` AS `uploadDate`,
		`File`.`fileExtension` AS `fileExtension`,
		`File`.`fileSize` AS `fileSize`,
		`File`.`fileType` AS `fileType`,
		`File`.`isPublic` AS `isPublic`
	FROM `File`
	WHERE 		`File`.`id` = paramid;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `tafers`.`usp_File_LoadAll`
()
BEGIN
	SELECT
		`File`.`id` AS `id`,
		`File`.`userId` AS `userId`,
		`File`.`fileName` AS `fileName`,
		`File`.`uploadIP` AS `uploadIP`,
		`File`.`uploadDate` AS `uploadDate`,
		`File`.`fileExtension` AS `fileExtension`,
		`File`.`fileSize` AS `fileSize`,
		`File`.`fileType` AS `fileType`,
		`File`.`isPublic` AS `isPublic`
	FROM `File`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `tafers`.`usp_File_Add`
(
	 IN paramuserId INT,
	 IN paramfileName VARCHAR(512),
	 IN paramuploadIP VARCHAR(64),
	 IN paramuploadDate DATETIME,
	 IN paramfileExtension VARCHAR(64),
	 IN paramfileSize INT,
	 IN paramfileType VARCHAR(256),
	 IN paramisPublic INT
)
BEGIN
	INSERT INTO `File` (userId,fileName,uploadIP,uploadDate,fileExtension,fileSize,fileType,isPublic)
	VALUES (paramuserId, paramfileName, paramuploadIP, paramuploadDate, paramfileExtension, paramfileSize, paramfileType, paramisPublic);
	-- Return last inserted ID as result
	SELECT LAST_INSERT_ID() as id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_File_Update`
(
	IN paramid INT,
	IN paramuserId INT,
	IN paramfileName VARCHAR(512),
	IN paramuploadIP VARCHAR(64),
	IN paramuploadDate DATETIME,
	IN paramfileExtension VARCHAR(64),
	IN paramfileSize INT,
	IN paramfileType VARCHAR(256),
	IN paramisPublic INT
)
BEGIN
	UPDATE `File`
	SET userId = paramuserId
		,fileName = paramfileName
		,uploadIP = paramuploadIP
		,uploadDate = paramuploadDate
		,fileExtension = paramfileExtension
		,fileSize = paramfileSize
		,fileType = paramfileType
		,isPublic = paramisPublic
	WHERE		`File`.`id` = paramid;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_File_Delete`
(
	IN paramid INT
)
BEGIN
	DELETE FROM `File`
	WHERE		`File`.`id` = paramid;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_File_Search`
(
	IN paramid INT,
	IN paramuserId INT,
	IN paramfileName VARCHAR(512),
	IN paramuploadIP VARCHAR(64),
	IN paramuploadDate DATETIME,
	IN paramfileExtension VARCHAR(64),
	IN paramfileSize INT,
	IN paramfileType VARCHAR(256),
	IN paramisPublic INT
)
BEGIN
	SELECT
		`File`.`id` AS `id`,
		`File`.`userId` AS `userId`,
		`File`.`fileName` AS `fileName`,
		`File`.`uploadIP` AS `uploadIP`,
		`File`.`uploadDate` AS `uploadDate`,
		`File`.`fileExtension` AS `fileExtension`,
		`File`.`fileSize` AS `fileSize`,
		`File`.`fileType` AS `fileType`,
		`File`.`isPublic` AS `isPublic`
	FROM `File`
	WHERE
		COALESCE(File.`id`,0) = COALESCE(paramid,File.`id`,0)
		AND COALESCE(File.`userId`,0) = COALESCE(paramuserId,File.`userId`,0)
		AND COALESCE(File.`fileName`,'') = COALESCE(paramfileName,File.`fileName`,'')
		AND COALESCE(File.`uploadIP`,'') = COALESCE(paramuploadIP,File.`uploadIP`,'')
		AND COALESCE(CAST(File.`uploadDate` AS DATE), CAST(NOW() AS DATE)) = COALESCE(CAST(paramuploadDate AS DATE),CAST(File.`uploadDate` AS DATE), CAST(NOW() AS DATE))
		AND COALESCE(File.`fileExtension`,'') = COALESCE(paramfileExtension,File.`fileExtension`,'')
		AND COALESCE(File.`fileSize`,0) = COALESCE(paramfileSize,File.`fileSize`,0)
		AND COALESCE(File.`fileType`,'') = COALESCE(paramfileType,File.`fileType`,'')
		AND COALESCE(File.`isPublic`,0) = COALESCE(paramisPublic,File.`isPublic`,0);
END //
DELIMITER ;


