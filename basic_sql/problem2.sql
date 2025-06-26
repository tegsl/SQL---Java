SELECT CS.name AS "name", 
	FS1.flight_num AS f1_flight_num, 
	FS1.origin_city AS f1_origin_city, 
	FS1.dest_city AS f1_dest_city, 
	FS1.actual_time AS f1_actual_time, 
	FS2.flight_num AS f2_flight_num, 
	FS2.origin_city AS f2_origin_city, 
	FS2.dest_city AS f2_dest_city, 
	FS2.actual_time AS f2_actual_time, 
	FS1.actual_time + FS2.actual_time AS actual_time

FROM    FLIGHTS AS FS1, FLIGHTS AS FS2, CARRIERS AS CS, MONTHS AS MS, WEEKDAYS AS WS
WHERE FS1.month_id = MS.mid AND FS2.month_id = MS.mid AND
      FS1.day_of_month = 15 AND FS2.day_of_month = 15 AND
      MS.month = "July" AND FS1.day_of_month = FS2.day_of_month AND FS1.day_of_week_id = FS2.day_of_week_id AND
      FS1.origin_city = "Seattle WA" AND
      FS1.dest_city = FS2.origin_city AND
      FS2.dest_city = "Boston MA" AND
      FS1.carrier_id = FS2.carrier_id AND
      (FS1.actual_time + FS2.actual_time) < 420
GROUP BY FS1.flight_num, FS2.flight_num
;
