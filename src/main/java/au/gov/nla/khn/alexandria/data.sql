DROP TABLE CHECKOUT;
DROP TABLE PERSON;
DROP TABLE BOOK;

CREATE TABLE PERSON
(
	PERSON_ID int auto_increment,
	NAME varchar(20),
	PHONE_NUMBER varchar(20),
	EMAIL varchar(100),
	CONSTRAINT PERSON_pk PRIMARY KEY (PERSON_ID)
);

CREATE TABLE BOOK
(
	BOOK_ID int auto_increment,
	TITLE varchar(100),
	AUTHOR varchar(50),
	ISBN bigint,
	CONSTRAINT BOOK_pk PRIMARY KEY (BOOK_ID)
);

CREATE TABLE CHECKOUT
(
	BOOK_ID int,
	PERSON_ID int,
	CHECKOUT_TS timestamp,
	RETURNED_TS timestamp,
	CONSTRAINT BR_fk1 FOREIGN KEY (PERSON_ID) REFERENCES PERSON(PERSON_ID),
	CONSTRAINT BR_fk2 FOREIGN KEY (BOOK_ID) REFERENCES BOOK(BOOK_ID)
);


INSERT INTO PERSON 
(NAME, PHONE_NUMBER, EMAIL)
VALUES 
('Anthony Doerr', '0403 658 759', 'john@lib.com'),
('Geraldine Brooks', '0402 268 989', 'mike@lib.com'),
('Kate Morton', '0401 258 789', 'peter@lib.com'),
('Hanya Yanagihara', '0405 256 889', 'dylan@lib.com'),
('Marlon James', '0407 258 799', 'bruce@lib.com'),
('Robert Galbraith', '0409 358 789', 'andy@lib.com')
;

INSERT INTO BOOK 
(TITLE, AUTHOR, ISBN)
VALUES 
('All the Light We Cannot See', 'Anthony Doerr', 3456789258),
('The Secret Chord', 'Geraldine Brooks', 6789258369),
('The Lake House', 'Kate Morton', 6852753963),
('A Little Life', 'Hanya Yanagihara', 9357148357),
('A Brief History of Seven Killings', 'Marlon James', 3478654487),
('Career of Evil', 'Robert Galbraith', 3654789456),
('Purity', 'Jonathan Franzan', 9456123852),
('Big Little Lies', 'Liane Moriarty', 2321789654),
('Go Set a Watchman', 'Harper Lee', 3214521785),
('The Girl in the Spider''s Web', 'David Lagercrantz', 4236258247)
;

INSERT INTO CHECKOUT 
(PERSON_ID, BOOK_ID, CHECKOUT_TS)
VALUES 
(1,1, CURRENT TIMESTAMP),
(1,3, CURRENT TIMESTAMP),
(1,5, CURRENT TIMESTAMP),
(2,2, CURRENT TIMESTAMP),
(2,4, CURRENT TIMESTAMP),
(2,6, CURRENT TIMESTAMP),
(3,3, CURRENT TIMESTAMP),
(3,4, CURRENT TIMESTAMP),
(4,5, CURRENT TIMESTAMP),
(4,6, CURRENT TIMESTAMP),
(4,7, CURRENT TIMESTAMP),
(5,6, CURRENT TIMESTAMP),
(6,6, CURRENT TIMESTAMP),
(6,7, CURRENT TIMESTAMP),
(6,8, CURRENT TIMESTAMP),
;
