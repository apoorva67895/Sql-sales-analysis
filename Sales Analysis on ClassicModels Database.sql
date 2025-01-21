SELECT 
    p.productCode,
    p.productName,
    pl.productLine,
    SUM(od.quantityOrdered) AS totalQuantitySold
FROM 
    orderdetails od
JOIN 
    orders o ON od.orderNumber = o.orderNumber
JOIN 
    products p ON od.productCode = p.productCode
JOIN 
    productlines pl ON p.productLine = pl.productLine
WHERE 
    o.status = 'Shipped'
GROUP BY 
    p.productCode, p.productName, pl.productLine
ORDER BY 
    totalQuantitySold DESC
LIMIT 10;
SELECT 
    e.employeeNumber,
    e.firstName,
    e.lastName,
    e.jobTitle,
    COUNT(o.orderNumber) AS totalSales
FROM 
    employees e
JOIN 
    customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN 
    orders o ON c.customerNumber = o.customerNumber
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
WHERE 
    o.status = 'Shipped'
GROUP BY 
    e.employeeNumber, e.firstName, e.lastName, e.jobTitle
ORDER BY 
    totalSales DESC
LIMIT 10;
SELECT 
    pl.productLine,
    SUM(od.quantityOrdered * od.priceEach) AS totalSales
FROM 
    orderdetails od
JOIN 
    products p ON od.productCode = p.productCode
JOIN 
    productlines pl ON p.productLine = pl.productLine
GROUP BY 
    pl.productLine
ORDER BY 
    totalSales DESC;




SELECT 
    YEAR(orderDate) AS orderYear,
    MONTH(orderDate) AS orderMonth,
    COUNT(orderNumber) AS totalOrders
FROM 
    orders
GROUP BY 
    YEAR(orderDate), MONTH(orderDate)
ORDER BY 
    orderYear DESC, orderMonth DESC;
    
    
    SELECT 
    email,
    SUBSTRING(email, LOCATE('@', email) + 1) AS domain
FROM 
    customers;
    

SELECT 
    email,
    SUBSTRING(email, LOCATE('@', email) + 1) AS domain
FROM 
    employees;
SELECT 
    pl.productLine,
    MAX(p.buyPrice) AS highestPrice,
    MIN(p.buyPrice) AS lowestPrice
FROM 
    products p
JOIN 
    productlines pl ON p.productLine = pl.productLine
GROUP BY 
    pl.productLine
ORDER BY 
    pl.productLine;
    