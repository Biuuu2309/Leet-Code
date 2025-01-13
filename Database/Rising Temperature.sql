SELECT W1.id AS Id
FROM Weather W1
LEFT JOIN Weather WPrev 
    ON W1.id = WPrev.id + 1 
   AND (
       YEAR(W1.recordDate) > YEAR(WPrev.recordDate) OR
       (YEAR(W1.recordDate) = YEAR(WPrev.recordDate) AND MONTH(W1.recordDate) > MONTH(WPrev.recordDate)) OR
       (YEAR(W1.recordDate) = YEAR(WPrev.recordDate) AND MONTH(W1.recordDate) = MONTH(WPrev.recordDate) AND DAY(W1.recordDate) > DAY(WPrev.recordDate))
   )
LEFT JOIN Weather WNext 
    ON W1.id = WNext.id - 1 
   AND (
       YEAR(W1.recordDate) > YEAR(WNext.recordDate) OR
       (YEAR(W1.recordDate) = YEAR(WNext.recordDate) AND MONTH(W1.recordDate) > MONTH(WNext.recordDate)) OR
       (YEAR(W1.recordDate) = YEAR(WNext.recordDate) AND MONTH(W1.recordDate) = MONTH(WNext.recordDate) AND DAY(W1.recordDate) > DAY(WNext.recordDate))
   )
WHERE (W1.temperature > WPrev.temperature AND WPrev.id IS NOT NULL)
   OR (W1.temperature > WNext.temperature AND WNext.id IS NOT NULL);
