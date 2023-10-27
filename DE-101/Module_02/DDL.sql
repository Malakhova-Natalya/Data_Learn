DDL
 
-- ************************************** calendar
 -- удаляем таблицу, если она существует вместе со всем, что с ней связано (CONSTRAINT)
DROP TABLE IF EXISTS calendar cascade;
-- создаём таблицу, прописывая типы данных и взаимосвязи
-- тип int4range меняем на int
CREATE TABLE calendar
(
 order_date date NOT NULL,
 ship_date  date NOT NULL,
 year       int NOT NULL,
 quarter    varchar(15) NOT NULL,
 month      int NOT NULL,
 week       int NOT NULL,
 week_day   int NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( order_date, ship_date )
);
-- вставляем значения во все столбцы
INSERT INTO calendar(order_date,ship_date, year, quarter, month, week, week_day) 
-- делаем это не при помощи VALUE, а при помощи SQL-запроса к существующей таблице
-- поскольку это таблица dimension, делаем DISTINCT, чтобы для каждой уникальной даты вывести её свойства
SELECT DISTINCT order_date::date , ship_date::date, 
EXTRACT('year' FROM order_date)::int AS year,
EXTRACT('quarter' FROM order_date) AS quarter,
EXTRACT('month' FROM order_date) AS month,
EXTRACT('week' FROM order_date) AS week,
EXTRACT('isodow' FROM order_date) AS week_day
FROM public.orders;

-- ************************************** geography

CREATE TABLE geography
(
 geo_id      int NOT NULL,
 country     varchar(13) NOT NULL,
 region      varchar(7) NOT NULL,
 "state"       varchar(11) NOT NULL,
 city        varchar(17) NOT NULL,
 postal_code int4range NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( geo_id )
);

-- ************************************** product

CREATE TABLE product
(
 product_id   int NOT NULL,
 category     varchar(15) NOT NULL,
 subcategory  varchar(11) NOT NULL,
 segment      varchar(11) NOT NULL,
 product_name varchar(127) NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( product_id )
);

-- ************************************** shipping

CREATE TABLE shipping
(
 ship_id   int NOT NULL,
 ship_mode varchar(14) NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( ship_id )
);

-- ************************************** sales

CREATE TABLE sales
(
 row_id     int4range NOT NULL,
 order_id   varchar(14) NOT NULL,
 sales      numeric NOT NULL,
 quantity   int4range NOT NULL,
 discount   numeric NOT NULL,
 profit     numeric NOT NULL,
 product_id int NOT NULL,
 geo_id     int NOT NULL,
 order_date date NOT NULL,
 ship_date  date NOT NULL,
 ship_id    int NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( row_id ),
 CONSTRAINT FK_1 FOREIGN KEY ( order_date, ship_date ) REFERENCES calendar ( order_date, ship_date ),
 CONSTRAINT FK_4 FOREIGN KEY ( geo_id ) REFERENCES geography ( geo_id ),
 CONSTRAINT FK_2 FOREIGN KEY ( product_id ) REFERENCES product ( product_id ),
 CONSTRAINT FK_5 FOREIGN KEY ( ship_id ) REFERENCES shipping ( ship_id )
);

CREATE INDEX FK_2 ON sales
(
 order_date,
 ship_date
);

CREATE INDEX FK_3 ON sales
(
 geo_id
);

CREATE INDEX FK_4 ON sales
(
 product_id
);

CREATE INDEX FK_4_1 ON sales
(
 ship_id
);
