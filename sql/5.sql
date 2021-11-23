WITH date_table AS (SELECT date AS dt1,   --Здесь создаем интервалы из таблицы Income_o
LEAD(date) OVER(ORDER BY date) AS dt2
FROM Income_o AS t1),
 
out_table AS (SELECT *                    --Здесь добавляем колонку out из Outcome_o
FROM Outcome_o                                  
OUTER APPLY                                        
(SELECT date_table.dt1,date_table.dt2
FROM date_table) X
WHERE (Outcome_o.date > X.dt1 AND Outcome_o.date <= X.dt2)) 


SELECT COALESCE(SUM(out), 0) AS qty, date_table.dt1,date_table.dt2
FROM out_table
RIGHT OUTER JOIN date_table ON date_table.dt1 = out_table.dt1       --Джоин для того,чтоб вывелись интервалы, где сумма = 0
WHERE date_table.dt1!=date_table.dt2 AND (date_table.dt2 IS NOT NULL)
GROUP BY date_table.dt1,date_table.dt2