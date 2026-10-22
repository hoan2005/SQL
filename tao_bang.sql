-- 1. Bảng Thể loại phim
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- 2. Bảng Phim (Đã dùng VARCHAR cho rating để lưu 'PG-13', 'R',...)
CREATE TABLE film (
    film_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    length INT,
    rental_rate DECIMAL(5,2),
    rating VARCHAR(10),
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Bảng Diễn viên (MỚI BỔ SUNG)
CREATE TABLE actor (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Bảng Khách hàng
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

-- 5. Bảng trung gian Phim - Thể loại
CREATE TABLE film_category (
    film_id INT REFERENCES film(film_id) ON DELETE CASCADE,
    category_id INT REFERENCES category(category_id) ON DELETE CASCADE,
    PRIMARY KEY (film_id, category_id)
);

-- 6. Bảng trung gian Phim - Diễn viên (MỚI BỔ SUNG)
CREATE TABLE film_actor (
    actor_id INT REFERENCES actor(actor_id) ON DELETE CASCADE,
    film_id INT REFERENCES film(film_id) ON DELETE CASCADE,
    PRIMARY KEY (actor_id, film_id),
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 7. Bảng Kho phim (Inventory)
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    film_id INT REFERENCES film(film_id) ON DELETE CASCADE,
    store_id INT
);

-- 8. Bảng Lượt thuê (Rental)
CREATE TABLE rental (
    rental_id SERIAL PRIMARY KEY,
    rental_date TIMESTAMP NOT NULL,
    inventory_id INT REFERENCES inventory(inventory_id) ON DELETE CASCADE,
    customer_id INT REFERENCES customer(customer_id) ON DELETE CASCADE,
    return_date TIMESTAMP
);

-- 9. Bảng Thanh toán (Payment)
CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customer(customer_id) ON DELETE CASCADE,
    rental_id INT REFERENCES rental(rental_id) ON DELETE CASCADE,
    amount DECIMAL(5,2) NOT NULL,
    payment_date TIMESTAMP NOT NULL
);