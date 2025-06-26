SELECT DISTINCT CS.name as "name"
FROM CARRIERS AS CS, FLIGHTS AS FS
WHERE CS.cid = FS.carrier_id
GROUP BY FS.month_id, FS.day_of_month, FS.carrier_id
HAVING COUNT(FS.carrier_id) > 1000
;