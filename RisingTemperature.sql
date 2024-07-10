SELECT w1.id
FROM Weather w1
JOIN Weather w2 ON TRUNC(w1.recordDate) - TRUNC(w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;
