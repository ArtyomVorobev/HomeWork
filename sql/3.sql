SELECT DISTINCT t1.*
FROM Rooms AS t1
JOIN Reservations AS t2
    ON t1.id=t2.room_id
WHERE WEEK(start_date, 1) = 12 AND YEAR(start_date)=2020;