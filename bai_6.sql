-- Tạo bảng category
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT null 
);

-- Tạo bảng film_category
CREATE TABLE film_category (
    category_id INT NOT NULL,
    film_id INT NOT NULL,
    PRIMARY KEY (category_id, film_id),
    CONSTRAINT fk_category 
        FOREIGN KEY (category_id) 
        REFERENCES category(category_id) 
        ON DELETE CASCADE
);

INSERT INTO category (name) VALUES
('Action'),
('Comedy'),
('Drama'),
('Thriller'),
('Horror'),
('Romance'),
('Sci-Fi'),
('Fantasy'),
('Animation'),
('Documentary'),
('Adventure'),
('Mystery'),
('Crime'),
('Family'),
('History'),
('Music'),
('Musical'),
('Sport'),
('War'),
('Western');



INSERT INTO film_category (category_id, film_id) VALUES
-- Thể loại Action (id = 1) có 4 phim
(1, 101),
(1, 102),
(1, 103),
(1, 104),

-- Thể loại Comedy (id = 2) có 3 phim
(2, 105),
(2, 106),
(2, 107),

-- Thể loại Drama (id = 3) có 2 phim
(3, 108),
(3, 109),

-- Các thể loại khác có 1 phim
(4, 110),
(5, 111),
(6, 112),
(7, 113);


SELECT 
    c.name AS category_name,
    COUNT(fc.film_id) AS total_films
FROM 
    category c
INNER JOIN 
    film_category fc ON c.category_id = fc.category_id
GROUP BY 
    c.name
ORDER BY 
    total_films DESC;