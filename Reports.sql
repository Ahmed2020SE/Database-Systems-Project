--car and its violation description and fine amount of every violation
select Plate_number,Description,Fine_amount,Payed from Traffic_violation t,Violations v where t.violation_code=v.code;
--R1←(Traffic_Violations) t ⨝ t.violation_code=v.code (Violations) v
--π Plate_number,Description,Fine_amount,Payed(R1)
-------------------------------------------------------------------------------------------
--Car driver and his traffic department name and location
select full_name,Car_plate_number,Type,Name,Location from Driver d,Cars c,Traffic_Department t where d.Car_plate_number=c.plate_number and  d.Traffic_department_code=t.code;
--R1←(Driver) d ⨝ d.Car_plate_number=c.plate_number (Cars) c
--R2←(R1) ⨝ R1.Traffic_department_code=t.code (Traffic_Department) t
--π full_name,Car_plate_number,Type,Name,Location (R2)
-------------------------------------------------------------------------------------------
--count of of violation of every car and total fine amount
select  CAR_PLATE_NUMBER,count(Violation_code),sum(Fine_amount) from Cars c,Traffic_violation t,Violations v where t.Violation_code=v.code and t.Car_plate_number=c.Plate_number GROUP BY CAR_PLATE_NUMBER ;
--R1←(Traffic_violation) t ⨝ t.Car_plate_number=c.plate_number (Cars) c
--R2←(R1) t ⨝ t.Violation_code=v.code (Violations) v
--(CAR_PLATE_NUMBER ) F count(Violation_code),sum(Fine_amount)  (R2)
--------------------------------------------------------------------------------------------
--the max and the minimum of the fine amount of every car
select CAR_PLATE_NUMBER,min(fine_amount),max(fine_amount) from violations v,traffic_violation t where t.violation_code=v.code GROUP BY CAR_PLATE_NUMBER;
--R1←(Traffic_violation) t ⨝ t.violation_code=v.code (Violations) v
--(CAR_PLATE_NUMBER ) F min(fine_amount),sum(fine_amount)  (R1)
-------------------------------------------------------------------------------------------
--check the average speed of the road that the radar take the violation from.
select Direction,Address,Average_speed from traffic_violation t,radar r,roads o where t.radar_code=r.code and r.Road_code=o.code;
--R1←(Traffic_violation) t ⨝  t.radar_code=r.code (radar) r
--R2←(R1) r ⨝  r.Road_code=o.code (roads) o
--π Direction,Address,Average_speed (R2)