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
