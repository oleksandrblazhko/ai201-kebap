CREATE TABLE message (
	msg_id INT,
	text VARCHAR(2000),
	receiver_id INT,
	sender_id INT
);

INSERT INTO message VALUES(1, 'text_1',1,2);
INSERT INTO message VALUES(2, 'text_2',2,1);
INSERT INTO message VALUES(3, 'text_3',2,3);
INSERT INTO message VALUES(4, 'text_4',2,3);

SELECT * FROM message;