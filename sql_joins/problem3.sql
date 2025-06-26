SELECT FS.origin_city,  COALESCE(100.0 * SUM(CASE WHEN FS.actual_time < 90 THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 0) AS percentage  -- had to look up how to convert boolean to a number, kept getting syntax errors when I tried. Also looked at ed and they recommended to use NULLIF and COALESCE
FROM flights AS FS
WHERE FS.canceled = 0
GROUP BY FS.origin_city
ORDER BY percentage ASC, FS.origin_city ASC
;