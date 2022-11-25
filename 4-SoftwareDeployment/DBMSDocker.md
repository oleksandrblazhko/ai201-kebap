Кроки роботи з Docker образом та створюємим Docker-контейнером для СКБД
Створення БД
Завантажуємо образ СКБД PostgreSql:
docker pull postgres

Запускаємо контейнер за завантаженим образом СКБД, враховуємо, що

Назва контейнеру kebap-postgres
Порт 5432
Змінна оточення POSTGRES_PASSWORD = 1234
Створюємо робочий каталог з додатковими файлами у файловій системі нового Docker-образу
Встановлюємо зв’язок між локальним каталогом комп’ютера та робочим каталогом
Запускаємо у фоновому режимі
docker run --name kebap-postgres -p 5432:5432 -e POSTGRES_PASSWORD=1234 -w /scripts -v ${PWD}:/scripts -d postgres

Почнемо роботу з оболонкою командного рядку запущеного контейнеру
docker exec -it kebap-postgres bash

Створимо нову БД під користувачем postgres та назвою 'kebapdb'
createdb kebapdb -U postgres

У базі даних kebapdb під користувачем postgres виконаємо SQL-скрипт для створення та заповнення БД
psql -U postgres -d kebapdb < ./scripts/db_script.sql

Вийдемо із оболонки командного рядку
exit


Перевірка працездатності
Перегляньмо файли у поточному каталозі
ls

Встановимо змінні оточення JAVA_HOME та PATH, що будуть вказувати на корень каталогу із JDK 11 версії та його каталог bin відповідно. Для PowerShall синтаксис наступний: $Env:<VARIABLE_NAME>=<VALUE>, VARIABLE_NAME - назва змінної оточення, VALUE - значення для цієї цмінної оточення.
$Env:JAVA_HOME="C:\Users\dimasik\.jdks\openjdk-18.0.1.1"
 $Env:PATH="C:\Users\dimasik\.jdks\openjdk-18.0.1.1\bin"

Скомпілюємо файл із Java-кодом Main.java, додатково вказавши драйвер для нашої бази даних
javac -cp "postgresql-42.5.0.jar;." ProgramClientCode.java

Виконаємо скомпільований Main.class додатково вказавши драйвер для нашої бази даних та параметр 1234 - пароль до БД
java -cp "postgresql-42.5.0.jar;." ProgramClientCode 1234
