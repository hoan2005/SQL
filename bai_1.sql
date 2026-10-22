--tạo bảng film
CREATE TABLE film (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year smallint,
    lenght smallint,
    rental_rate NUMERIC(12,2),
    rating smallint,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- thêm vào 20 dòng dữ liệu
INSERT INTO film (title, release_year, lenght, rental_rate, rating) VALUES

('The Godfather', 1972, 175, 4.99, 5),
('The Dark Knight', 2008, 152, 3.99, 5),
('Pulp Fiction', 1994, 154, 2.99, 4),
('Forrest Gump', 1994, 142, 1.99, 4),
('Inception', 2010, 148, 3.99, 5),
('Fight Club', 1999, 139, 2.99, 4),
('The Matrix', 1999, 136, 2.99, 5),
('Goodfellas', 1990, 146, 3.49, 4),
('Interstellar', 2014, 169, 4.49, 5),
('Parasite', 2019, 132, 3.99, 5),
('Gladiator', 2000, 155, 2.99, 4),
('The Lion King', 1994, 88, 1.99, 5),
('Avengers: Endgame', 2019, 181, 4.99, 4),
('Spirited Away', 2001, 125, 3.49, 5),
('Whiplash', 2014, 106, 2.49, 5),
('The Prestige', 2006, 130, 2.99, 4),
('The Departed', 2006, 151, 3.49, 4),
('Coco', 2017, 105, 2.99, 5),
('Joker', 2019, 122, 3.99, 4);

-- sắp xếp và chọn ra 10 dong có thời lượng dài nhất
select * from film order by lenght desc limit 10