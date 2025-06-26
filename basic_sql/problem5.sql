SELECT DISTINCT CS.name, 100.0 * SUM(FS.canceled) / COUNT(*) AS "percentage"
FROM CARRIERS AS CS, FLIGHTS AS FS
WHERE CS.cid = FS.carrier_id AND
      FS.origin_city = "Seattle WA"
GROUP BY FS.carrier_id
HAVING 100.0 * SUM(FS.canceled) / COUNT(*) > 0.5
ORDER BY 100.0 * SUM(FS.canceled) / COUNT(*)
;