/*
CREATE
    [DEFINER = user]
	TRIGGER trigger_name
	trigger_time trigger_event
    ON tbl_name FOR EACH ROW
    [trigger_order]
	trigger_body

trigger_time: { BEFORE | AFTER }

trigger_event: { INSERT | UPDATE | DELETE }

trigger_time: { FOLLOWS | PRECEDES } other_trigger_name
 */
 CREATE TABLE tab_billing
(SALE_DATE DATE NULL, TOTAL_SALE FLOAT);

SELECT * FROM tab_billing;

SELECT * FROM notes;
SELECT * FROM notes_items;

INSERT INTO notes (NUMBER, SALE_DATE, CPF, REGISTRATION, TAX)
VALUES ('0100', '2019-05-08', '1471156710', '235', 0.10);
INSERT INTO notes_items (NUMBER, CODE, AMOUNT, PRICE)
VALUES ('0100', '1000889', 100, 10);
INSERT INTO notes_items (NUMBER, CODE, AMOUNT, PRICE)
VALUES ('0100', '1000888', 100, 10);

INSERT INTO tab_billing
    SELECT A.SALE_DATE, SUM(B.AMOUNT * B.PRICE) AS TOTAL_SALE
    FROM notes A INNER JOIN notes_items B
    ON A.NUMBER = B.NUMBER
    GROUP BY A.SALE_DATE;

# IMPLEMENTING TRIGGER
DELIMITER $
CREATE TRIGGER TG_CALCULATE_BILLING_INSERT AFTER INSERT ON notes_items
    FOR EACH ROW BEGIN
        DELETE FROM tab_billing;
        INSERT INTO tab_billing
            SELECT A.SALE_DATE, SUM(B.AMOUNT * B.PRICE) AS TOTAL_SALE
            FROM notes A INNER JOIN notes_items B
            ON A.NUMBER = B.NUMBER
            GROUP BY A.SALE_DATE;
END $