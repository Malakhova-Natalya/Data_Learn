# 🗂️ Модуль 04: 
Посмотреть материалы модуля: [здесь](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module04 "здесь") 📑


Посмотреть задание: [здесь](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module04/DE%20-%20101%20Lab%204.4 "здесь") 👀


✒️ **Задачи:** 
- **скачать и запустить ETL инструмент Pentaho Data Integration CE**
- **довести до результата Pentaho jobs для staging и dimension tables**
- **создать новую трансформацию, результатом которой станет sales_fact таблица**
- **выявить 8-10 ETL подсистем в Pentaho DI и написать по ним небольшой отчёт**


## Бесплатный ETL инструмент Pentaho Data Integration Community Edition
**Инструмент: Pentaho Data Integration Community Edition**


Это бесплатный ETL инструмент, который работает на Windows, Linux и Mac. Скачать его можно отсюда:
https://www.hitachivantara.com/en-us/products/pentaho-platform/data-integration-analytics/pentaho-community-edition.html 


По ссылке отображается список разных версий, нам нужен pentaho data integration - pdi, community edition - ce, последней существующей версии. Например сейчас это:


- pdi-ce-9.4.0.0-343.zip           Pentaho Data Integration (Base Install) 


Нужно скачать архив и распаковать его в любую папку. Например, в C:/Program Files.


Также нужно установить Java, так как Pentaho DI требует его установку. 
Ссылка на скачивание JRE - Java Runtime Environment: https://java.com/en/download/ 

После скачивания нужно запустить spoon.sh для Linux/Mac и spoon.bat для Windows. Можно создать ярлык на рабочий стол, дать ему картинку из скачанной папки и назвать его, например, Pentaho Data Integration.

Видео, по которому можно ориентироваться (автор - Павел Новичков, куратор 4-го модуля и ETL специалист): 


https://www.youtube.com/watch?v=RL-EZCi51gc 

## ETL компоненты и начало работы с ETL на примере Pentaho Data Integration


Довести до результата Pentaho jobs для Staging и Dimension Tables:

**1. transformation_staging**: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_04/transformation_staging.ktr "здесь")

   ![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_04/transformation_01.png)

**2. transformation_dim**: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_04/transformation_dim.ktr "здесь")

   ![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_04/transformation_02.png)

Создать новую трансформацию, результатом которой станет sales_fact таблица:

**3. transformation_sales_fact**: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_04/transformation_sales_fact.ktr "здесь")

   ![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_04/transformation_03.png)

## Небольшой отчёт про подсистемы ETL Pentaho DI

Согласно Ральфу Кимбаллу, существует 34 ETL подсистемы, которые делятся на 4 основных категории:

- Data Extracting (получить данные из систем - E в ETL)
- Cleaning and Conforming Data (интеграция данных и подготовка к загрузке в DW - T в ETL)
- Delivering Data for Presentation (обработка данных в DW - L в ETL)
- Managing the ETL environment (управление и мониторинг компонентов ETL)

Я обозначила разными цветами эти 4 категории и подписала некоторые использованные в моём решении ETL подсистемы:

![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_04/34_ETL_subsystems_01.png)



![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_04/34_ETL_subsystems_02.png)

**Data Extracting**
- **3** - Extracting System: задача системы - понять источник и суметь к нему подключиться

**Cleaning and Conforming Data**
- **6** - Audit Data: задача системы - мониторить качество данных и выявлять отклонения
- **7** - Deduplication System: система выявляет дубликаты и удаляет их

**Data Delivery**
- **10** - Surrogate Key Creation System: генерация суррогатных ключей для натуральных ключей (например, через создание последовательности чисел)
- **21** - Data Integration Manager: задача системы - забирать данные и загружать их в другие системы

**Managing the ETL Environment**
- **27** - Workflow Monitor: мониторинг рабоыт ETL решения (запись логов)
- **28** - Sort System: задача системы - упорядочивать строки
- **30** - Problem Escalation System: задача - сообщать о проблемах и например, автоматически создавать тикет в системе (Jira и т.п.)
- **33** - Compliance Reporter: сбор данных для возможного аудита, где можно отследить все действия ETL решения
