CREATE TABLE `710_created_jobs` (
	`job` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`jobdata` TEXT NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`bossmenu` TEXT NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`status` TINYINT(4) NOT NULL DEFAULT '1',
	PRIMARY KEY (`job`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
