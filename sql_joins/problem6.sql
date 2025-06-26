SELECT DISTINCT CS.name AS carrier
FROM carriers AS CS
WHERE CS.cid IN (
  SELECT FS.carrier_id
  FROM flights as FS
  WHERE dest_city = 'New York NY' AND FS.origin_city = 'Seattle WA' 
)
ORDER BY CS.name ASC
;