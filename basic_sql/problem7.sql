SELECT SUM(FS.capacity) AS capacity
FROM FLIGHTS AS FS, MONTHS AS MS
WHERE MS.mid = FS.month_id AND
      ((FS.origin_city = "Seattle WA" AND FS.dest_city = "San Francisco CA") OR
      (FS.origin_city = "San Francisco CA" AND FS.dest_city = "Seattle WA")) AND 
      MS.month = "July" AND
      FS.day_of_month = 10
;