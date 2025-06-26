SELECT DISTINCT FS.flight_num AS flight_num
FROM   FLIGHTS AS FS, CARRIERS AS CS, WEEKDAYS AS WS
WHERE  FS.carrier_id = CS.cid AND
       FS.day_of_week_id = WS.did AND
       FS.origin_city = "Seattle WA" AND 
       FS.dest_city = "Boston MA" AND 
       CS.name = "Alaska Airlines Inc." AND 
       WS.day_of_week = "Monday"
;