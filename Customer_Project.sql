 net sales ROUND(SUM((unitprice*quantity)*(1-discount)),0);


SELECT LastName, FirstName, COUNT(orderid) AS NUM_ORDERS, ROUND(SUM((unitprice*quantity)*(1-discount)),0) AS TOTAL_SALES FROM employees
JOIN orders USING (EmployeeID)
JOIN `order details` USING (orderid)
GROUP BY employeeid
HAVING NUM_ORDERS>200
ORDER BY TOTAL_SALES DESC;


SELECT shipcountry, COUNT(productid) AS NUM_PRODUCTS, 
ROUND(SUM((products.unitprice*quantity)*(1-discount)),0) AS sales FROM orders
JOIN `order details` USING (orderid)
JOIN products USING (productid)
WHERE sales > 10000
GROUP BY shipcountry
ORDER BY NUM_PRODUCTS DESC
LIMIT 5;

SELECT companyname, COUNT(productid) AS NUM_PRODUCTS FROM customers
JOIN orders USING (customerid)
JOIN `order details` USING (orderid)
JOIN products USING (productid)
WHERE country='Germany' 
AND productname='Tarte au sucre'
AND freight > (SELECT AVG(freight) FROM orders)
GROUP BY companyname;

SELECT companyname, ROUND(AVG(discount), 3) AS AVG_DISCOUNTS FROM customers
JOIN orders USING (customerid)
JOIN `order details` USING (orderid)
GROUP BY companyname
ORDER BY COUNT(productid) DESC
LIMIT 2;

SELECT contactname, phone, productname, shipcountry FROM customers
JOIN orders USING (customerid)
JOIN `order details` USING (orderid)
JOIN products USING (productid)
WHERE country = 'USA'
AND products.unitprice = (SELECT MAX(unitprice) FROM products)
GROUP BY contactname, phone, productname, shipcountry;



