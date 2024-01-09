# 🗂️ Модуль 07: 
Посмотреть материалы модуля: [здесь](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module07 "здесь") 📑


Посмотреть материалы к вебинару "Введение в PySpark и SparkSQL": [здесь](https://github.com/oleg-agapov/getting-started-with-pyspark-ru "здесь") 📑

✒️ **Задачи:** 
- **Изучить Apache Spark**

## Установка Apache Spark

**1. Для установки переходим на сайт**: https://spark.apache.org/downloads.html


Проверяем актулаьность версии и **нажимаем на пункт Download Spark**:
![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_07/download%20start.png)


**2**. Попадаем сюда: https://www.apache.org/dyn/closer.lua/spark/spark-3.5.0/spark-3.5.0-bin-hadoop3.tgz


**Загружаем архив** по верхней ссылке:
![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_07/download%20apache%20spark.png)


**3**. В IDE - например, Visual Studio Code - открываем новый терминал powershell и **выполняем команду, чтобы распаковать скачанный архив**:


   tar - xvzf [полный путь до скачанного архива] -C [путь куда распаковать]

   
   Пример:    tar - xvzf C:\Users\Natalya_PY\Downloads\spark-3.5.0-bin-hadoop3.tgz -C C:\Users\Natalya_PY\Downloads


Это мы так распаковываем архив в необычном формате (потому что Windows его автоматически распаковать не может)

**4**. Далее можно переместить папку с распакованным архивом куда пожелаете (я, например, сделала себе отдельную папку spark).

Есть информация, что для дальнейшего запуска ещё нужен **файл winutils.exe**. Скачать его можно здесь: https://github.com/cdarlint/winutils (из папки с последней версией hadoop, например сейчас это hadoop-3.3.5/bin). Я добавила скачанный файл в папку spark (где находится распакованный архив spark-3.5.0-bin-hadoop3).


Также нужно прописать **переменные среды на Windows**. Поиск - Изменение системных переменнных среды - Переменные среды - Системные переменные - Создать.


Например, у меня это:
- JAVA_HOME: C:\Program Files\Java\jre1.8.0_261
- SPARK_HOME: C:\Program Files\Spark\spark-3.5.0-bin-hadoop3


**5. Как проверить, всё ли работает и запустить Spark**
Для этого заходим в командную строку. Например, можно открыть новый терминал в VSC - powershell.
- проверяем, находится ли java: java -version
- проверяем, находится ли python: python --version
- запускаем spark - для этого надо быть по адресу его расположения в папке bin (у меня это C:\Program Files\Spark\spark-3.5.0-bin-hadoop3\bin) и вызвать команду: pyspark (или .\pyspark).
