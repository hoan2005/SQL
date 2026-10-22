SELECT 
    title,
    release_year,
    length,
    rental_rate,
    rating
FROM film
WHERE rating = 'PG-13'                  -- Lọc phim có nhãn PG-13
  AND length > 120                      -- Thời lượng dài hơn 120 phút
  AND rental_rate > 2.99                -- Giá thuê cao hơn 2.99
ORDER BY length DESC                    -- Sắp xếp theo thời lượng giảm dần (dài nhất trước)
LIMIT 10;                               -- Chỉ lấy ra đúng 10 bộ phim đứng đầu