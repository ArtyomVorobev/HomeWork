WITH count_table AS (SELECT classroom,COUNT(*) AS pair_num
FROM Schedule
GROUP BY classroom )
SELECT classroom 
FROM count_table
WHERE pair_num = (SELECT MAX(pair_num) FROM count_table)