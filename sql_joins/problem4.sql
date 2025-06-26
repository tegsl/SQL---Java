WITH FLIGHTSOUT AS
  (SELECT DISTINCT FS0.origin_city, FS0.dest_city
   FROM flights AS FS0 
   WHERE FS0.dest_city != 'Seattle WA' AND FS0.origin_city = 'Seattle WA'),
   FLIGHTSIN AS
  (SELECT DISTINCT FS1.origin_city, FS1.dest_city
   FROM flights as FS1
   WHERE FS1.dest_city != 'Seattle WA' AND FS1.origin_city != 'Seattle WA')
SELECT DISTINCT FI.dest_city as city
FROM FLIGHTSIN AS FI, FLIGHTSOUT AS FO
WHERE FI.dest_city != 'Seattle WA' AND FI.origin_city = FO.dest_city
AND FI.dest_city NOT IN(SELECT FO.dest_city FROM FLIGHTSOUT AS FO)
ORDER BY FI.dest_city ASC
;
