WITH GOODFLIGHTS AS
  (SELECT FS0.origin_city, MAX(FS0.actual_time) as time_max
   FROM flights AS FS0 
   WHERE FS0.canceled = 0
   GROUP BY FS0.origin_city)
SELECT FS.origin_city as city
FROM flights AS FS, GOODFLIGHTS AS GF
WHERE FS.origin_city = GF.origin_city
GROUP BY FS.origin_city, GF.time_max
HAVING 240 > GF.time_max
ORDER BY FS.origin_city ASC
;