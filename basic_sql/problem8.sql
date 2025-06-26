SELECT CS.name AS name, SUM(FS.departure_delay) AS delay
FROM CARRIERS AS CS, FLIGHTS AS FS 
WHERE FS.carrier_id = CS.cid
GROUP BY CS.cid
;