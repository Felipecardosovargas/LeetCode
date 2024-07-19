/* Write your PL/SQL query statement below */

WITH ParentNodes AS (
    SELECT DISTINCT p_id
    FROM Tree
    WHERE p_id IS NOT NULL
),
LeafNodes AS (
    SELECT id
    FROM Tree
    MINUS
    SELECT DISTINCT p_id AS id
    FROM Tree
    WHERE p_id IS NOT NULL
),
InnerNodes AS (
    SELECT DISTINCT p_id AS id
    FROM Tree
    WHERE p_id IS NOT NULL
),
RootNodes AS (
    SELECT id
    FROM Tree
    WHERE p_id IS NULL
)

SELECT id,
       CASE
           WHEN id IN (SELECT id FROM RootNodes) THEN 'Root'
           WHEN id IN (SELECT id FROM InnerNodes) THEN 'Inner'
           ELSE 'Leaf'
       END AS type
FROM Tree
ORDER BY id;
