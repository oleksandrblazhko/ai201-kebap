/* Методи класу Product */
-- DROP TYPE Product FORCE;
CREATE OR REPLACE TYPE BODY Product AS 

	/* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_pname - назва товару
	   умова 1) якщо в таблиці Product вже існує вказаний товар,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Product створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    CONSTRUCTOR FUNCTION Product(p_pname VARCHAR) 
        RETURN SELF AS RESULT
    IS
        v_product_id prod.product_id%TYPE;
    BEGIN
        SELECT product_id INTO v_product_id
        FROM Product
        WHERE 
            name = p_pname;
        SELF.product_id := v_product_id;
        SELF.name := p_pname;
		SELF.price := p_price;
        RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO Product (name)
            VALUES (p_pname)
        RETURNING product_id INTO v_product_id;
        SELF.product_id := v_product_id;
        SELF.name := p_pname;
		SELF.price := p_price;
        RETURN;
    END Product;

	/* Процедура зміни значення атрибутів */
	MEMBER PROCEDURE set_pname(p_product_id NUMBER, p_pname VARCHAR, p_price NUMBER)
	IS
	BEGIN
        UPDATE Prod SET name = p_pname
		WHERE product_id = p_product_id;
		SELF.name := p_pname;
		SELF.price := p_price;
	END set_pname;

	/* Функції отримання значень атрибутів */
	/* get_product_id */
    MEMBER FUNCTION get_product_id
	    RETURN NUMBER 
	IS
    BEGIN
       RETURN SELF.product_id;
    END get_product_id;

	/* get_pname */
    MEMBER FUNCTION get_pname
	    RETURN VARCHAR 
	IS
    BEGIN
       RETURN SELF.name;
    END get_pname;
	
	/* get_price */
    MEMBER FUNCTION get_price
	    RETURN NUMBER 
	IS
    BEGIN
       RETURN SELF.price;
    END get_price;	

    /* Процедура виводу на екран значень атрибутів */
    MEMBER PROCEDURE display 
    IS
    BEGIN 
        dbms_output.put_line('product_id: ' || product_id);
        dbms_output.put_line('name: ' || name);
		dbms_output.put_line('price: ' || price);
    END display;
END; 
/




/* Методи класу My_order */
CREATE OR REPLACE TYPE BODY My_order AS 
    /* Метод-процедура display виводу на екран 
    значень атрибутів екземпляру об'єкту класу */
    MEMBER PROCEDURE display IS 
    BEGIN 
        dbms_output.put_line('order_id: ' || Self.order_id); 
        dbms_output.put_line('order_time: ' || Self.order_time);
		dbms_output.put_line('delivery_time: ' || Self.delivery_time);
		dbms_output.put_line('delivery_address: ' || Self.delivery_address);
		dbms_output.put_line('total_price: ' || Self.total_price);
		dbms_output.put_line('user_id: ' || Self.user_id);
		dbms_output.put_line('employee_id: ' || Self.employee_id); 
    END display;
END; 
/