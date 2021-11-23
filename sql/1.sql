SELECT t2.name,COUNT(t1.trip) AS COUNT
FROM Pass_in_trip AS t1
INNER JOIN Passenger AS t2
ON t2.id = t1.passenger
GROUP BY t1.passenger
HAVING COUNT(t1.passenger) >= 1
ORDER BY COUNT(t1.passenger) DESC, t2.name ASC