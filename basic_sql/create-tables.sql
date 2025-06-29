PRAGMA foreign_keys=ON;

CREATE TABLE FLIGHTS (fid int, 
         month_id int REFERENCES MONTHS(mid),        -- 1-12
         day_of_month int,    -- 1-31 
         day_of_week_id int REFERENCES WEEKDAYS(did),  -- 1-7, 1 = Monday, 2 = Tuesday, etc
         carrier_id varchar(7) REFERENCES CARRIERS(cid), 
         flight_num int,
         origin_city varchar(34), 
         origin_state varchar(47), 
         dest_city varchar(34), 
         dest_state varchar(46), 
         departure_delay int, -- in mins
         taxi_out int,        -- in mins
         arrival_delay int,   -- in mins
         canceled int,        -- 1 means canceled
         actual_time int,     -- in mins
         distance int,        -- in miles
         capacity int, 
         price int,            -- in $
         PRIMARY KEY (fid)            
         )
;

CREATE TABLE CARRIERS (cid varchar(7), name varchar(83), PRIMARY KEY (cid));
CREATE TABLE MONTHS (mid int, month varchar(9), PRIMARY KEY (mid));
CREATE TABLE WEEKDAYS (did int, day_of_week varchar(9), PRIMARY KEY (did));
