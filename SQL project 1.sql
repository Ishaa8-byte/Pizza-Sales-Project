// Structure database table
// .Order TABLE

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_time TIME NOT NULL,
    order_date DATE NOT NULL
);

// .Pizza Table
CREATE TABLE pizzas (
    pizza_id TEXT PRIMARY KEY,
    pizza_type_id INT NOT NULL,
    price DECIMAL(5,2) NOT NULL,
    size VARCHAR(10) NOT NULL
);

// .Pizza Types TABLE
CREATE TABLE pizza_types (
    pizza_type_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(50),
    ingredients TEXT
);

// .Order Deatils TABLE
CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    pizza_id TEXT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id)
);

// Retrieve the total no. of orders placed.

SELECT COUNT(order_id) as total_orders from orders;

// Top Selling Pizza

SELECT pizza_id, SUM(quantity) AS total_sold
FROM order_details
GROUP BY pizza_id
ORDER BY total_sold DESC
LIMIT 5;

// Track Daily Sales Trend
SELECT order_date, SUM(quantity) AS total_pizzas_sold
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
GROUP BY order_date
ORDER BY order_date;

//calculate total revenue generated from pizza sales.

SELECT ROUND(SUM(order_details.quantity*pizza price),
FROM order_details JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id)

//Identify the highest price pizza.

SELECT pizza_types.name, pizzas.price
FROM pizzza_types join pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzqas.price DESC limit 1;

//Determine the most common pizza size ordered.

SELECT pizzas.size, COUNT(order_details.order_details_id)
FROM pizzas JOIN order_details
ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size;

// Determine distribution of orders by hour of day.

SELECT HOUR(order_time) as hour,
COUNT (order_id) AS order_count
FROM orders GROUP BY HOUR (order_time);

