# 🗂️ Модуль 02: Базы данных и SQL
Посмотреть материалы модуля: [здесь](https://github.com/Data-Learn/data-engineering/blob/master/DE-101%20Modules/Module02/readme.md "здесь") 📑


Посмотреть задание: [здесь](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module02/DE%20-%20101%20Lab%202.1 "здесь") 👀


✒️ **Задачи:** 
- **установить базу данных к себе на компьютер / Postgres**
- **установить клиент SQL для подключения базы данных / DBeaver**
- **создать 3 таблицы и загрузить данные из excel-файла Superstore в базу данных**
- **написать SQL-запросы, чтобы изучить показатели бизнеса**
- **нарисовать модели данных для Superstore**
- **выполнить DDL в SQL клиенте: создать новые таблицы и заполнить их данными**
- **загрузить данные в разные слои: создать схемы stg и dw и наполнить их данными**
- **создать дашборды в нескольких BI-инструментах**


## Установка базы данных, клиента SQL, загрузка данных в БД, написание SQL-запросов
**Инструменты: Postgres, DBeaver**


Скрипт для загрузки таблицы orders: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/orders.sql "здесь")


Скрипт для загрузки таблицы people: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/people.sql "здесь")


Скрипт для загрузки таблицы returns: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/returns.sql "здесь")


SQL-запросы: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/SQL_queries.sql "здесь")

## Модели данных для Superstore
**Инструмент: SqlDBM**


- этот open-source инструмент позволяет рисовать модели данных на разных уровнях детализации
- здесь графически представлены макеты моделей - поэтому удобно настраивать взаимосвязи таблиц
- а в разделе Forward engineering можно получить DDL для создания таблиц по созданным моделям

**Мини-презентация**: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/Model_types.pdf "здесь")


### Концептуальная модель
На этом этапе продумывается концепция таблиц, им даются названия + определяются взаимосвязи


![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/01_model.png)

### Логическая модель
На этом шаге концепция дополняется конкретными столбцами + определяются ключи


![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/02_model.png)

### Физическая модель
Столбцы дополняются типами данных + отсюда можно брать DDL для создания таблиц в SQL-клиенте


![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/03_model.png)

## DDL - Data Definition Language
В этом задании используется:


**DDL (Data Definition Language)** - это подмножество языка SQL (Structured Query Language), 
 используемое для определения структуры базы данных и ее объектов, таких как таблицы, представления, индексы и процедуры.

 
Все скрипты для создания таблиц и наполнения их данными: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/DDL.sql "здесь")


На основании физических моделей были созданы dimension-таблицы: 
- calendar,
- geography,
- product,
- shipping,


и в конце создана таблица


- sales,


к которой идут все взаимосвязи.


Все таблицы наполнены данными благодаря SQL-запросам.

## Слои данных

Скрипты создания новых схем stg и dw и наполнения их данными:
- для схемы stg: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/layer_01_staging.sql "здесь")
- для схемы dw: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/layer_02_dw.sql "здесь")


## Дашборды в разных BI-инструментах
**Инструменты: Yandex DataLens, Google Lookerstudio, Microsoft Power BI**


Выполнить развёртывание БД в облаке на данный момент не удалось:
- для зарубежных систем - блокировка банковской карты
- для Yandex Cloud - пробный период завершён, доступ к ресурсам приостановлен



На будущее для того, чтобы подключаться BI-инструментом к БД в облаке, можно изучить Docker. В чате курса есть рекомендация



"Бесплатный, очень подробный курс": https://karpov.courses/docker


### Yandex DataLens
**Дашборд Yandex DataLens**: [здесь](https://datalens.yandex.ru/ycexrsyxn70an-superstore-dashboard?state=b77e25b1106 "здесь")

Подключение к данным - загрузка датасета в DataLens

![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/dashboard_01_datalens.png)

### Google Lookerstudio
**Дашборд Google Lookerstudio**: [здесь](https://lookerstudio.google.com/reporting/4e2800e1-fdc4-480a-855f-fb7e62e21ef3 "здесь")

Подключение к данным через Google Диск - Google Таблицы

![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/dashboard_02_lookerstudio.png)

**Варианты с изменением цветов (эксперимент)**:

![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/dashboard_02_lookerstudio_02.png)

![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/dashboard_02_lookerstudio_03.png)

### Power BI
**Дашборд Power BI**

Подключение к данным - загрузка датасета в формате Excel в Power BI

![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/dashboard_03_powerbi_01.png)

**Вариант в другом дизайне**:

![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_02/dashboard_03_powerbi_02.png)
