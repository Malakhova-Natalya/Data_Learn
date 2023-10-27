
DDL (Data Definition Language) - это подмножество языка SQL (Structured Query Language), 
 используемое для определения структуры базы данных и ее объектов, таких как таблицы, представления, индексы и процедуры.

Создаём поэтапно все таблицы с признаками (dimension), в конце создаём таблицу sales (fact)
 
-- ************************************** calendar
 -- удаляем таблицу, если она существует вместе со всем, что с ней связано (т.е. CONSTRAINT)
DROP TABLE IF EXISTS calendar cascade;

-- создаём таблицу, прописывая типы данных и взаимосвязи
-- тип int4range меняем на int - иначе будет ошибка из-за несоответствия типа данных
CREATE TABLE calendar
(
 order_date date NOT NULL,
 ship_date  date NOT NULL,
 year       int NOT NULL,
 quarter    varchar(15) NOT NULL,
 month      int NOT NULL,
 week       int NOT NULL,
 week_day   int NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( order_date, ship_date ) -- в бесплатной версии программы SqlDBM разделы Forward engineering создаются по одному
); -- поэтому CONSTRAINT каждый раз PK_1. Однако с одинаковым PK_1 таблицы не создадутся - поэтому на следующих шагах меняем PK_1 на PK_2 и т.д.

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

DROP TABLE IF EXISTS geography cascade;

CREATE TABLE geography
(
 geo_id      int NOT NULL,
 country     varchar(13) NOT NULL,
 region      varchar(7) NOT NULL,
 "state"     varchar(20) NOT NULL, -- здесь изменения по длине varchar в сравнении со схемой SqlDBM, иначе не все значения помещались
 city        varchar(17) NOT NULL, 
 postal_code int NULL, -- здесь может быть NULL
 CONSTRAINT PK_2 PRIMARY KEY ( geo_id ) -- меняем на PK_2 
);

INSERT INTO geography (geo_id, country, region, state, city, postal_code) 

SELECT 1000 + row_number() OVER() AS geo_id, * --здесь добавляем тысячу чтобы значения выглядели ровнее
FROM (
SELECT 
DISTINCT country AS country ,
region AS region,
state AS state,
city AS city,
postal_code AS postal_code
FROM public.orders
ORDER BY postal_code);

-- ************************************** product

DROP TABLE IF EXISTS product cascade;

CREATE TABLE product
(
 product_id   varchar(17) NOT NULL, -- здесь не int в исходных данных
 category     varchar(15) NOT NULL,
 subcategory  varchar(11) NOT NULL,
 product_name varchar(127) NOT NULL,
 CONSTRAINT PK_3 PRIMARY KEY ( product_id )
);


INSERT INTO product (product_id, category, subcategory, product_name) 
-- в исходных данных есть дублирование одного product_id, поэтому мы добавляем row_number() - чтобы добиться уникальности
SELECT concat(row_number() OVER(PARTITION BY product_id), '_', product_id) AS product_id, category, subcategory, product_name
FROM (
SELECT DISTINCT
product_id, category, subcategory, product_name
FROM public.orders
ORDER BY 1);

-- ************************************** shipping

DROP TABLE IF EXISTS shipping cascade;

CREATE TABLE shipping
(
 ship_id   int NOT NULL,
 ship_mode varchar(14) NOT NULL,
 CONSTRAINT PK_4 PRIMARY KEY ( ship_id )
);


INSERT INTO shipping (ship_id, ship_mode) 

SELECT 100 + row_number() OVER() AS ship_id, ship_mode
FROM (
SELECT DISTINCT ship_mode
FROM public.orders
ORDER BY 1);

-- ************************************** sales

DROP TABLE IF EXISTS sales cascade;

CREATE TABLE sales
(
 row_id     int NOT NULL,
 order_id   varchar(14) NOT NULL,
 sales      numeric NOT NULL,
 quantity   int NOT NULL,
 discount   numeric NOT NULL,
 profit     numeric NOT NULL,
 order_date date NOT NULL,
 ship_date  date NOT NULL,
 product_id varchar(17) NOT NULL,
 geo_id     int NOT NULL,
 ship_id    int NOT NULL,
 CONSTRAINT PK_5 PRIMARY KEY ( row_id ), 
 CONSTRAINT FK_1 FOREIGN KEY ( order_date, ship_date ) REFERENCES calendar ( order_date, ship_date ), 
 CONSTRAINT FK_2 FOREIGN KEY ( geo_id ) REFERENCES geography ( geo_id ), 
 CONSTRAINT FK_3 FOREIGN KEY ( product_id ) REFERENCES product ( product_id ),
 CONSTRAINT FK_4 FOREIGN KEY ( ship_id ) REFERENCES shipping ( ship_id ) 
);

CREATE INDEX FK_1 ON sales 
(
 order_date,
 ship_date
);

CREATE INDEX FK_2 ON sales
(
 geo_id
);

CREATE INDEX FK_3 ON sales 
(
 product_id
);

CREATE INDEX FK_4 ON sales
(
 ship_id
);

INSERT INTO sales (row_id, order_id, sales, quantity, discount, profit, 
order_date, ship_date, product_id, geo_id,  ship_id) 

SELECT o.row_id, o.order_id, o.sales, o.quantity, o.discount, o.profit,
o.order_date, o.ship_date, p.product_id,
1000 + row_number() OVER(PARTITION BY country, region, state, city, postal_code) AS geo_id,
s.ship_id
FROM public.orders o
LEFT JOIN public.shipping s ON o.ship_mode=s.ship_mode
LEFT JOIN public.product p ON o.product_id =right(p.product_id,15) AND o.product_name=p.product_name --а присоеднияем по старому product_id, поэтому right
ORDER BY 1;

