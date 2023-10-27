

CREATE TABLE calendar
(
 order_date date NOT NULL,
 ship_date  date NOT NULL,
 year       int4range NOT NULL,
 quarter    varchar(15) NOT NULL,
 month      int4range NOT NULL,
 week       int4range NOT NULL,
 week_day   int4range NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( order_date, ship_date )
);
--------------
