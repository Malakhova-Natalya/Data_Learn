
--Для практики в Tableau Prep создадим несколько таблиц с заказами по регионам

--для этого создаём схему tab
create SCHEMA tab;


--------------------------------------------------------------------------
--SOUTH

-- удаляем схему и таблицу, если они уже существуют
-- и описываем структуру таблицы
DROP TABLE IF EXISTS tab.orders_south;

CREATE TABLE tab.orders_south(
	order_date date NOT NULL,
	ship_date date NOT NULL,
	row_id float8 NULL,
	order_id text NULL,
	ship_mode text NULL,
	customer_id text NULL,
	customer_name text NULL,
	segment text NULL,
	country text NULL,
	city text NULL,
	state text NULL,
	postal_code text NULL,
	region text NULL,
	product_id text NULL,
	category text NULL,
	subcategory text NULL,
	product_name text NULL,
	sales float8 NULL,
	quantity float8 NULL,
	discount float8 NULL,
	profit float8 NULL
);

--предварительно удаляем строки, чтобы точно не было дубликатов или лишних записей
TRUNCATE TABLE tab.orders_south;

--вставляем данные по условию из stg.orders
INSERT INTO tab.orders_south 
SELECT * 
FROM stg.orders 
WHERE region = 'South';

-----------------------------------------------------------------------------
--EAST

-- удаляем схему и таблицу, если они уже существуют
-- и описываем структуру таблицы
DROP TABLE IF EXISTS tab.orders_east;

CREATE TABLE tab.orders_east(
	order_date date NOT NULL,
	ship_date date NOT NULL,
	row_id float8 NULL,
	order_id text NULL,
	ship_mode text NULL,
	customer_id text NULL,
	customer_name text NULL,
	segment text NULL,
	country text NULL,
	city text NULL,
	state text NULL,
	postal_code text NULL,
	region text NULL,
	product_id text NULL,
	category text NULL,
	subcategory text NULL,
	product_name text NULL,
	sales float8 NULL,
	quantity float8 NULL,
	discount float8 NULL,
	profit float8 NULL
);

--предварительно удаляем строки, чтобы точно не было дубликатов или лишних записей
TRUNCATE TABLE tab.orders_east;

--вставляем данные по условию из stg.orders
INSERT INTO tab.orders_east
SELECT * 
FROM stg.orders 
WHERE region = 'East';

-----------------------------------------------------------------------------
--WEST

-- удаляем схему и таблицу, если они уже существуют
-- и описываем структуру таблицы
DROP TABLE IF EXISTS tab.orders_west;

CREATE TABLE tab.orders_west(
	order_date date NOT NULL,
	ship_date date NOT NULL,
	row_id float8 NULL,
	order_id text NULL,
	ship_mode text NULL,
	customer_id text NULL,
	customer_name text NULL,
	segment text NULL,
	country text NULL,
	city text NULL,
	state text NULL,
	postal_code text NULL,
	region text NULL,
	product_id text NULL,
	category text NULL,
	subcategory text NULL,
	product_name text NULL,
	sales float8 NULL,
	quantity float8 NULL,
	discount float8 NULL,
	profit float8 NULL
);

--предварительно удаляем строки, чтобы точно не было дубликатов или лишних записей
TRUNCATE TABLE tab.orders_west;

--вставляем данные по условию из stg.orders
INSERT INTO tab.orders_west 
SELECT * 
FROM stg.orders 
WHERE region = 'West';

-----------------------------------------------------------------------------
--CENTRAL

-- удаляем схему и таблицу, если они уже существуют
-- и описываем структуру таблицы
DROP TABLE IF EXISTS tab.orders_central;

CREATE TABLE tab.orders_central(
	order_date date NOT NULL,
	ship_date date NOT NULL,
	row_id float8 NULL,
	order_id text NULL,
	ship_mode text NULL,
	customer_id text NULL,
	customer_name text NULL,
	segment text NULL,
	country text NULL,
	city text NULL,
	state text NULL,
	postal_code text NULL,
	region text NULL,
	product_id text NULL,
	category text NULL,
	subcategory text NULL,
	product_name text NULL,
	sales float8 NULL,
	quantity float8 NULL,
	discount float8 NULL,
	profit float8 NULL
);

--предварительно удаляем строки, чтобы точно не было дубликатов или лишних записей
TRUNCATE TABLE tab.orders_central;

--вставляем данные по условию из stg.orders
INSERT INTO tab.orders_central 
SELECT * 
FROM stg.orders 
WHERE region = 'Central';
