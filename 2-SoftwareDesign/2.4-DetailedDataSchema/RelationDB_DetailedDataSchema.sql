/* видалення таблиць з каскадним видаленням 
можливих описів цілісності */
drop table employee CASCADE CONSTRAINTS;
drop table user CASCADE CONSTRAINTS;
drop table product CASCADE CONSTRAINTS;
drop table order CASCADE CONSTRAINTS;
drop table order_product CASCADE CONSTRAINTS;
drop table message CASCADE CONSTRAINTS;

 CREATE SEQUENCE s_user; --
 CREATE SEQUENCE s_employee; --
 CREATE SEQUENCE s_message;    --послідовності для заповнення таблиць
 CREATE SEQUENCE s_order; --
 CREATE SEQUENCE s_product;   --

CREATE TABLE user ( -- опис користувача
	user_id INT, -- id користувача
	full_name VARCHAR(100), -- ПІБ
	phone VARCHAR(20), -- номер телефону
	pseudonym VARCHAR(100), -- псевдонім
	avatar BINARY(1), -- аватарка
);

CREATE TABLE employee ( -- опис співробітника
	employee_id INT, -- id співробітника
	position VARCHAR(50), -- посада
	salary NUMBER(7,2), -- з/п
	date_of_employment DATE, -- дата найму на роботу
	user_id INT -- id користувача
);

CREATE TABLE message ( -- опис онлайн-повідомлень
	msg_id INT, -- id повідомлення
	text VARCHAR(2000), -- текст повідомлення
	receiver_id INT, -- id отримувача
	sender_id INT, -- id відправника
);

CREATE TABLE order ( -- опис онлайн-повідомлень
	order_id INT, -- id замовлення
	order_time TIME, -- час замовлення
	delivery_time TIME, -- час доставки
	delivery_address VARCHAR(100), -- адреса доставки
	total_price NUMBER(6,2), -- загальна ціна
	user_id INT, -- id замовника
	employee_id INT, -- id працівника, відповідального за це замовлення
);

CREATE TABLE product ( -- опис онлайн-повідомлень
	product_id NUMBER(10), -- id продукту
	name VARCHAR(100), -- назва
	price NUMBER(6,2), -- ціна
);

CREATE TABLE order_product (
			order_id INT REFERENCES order(order_id),
			product_id INT REFERENCES product(product_id),
			PRIMARY KEY (order_id, product_id)
);


---------- обмеження первинних ключів
ALTER TABLE user ADD CONSTRAINT user_pk
PRIMARY KEY (user_id);
ALTER TABLE employee ADD CONSTRAINT employee_pk
PRIMARY KEY (employee_id);
ALTER TABLE message ADD CONSTRAINT message_pk
PRIMARY KEY (msg_id);
ALTER TABLE order ADD CONSTRAINT order_pk
PRIMARY KEY (id_order);
ALTER TABLE product ADD CONSTRAINT product_pk
PRIMARY KEY (id_product);
	
---------- обмеження зовнішніх ключів

ALTER TABLE employee ADD CONSTRAINT employee_user_fk
FOREIGN KEY (user_id)
REFERENCES user(user_id);


ALTER TABLE message ADD CONSTRAINT message_rec_fk
FOREIGN KEY (receiver_id)
REFERENCES user(user_id);
ALTER TABLE message ADD CONSTRAINT message_sen_fk
FOREIGN KEY (sender_id)
REFERENCES user(user_id);

ALTER TABLE order ADD CONSTRAINT order_us_fk
FOREIGN KEY (user_id)
REFERENCES user(user_id);
ALTER TABLE order ADD CONSTRAINT order_emp_fk
FOREIGN KEY (employee_id)
REFERENCES employee(employee_id);

	
-- обмеження вмісту стовпчиків таблиць
ALTER TABLE user ADD CONSTRAINT pseudonym_template
    CHECK (regexp_like(pseudonym, 
	           '^(@[a-z][a-z0-9._-]*\.[a-z]{2,4})$'));

ALTER TABLE user ADD CONSTRAINT user_phone_template
    CHECK ( regexp_like(phone, 
	          '^(\([0-9]{3}\))?[0-9]{3}-[0-9]{4}$'));
			  
ALTER TABLE employee ADD CONSTRAINT emp_salary_range
	CHECK (salary between 0 and 1000000);
