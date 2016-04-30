DROP TABLE IF EXISTS Photo, Favorited, Bought, Location, User;

CREATE TABLE User
(
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(32) NOT NULL,
	last_name VARCHAR(32) NOT NULL,
	email VARCHAR(128) NOT NULL,
	username VARCHAR(32) NOT NULL,
	password VARCHAR(32) NOT NULL,
	cc_number BIGINT,
	cc_ex_month SMALLINT,
	cc_ex_year SMALLINT,
	PRIMARY KEY (id)
);

CREATE TABLE Favorited
(
	user_id INT NOT NULL,
	movie_id VARCHAR(64) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES User(id)
	ON DELETE CASCADE,
	PRIMARY KEY (user_id, movie_id)
);

CREATE TABLE Bought
(
	user_id INT NOT NULL,
	title VARCHAR(256) NOT NULL,
	theatre VARCHAR(128) NOT NULL,
	purchase_date BIGINT NOT NULL,
	view_date BIGINT NOT NULL,
	num_tickets INT NOT NULL,
	cost FLOAT,
	FOREIGN KEY (user_id) REFERENCES User(id)
	ON DELETE CASCADE,
	PRIMARY KEY(user_id, purchase_date)
);

CREATE TABLE Location
(
	user_id INT NOT NULL,
	zipcode INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES User(id)
	ON DELETE CASCADE,
	PRIMARY KEY(user_id, zipcode)
);

CREATE TABLE Photo
(
       id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
       extension ENUM('jpeg', 'jpg', 'png') NOT NULL,
       user_id INT,
       FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE
);
