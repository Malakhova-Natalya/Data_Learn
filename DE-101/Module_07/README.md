# 🗂️ Модуль 07: 
Посмотреть материалы модуля: [здесь](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module07 "здесь") 📑


Посмотреть материалы к вебинару "Введение в PySpark и SparkSQL" (Олег Агапов): [здесь](https://github.com/oleg-agapov/getting-started-with-pyspark-ru "здесь") 📑

✒️ **Задачи:** 
- **Установить и изучить основы Apache Spark**
- **Наладить взаимодействие с Jupyter Notebook**
- **Выполнить задания для практики, используя разные возможности Spark**

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

Есть информация, что для дальнейшего запуска ещё нужен **файл winutils.exe**. Скачать его можно здесь: https://github.com/cdarlint/winutils (из папки с последней версией hadoop, например сейчас это hadoop-3.3.5/bin). Далее я создала папки Hadoop и внутри неё папку bin, куда поместила файл winutils, получилось: C:\Program Files\Hadoop\bin\winutils.


Также нужно прописать **переменные среды на Windows**. Поиск - Изменение системных переменнных среды - Переменные среды - Переменные среды пользователя - Создать.


Например, у меня это:
- JAVA_HOME: C:\Program Files\Java\jre1.8.0_261
- HADOOP_HOME: C:\Program Files\Hadoop
- SPARK_HOME: C:\Program Files\Spark\spark-3.5.0-bin-hadoop3


Плюс нужно дополнить в этом же разделе Path:
- %JAVA_HOME%\bin
- %HADOOP_HOME%\bin
- %SPARK_HOME%\bin

**5. Как проверить, всё ли работает и запустить Spark**


Для этого заходим в командную строку. Например, можно открыть новый терминал в VSC - powershell.
- проверяем, находится ли java: java -version
- проверяем, находится ли python: python --version
- запускаем spark вызовом команды: pyspark.
Можно запустить, не прописывая переменные. Тогда надо быть по адресу: C:\Program Files\Spark\spark-3.5.0-bin-hadoop3, и зайти далее в папку bin, и оттуда вызвать команду pyspark (или .\pyspark).
- проверяем версию pyspark: spark.version


## Jupyter Notebook и Spark

Налаживаем взаимодействие Jupyter Notebook и Spark по статье: [Get Started with PySpark and Jupyter Notebook in 3 Minutes](https://medium.com/sicara/get-started-pyspark-jupyter-guide-tutorial-ae2fe84f594f#:~:text=There%20are%20two%20ways%20to%20get%20PySpark%20available,Jupyter%20Notebook%20and%20load%20PySpark%20using%20findSpark%20package)


Тетрадь Jupyter Notebook: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_07/Jupyter_Spark.ipynb "здесь")


Что внутри этой тетради:
![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_07/Jupyter_Spark.png)


Тетрадь Jupyter Notebook с пробной задачей про M&Ms: [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_07/Spark_notebook.ipynb "здесь")

![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_07/mnms_1.png)
![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_07/mnms_2.png)
![cover](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_07/mnms_3.png)

## Практика в Spark

В качестве практики выполнено две тетради:

1. Тетрадь Jupyter Notebook "San-Francisco fire calls project": [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_07/Spark_fire_calls.ipynb "здесь")
2. Тетрадь Jupyter Notebook "More practice (Departure delays project)": [здесь](https://github.com/Malakhova-Natalya/Data_Learn/blob/main/DE-101/Module_07/Spark_practice.ipynb "здесь")

