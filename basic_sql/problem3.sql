SELECT WS.day_of_week AS day_of_week, AVG(FS.arrival_delay) AS "delay"
FROM WEEKDAYS AS WS, FLIGHTS AS FS
WHERE FS.day_of_week_id = WS.did
GROUP BY FS.day_of_week_id
ORDER BY "delay" DESC
LIMIT 1
;