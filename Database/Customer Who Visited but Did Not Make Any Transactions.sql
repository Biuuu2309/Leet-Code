SELECT customer_id, count(*) AS count_no_trans
FROM Visits
WHERE Visits.visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY customer_id 