
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);


CREATE TABLE rental (
    rental_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
        ON DELETE CASCADE
);

-- Thêm 3 khách hàng
INSERT INTO customer (customer_id, first_name, last_name) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Bob', 'Johnson');


INSERT INTO rental (customer_id, rental_id)
SELECT 1, generate_series(1, 40);


INSERT INTO rental (customer_id, rental_id)
SELECT 2, generate_series(41, 60);


INSERT INTO rental (customer_id, rental_id)
SELECT 3, generate_series(61, 70);


SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals
FROM 
    customer c
INNER JOIN 
    rental r ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name
HAVING 
    COUNT(r.rental_id) > 35
ORDER BY 
    total_rentals DESC;