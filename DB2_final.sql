
CREATE TABLE M_room (
  idM_room INT UNSIGNED NOT NULL,
  name VARCHAR(45) NOT NULL,
  status VARCHAR(5) NULL,
  idAlarm INT UNSIGNED NULL,
  PRIMARY KEY (idM_room)
	);

CREATE TABLE Employee (
	username 	VARCHAR(45) NOT NULL,
	password VARCHAR(45),
	PRIMARY KEY(username)
	);

CREATE TABLE Appntmnt (
	idAppntmnt INT UNSIGNED NOT NULL,
	ddmmyy 		INT 		NOT NULL,
	startTime 	INT,
	endTime		INT,	
	note		VARCHAR(255),
	admin		VARCHAR(45),
	idM_room	INT UNSIGNED NOT NULL,
	PRIMARY KEY(idAppntmnt),
	FOREIGN KEY(admin) REFERENCES Employee(username),
	FOREIGN KEY(idM_room) REFERENCES M_room(idM_room)
	);

CREATE TABLE Section (
	idSection int UNSIGNED NOT NULL,
	name VARCHAR(45),
	PRIMARY KEY(idSection)
	);

CREATE TABLE SubSection (
	idSubSection	INT UNSIGNED NOT NULL,
	name 			VARCHAR(45),
	idParentSection	INT UNSIGNED,
	PRIMARY KEY(idSubSection),
	FOREIGN KEY(idParentSection) REFERENCES Section(idSection)
	);


CREATE TABLE Member (
 username VARCHAR(45) NOT NULL,
  idSection INT UNSIGNED NOT NULL,
  PRIMARY KEY (username,idSection),
  FOREIGN KEY(username) REFERENCES Employee(username),
  FOREIGN KEY(idSection) REFERENCES Section(idSection)
);

CREATE TABLE Alarm(
	idAlarm 	INT UNSIGNED NOT NULL,
	time 		INT UNSIGNED,
	note 		VARCHAR(255),
	PRIMARY KEY(idAlarm)
	);

CREATE TABLE AppntmntBtwn (
	idAppntmnt 		INT UNSIGNED NOT NULL,
	username 		VARCHAR(45)	 NOT NULL,
	status			VARCHAR(5),
	idAlarm 		INT UNSIGNED,
	PRIMARY KEY(idAppntmnt,username),
	FOREIGN KEY(idAppntmnt) REFERENCES Appntmnt(idAppntmnt),
	FOREIGN KEY(username) REFERENCES Employee(username),
	FOREIGN KEY(idAlarm) REFERENCES Alarm(idAlarm)
	);

