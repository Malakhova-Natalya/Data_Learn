# 🗂️ Модуль 04: 
Посмотреть материалы модуля: [здесь](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module04 "здесь") 📑


Посмотреть задание: [здесь](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module04/DE%20-%20101%20Lab%204.4 "здесь") 👀


✒️ **Задачи:** 
- **скачать и запустить ETL инструмент Pentaho Data Integration CE**
- **довести до результата Pentaho jobs для staging и dimension tables**
- **создать новую трансформацию, результатом которой станет sales_fact таблица**


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


**Довести до результата Pentaho jobs для Staging и Dimension Tables**:

1. transformation_staging: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_04/transformation_staging.ktr "здесь")

   

2. transformation_dim: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_04/transformation_dim.ktr "здесь")

   

**Создать новую трансформацию, результатом которой станет sales_fact таблица**:

3. transformation_sales_fact: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_04/transformation_sales_fact.ktr "здесь")

   ![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_04/transformation_03.png)
