SELECT DISTINCT CS.name AS carrier
FROM carriers AS CS, flights as FS
WHERE CS.cid = FS.carrier_id AND
      FS.origin_city = 'Seattle WA' AND
      FS.dest_city = 'New York NY'
ORDER BY CS.name ASC
;