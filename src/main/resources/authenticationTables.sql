CREATE TABLE `users` (
	`username` VARCHAR(50) NOT NULL,
	`password` VARCHAR(50) NOT NULL,
	`enabled` TINYINT(1) NOT NULL,
	PRIMARY KEY (`username`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `authorities` (
	`username` VARCHAR(50) NOT NULL,
	`authority` VARCHAR(50) NOT NULL,
	UNIQUE INDEX `ix_auth_username` (`username`, `authority`),
	CONSTRAINT `fk_authority_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

insert into users (username, password, enabled) values ("bryan", "secret", true)

insert into authorities (username, authority) values ("bryan", "ROLE_USER")

update users set password="5ebe2294ecd0e0f08eab7690d2a6ee69" where username="Bryan"