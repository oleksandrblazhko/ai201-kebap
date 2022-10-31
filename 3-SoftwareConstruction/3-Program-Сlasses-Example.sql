/* Створення об'єктного типу (класу) My_user */
CREATE OR REPLACE TYPE My_user AS OBJECT (
	user_id INT, -- id користувача
	full_name VARCHAR(100), -- ПІБ
	phone VARCHAR(20), -- номер телефону
	pseudonym VARCHAR(100), -- псевдонім
    	NOT FINAL MEMBER PROCEDURE display
) NOT FINAL 
/

/* Створення типу для зберігання списку співробітників - "Колекція екземплярів об`єктів класу My_user */
CREATE TYPE Users_List IS TABLE OF My_user;
/

/* Cтворення об'єктного типу (класу) Employee, що успадковує об'єктний тип My_user */
CREATE OR REPLACE TYPE Employee UNDER My_user (
	employee_id INT, -- id співробітника
	position VARCHAR(50), -- посада
	salary NUMBER(7,2), -- з/п
	date_of_employment DATE, -- дата найму на роботу
	user_id INT -- id користувача
	/* перевизначення методу-процедури класу My_user */
    	OVERRIDING MEMBER PROCEDURE display 
);
/


/* Створення об'єктного типу (класу) Message */
CREATE OR REPLACE TYPE Message AS OBJECT (
	msg_id INT, -- id повідомлення
	text VARCHAR(2000), -- текст повідомлення
	receiver_id INT, -- id отримувача
	sender_id INT, -- id відправника
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/


/* Створення об'єктного типу (класу) Product */
CREATE OR REPLACE TYPE Product AS OBJECT (
	product_id NUMBER(10), -- id продукту
	name VARCHAR(100), -- назва
	price NUMBER(6,2), -- ціна
	/* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_pname - назва товару
	   умова 1) якщо в таблиці Product вже існує вказаний товар,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Product створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Product(p_pname VARCHAR)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_pname(p_product_id NUMBER, p_pname VARCHAR, p_price NUMBER),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_product_id RETURN NUMBER,
		MEMBER FUNCTION get_pname RETURN VARCHAR,
		MEMBER FUNCTION get_price RETURN NUMBER,
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/


/* Створення об'єктного типу (класу) My_order */
CREATE OR REPLACE TYPE My_order AS OBJECT (
	order_id INT, -- id замовлення
	order_time TIME, -- час замовлення
	delivery_time TIME, -- час доставки
	delivery_address VARCHAR(100), -- адреса доставки
	total_price NUMBER(6,2), -- загальна ціна
	user_id INT, -- id замовника
	employee_id INT, -- id працівника, відповідального за це замовлення
	prod Product, -- список товарів в замовленні
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/
