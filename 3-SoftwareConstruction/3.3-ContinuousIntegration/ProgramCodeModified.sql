/* Створення об'єктного типу (класу) My_user */
CREATE TABLE My_user(
	user_id INT, -- id користувача
	full_name VARCHAR(100), -- ПІБ
	phone VARCHAR(20), -- номер телефону
	pseudonym VARCHAR(100), -- псевдонім
    	NOT FINAL MEMBER PROCEDURE display
) NOT FINAL 
