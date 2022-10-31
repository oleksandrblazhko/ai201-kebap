/* Приклади роботи з класом Product */
DECLARE
    pr1 Product;
BEGIN 
    pr1:= NEW Product(1,'моршинська',19.6);
	    dbms_output.put_line('get get_product_id: ' || wf1.get_product_id);
	    dbms_output.put_line('get get_pname: ' || wf1.get_pname);
      dbms_output.put_line('get get_price: ' || wf1.get_price);
    pr1.display();
END;
/

/* Приклад роботи з класами Product, My_order */
DECLARE 
    pr1 Product;
	prs Products_List;
    ord1 My_order;
BEGIN 
    pr1:= Product(1,'моршинська',19.6);
	prs:= Products_List(pr1)
    ord1:= My_order(1, TO_TIME('17:25','HH:MM'), TO_TIME('6:23','HH:MM'),'адреса_доставки',4724.2, 1, 2, prs);
    ord1.display();
END;
/


/* Приклад роботи з класами Product, My_order , My_user */
DECLARE 
    pr1 Product;
	pr2 Product;
	prs Products_List;
    ord1 My_order;
    us1 My_user;
BEGIN
    pr1:= Product(1,'моршинська',19.6);
	pr1:= Product(2,'КокаКола',29.8);
	prs:= Products_List(pr1,pr2)
    ord1:= My_order(1, TO_TIME('17:25','HH:MM'), TO_TIME('6:23','HH:MM'),'адреса_доставки',4724.2, 1, 2, prs);
	ord1.display();
    us1 := My_user(1, 'Прізвище Імя По_батькові', "+380815402635", '@user_pseudo');
    us1.display(); 
END;
/

/* Приклад роботи з класами Product, My_order , My_user, Employee */
DECLARE 
    pr1 Product;
	pr2 Product;
	prs Products_List;
    ord1 My_order;
    us1 My_user;
    emp1 Employee;
BEGIN 
    pr1:= Product(1,'моршинська',19.6);
	pr1:= Product(2,'КокаКола',29.8);
	prs:= Products_List(pr1,pr2)
    ord1:= My_order(1, TO_TIME('17:25','HH:MM'), TO_TIME('6:23','HH:MM'),'адреса_доставки',4724.2, 1, 2, prs);
	ord1.display();
    us1 := My_user(1, 'Прізвище Імя По_батькові', "+380815402635", '@user_pseudo');
    emp1 := Employee(3, 'менеджер', 52000, TO_DATE('18.02.2017','DD/MM/YYYY'), us1); 
    emp1.display(); 
END;
/