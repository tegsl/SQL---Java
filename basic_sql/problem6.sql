SELECT CS.name AS "name", MAX(FS.price) AS "max_price"
FROM CARRIERS AS CS, FLIGHTS AS FS
WHERE (((FS.origin_city = "Seattle WA" AND
      FS.dest_city = "New York NY") OR
      (FS.origin_city = "New York NY" AND
      FS.dest_city = "Seattle WA")) AND
      CS.cid = FS.carrier_id)
GROUP BY 
    CS.name
;