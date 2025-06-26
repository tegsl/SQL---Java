WITH FLIGHTSOUT AS
  (SELECT DISTINCT FS0.origin_city, FS0.dest_city
   FROM flights AS FS0 
   WHERE FS0.dest_city != 'Seattle WA' AND FS0.origin_city = 'Seattle WA'),
   FLIGHTSOUTIN AS
  (SELECT DISTINCT FS1.origin_city, FS1.dest_city
   FROM flights as FS1, FLIGHTSOUT AS FS0
   WHERE FS1.dest_city != 'Seattle WA' AND FS1.origin_city != 'Seattle WA'
   AND FS0.dest_city = FS1.origin_city),
   FLIGHTSIN AS
  (SELECT DISTINCT FS2.origin_city, FS2.dest_city
    FROM flights as FS2, FLIGHTSOUTIN as FS1
    WHERE FS2.dest_city != 'Seattle WA' AND FS2.origin_city != 'Seattle WA'
    AND FS2.origin_city = FS1.dest_city)
SELECT DISTINCT FI.dest_city AS city
FROM FLIGHTSIN AS FI
WHERE FI.dest_city NOT IN(SELECT dest_city FROM FLIGHTSOUT) 
AND   FI.dest_city NOT IN(SELECT dest_city FROM FLIGHTSOUTIN)
ORDER BY FI.dest_city ASC
;
