/* Write your PL/SQL query statement below */

WITH SoldInQ1 AS (
    SELECT DISTINCT p.product_id, p.product_name
    FROM Product p
    JOIN Sales s ON p.product_id = s.product_id
    WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
),
SoldOutsideQ1 AS (
    SELECT DISTINCT p.product_id
    FROM Product p
    JOIN Sales s ON p.product_id = s.product_id
    WHERE s.sale_date < '2019-01-01' OR s.sale_date > '2019-03-31'
)
SELECT sq.product_id, sq.product_name
FROM SoldInQ1 sq
LEFT JOIN SoldOutsideQ1 soq ON sq.product_id = soq.product_id
WHERE soq.product_id IS NULL;
