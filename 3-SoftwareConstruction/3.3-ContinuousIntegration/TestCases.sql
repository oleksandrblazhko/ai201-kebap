CREATE OR REPLACE FUNCTION msg_text_is_correct(my_text VARCHAR)
RETURN BOOLEAN
IS
BEGIN
	RETURN NOT regexp_like(my_text,
	                   '^(\S{21,})$');
                       --для тесту я зробив до 20 символів, томущо 2000 це забагато тексту
END;
/

CREATE OR REPLACE FUNCTION phone_is_correct(phone VARCHAR)
RETURN BOOLEAN
IS
BEGIN
	RETURN regexp_like(phone,'^(\+380[0-9]{9})|(\S{21,})$');
END;

/

CREATE OR REPLACE FUNCTION send_message(my_text VARCHAR, phone VARCHAR)
RETURN NUMBER
IS
    f_res NUMBER(1);
BEGIN
    IF msg_text_is_correct(my_text) THEN
        IF phone_is_correct(phone) THEN
            BEGIN
                f_res :=1;
            END; 
        ELSE f_res :=-1;
        END IF;
    ELSE f_res :=-1;
    END IF;
RETURN f_res;
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('TC1: send_message(''текст повідомлення'',''+380625816525'') очікуваний результат 1, результат:'|| send_message('текст повідомлення','+380625816525'));
	DBMS_OUTPUT.PUT_LINE('TC2: send_message(''текст повідомлення'',''+3806258165251234567892314123'') очікуваний результат -1, результат:'|| send_message('текст повідомлення','+380625816525'));
	DBMS_OUTPUT.PUT_LINE('TC3: send_message(''текст повідомлення'',''+730625816525'') очікуваний результат -1, результат:'|| send_message('текст повідомлення','+380625816525'));
	DBMS_OUTPUT.PUT_LINE('TC4: send_message(''текст повідомлення'',''+38062asdg525'') очікуваний результат -1, результат:'|| send_message('текст повідомлення','+380625816525'));
	DBMS_OUTPUT.PUT_LINE('TC5: send_message(''текст повідомленнuhasbdiasdbaidbasdbasdbsadjasdя'',''+380625816525'') очікуваний результат -1, результат:'|| send_message('текст повідомлення','+380625816525'));			    	    			    	
END;
