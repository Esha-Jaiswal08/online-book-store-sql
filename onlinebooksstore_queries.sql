-- 1) Retrieve all books in the "Fiction" genre:
SELECT * FROM books
WHERE Genre='Fiction';

-- 2) Find books published after the year 1950:
SELECT * FROM books
WHERE Published_Year>1950;

-- 3) List all customers from the Cannada:
SELECT * FROM customers
WHERE Country="canada";

-- 4) Show orders placed in November 2023:
SELECT * FROM orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
SELECT SUM(stock) AS total_stock
FROM books;

 -- 6)find the details of the most expensive book:
 SELECT * FROM books ORDER BY Price DESC LIMIT 1;

-- 7) show all customers who ordered more than 1 quantity of a book:
SELECT * FROM orders
WHERE Quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM orders
WHERE Total_Amount>20;

-- 9)  List all genres available in the books table:
SELECT DISTINCT Genre FROM books;
 
-- 10) Find the book  with the lowest stock:
SELECT * FROM books 
order BY Stock
LIMIT 0,25;

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(Total_Amount) AS revenue
FROM orders LIMIT 0,25;







-- 12) Retrieve the total number of  books sold for each genre:
SELECT * FROM orders;

SELECT b.Genre,SUM( o. Quantity) AS Total_Books_sold
FROM orders o
JOIN books b ON o.Book_ID = b. Book_ID 
GROUP BY b.Genre
LIMIT 0,25;

-- 13) Find the Average price of books in the "Fantasy" genre:
SELECT AVG(price) AS Average_Price
FROM books
WHERE Genre ='Fantasy';

-- 14) List customers who have placed at least 2 orders:
SELECT o.Customer_ID, c.name,COUNT(o.Order_ID) AS order_count
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.Customer_ID, c.name
HAVING COUNT(Order_ID) >=2;

-- 15) Find the most frequently ordered book:
SELECT o.Book_ID, COUNT(o.order_id) AS order_count
FROM orders o
JOIN books b ON o.Book_ID= b.Book_ID
GROUP BY o.Book_ID, b.title
ORDER BY order_count DESC
LIMIT 1;

-- 16) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * FROM books
WHERE genre ='Fantasy'
Order BY price DESC LIMIT 3;

-- 17) Retrieve the total quantity of books sold by each author:
SELECT b.author, SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b ON o.book_id=b.Book_id 
GROUP BY b.Author;

-- 18) List the cities where customers who spent over $30 are located:
SELECT DISTINCT c.city, Total_Amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.Total_Amount > 30;

-- 19) Find the customer who spent the most on orders:
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
Order BY total_spent DESC LIMIT 1;

-- 20) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title,b.stock, COALESCE(sum(o.quantity),0) AS order_quantity,
b.stock- COALESCE(sum(o.quantity),0) AS remaining_quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.Book_ID
GROUP BY b.book_id Order BY b.book_id;



