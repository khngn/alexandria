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
('Alex Lee', '0401 147 258', 'alex@lib.com'),
('Steve Woz', '0402 258 789', 'steve@lib.com'),
('Brian Ng', '0402 258 789', 'brian@lib.com'),
('Thu La', '0402 258 789', 'thu@lib.com'),
('John Orange', '0402 258 789', 'john@lib.com'),
('Mike Mandarin', '0402 258 789', 'mike@lib.com'),
('Peter Apricot', '0402 258 789', 'peter@lib.com'),
('Dylan Plum', '0402 258 789', 'dylan@lib.com'),
('Bruce Papaya', '0402 258 789', 'bruce@lib.com'),
('Andy Tangalo', '0402 258 789', 'andy@lib.com')
;

INSERT INTO BOOK 
(TITLE, AUTHOR, ISBN)
VALUES 
('All the Light We Cannot See', 'Anthony Doerr', 133456789258),
('The Secret Chord', 'Geraldine Brooks', 4586789258369),
('The Lake House', 'Kate Morton', 456852753963),
('A Little Life', 'Hanya Yanagihara', 159357148357),
('A Brief History of Seven Killings', 'Marlon James', 123478654487),
('Career of Evil', 'Robert Galbraith', 123654789456),
('Purity', 'Jonathan Franzan', 789456123852),
('Big Little Lies', 'Liane Moriarty', 852321789654),
('Go Set a Watchman', 'Harper Lee', 963214521785),
('The Girl in the Spider''s Web', 'David Lagercrantz', 214236258247)
;

INSERT INTO CHECKOUT 
(PERSON_ID, BOOK_ID, CHECKOUT_TS)
VALUES 
(1,1, CURRENT TIMESTAMP),
(1,3, CURRENT TIMESTAMP),
(2,2, CURRENT TIMESTAMP),
(2,4, CURRENT TIMESTAMP),
(2,6, CURRENT TIMESTAMP),
(3,3, CURRENT TIMESTAMP),
(3,4, CURRENT TIMESTAMP),
(4,5, CURRENT TIMESTAMP),
(5,6, CURRENT TIMESTAMP),
(6,6, CURRENT TIMESTAMP),
(6,7, CURRENT TIMESTAMP),
(6,8, CURRENT TIMESTAMP),
(7,7, CURRENT TIMESTAMP),
(8,8, CURRENT TIMESTAMP),
(9,9, CURRENT TIMESTAMP),
(9,10, CURRENT TIMESTAMP),
(10,1, CURRENT TIMESTAMP),
(10,2, CURRENT TIMESTAMP),
(10,3, CURRENT TIMESTAMP),
(10,4, CURRENT TIMESTAMP)
;
