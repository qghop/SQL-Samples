use classic;

SELECT DISTINCT customerName
FROM customers
WHERE customerNumber IN (
    SELECT customerNumber
    FROM orders
    WHERE orderNumber IN (
        SELECT orderNumber
        FROM orderdetails
        WHERE productCode = 'S24_2840'
    )
);


