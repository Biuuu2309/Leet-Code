DELETE P1
FROM Person P1
JOIN (
    SELECT MIN(id) AS keep_id, email
    FROM Person
    GROUP BY email
) P2
ON P1.email = P2.email AND P1.id != P2.keep_id;
