FR1.4	Користувач надсилає повідомлення	Message	send()

### Вхідні параметри:

  1. text - текст, що міститься в повідомленні:

    - умова 1) - довжина рядка text до 2000 символів.
  2. phone - номер телефону користувача, якому відправляється повідомлення:

    - умова 2) - рядок phone має формат "+380";
    - умова 3) - довжина рядка phone до 100 символів;

### Вихідні параметри:

    - значення = 1 - повідомлення успішно відправлено;
    - значення = -1 - сталася помилка при відправленні повідомлення;
