use covid_data;
SELECT * from covid_details;
DESCRIBE covid_details;

#checking for null values
SELECT COUNT(*)
FROM covid_details
WHERE center_id IS NOT NULL OR
name IS NOT NULL OR
address IS NOT NULL OR
state_name IS NOT NULL OR
district_name IS NOT NULL OR
block_name IS NOT NULL OR
pincode IS NOT NULL OR
'from' IS NOT NULL OR
'to' IS NOT NULL OR
lat IS NOT NULL OR
'long' IS NOT NULL OR
fee_type IS NOT NULL OR
session_id IS NOT NULL OR
date IS NOT NULL OR
available_capacity IS NOT NULL OR
available_capacity_dose1 IS NOT NULL OR
available_capacity_dose2 IS NOT NULL OR
fee IS NOT NULL OR
allow_all_age IS NOT NULL OR
min_age_limit IS NOT NULL OR
vaccine IS NOT NULL OR
max_age_limit IS NOT NULL; 

#changing datatype of date column to date

ALTER TABLE COVID_DETAILS MODIFY COLUMN DATE DATE;
UPDATE COVID_DETAILS SET DATE = STR_TO_DATE(DATE, '%d-%m-%Y');

#changing datatype of allowallage to boolean

alter table covid_details modify column allow_all_age BOOLEAN; 

select distinct allow_all_age from covid_details;

UPDATE covid_details
SET allow_all_age = CASE
    WHEN allow_all_age = 'TRUE' THEN 1
    WHEN allow_all_age = 'FALSE' THEN 0
    ELSE NULL
END;

describe COVID_DETAILS;

#assiging unique constrain to session id

SELECT DISTINCT(session_id) FROM covid_details;
alter table covid_details add constraint usi UNIQUE(session_id(255));

SELECT * FROM COVID_DETAILS ;

#replaceing na values in maxgaelimit column

SELECT DISTINCT(max_age_limit) FROM covid_details;
UPDATE covid_details set max_age_limit = 'no age limit'
where max_age_limit = 'NA';

#changing datatype of from column to time
alter table covid_details add column newfrom TIME; 
UPDATE covid_details SET newfrom = CAST(`from` AS TIME);
ALTER TABLE COVID_DETAILS DROP COLUMN `from`;
alter table covid_details rename column newfrom to `from`;

#changing datatype of to column to time
alter table covid_details rename column `to` to oldto;
alter table covid_details add column `to` time;
update covid_details set `to` = cast(oldto as time);
alter table covid_details drop column oldto;

select distinct(fee_type) from covid_details;
select * from covid_details;
describe covid_details ;

#how many centers are established to conduct this vaccine campaign
select count(distinct center_id) as total_centers from covid_details  ;
#124

# what are the areas where camps are conducted
select distinct block_name from covid_details
order by block_name ;
# 12 areas (Adyar,Alandur,Ambattur,Anna Nagar,Kodambakkam,Madhavaram,Perungudi,Sholinganallur,Teynampet,Tondiarpet,TVK Nagar bv,Valasaravakkam)

# how many free and how many paid

#paid

select count(fee) as no_of_paid_session from covid_details
where fee <> 0 ;

#free
select count(fee) as no_of_free_session from covid_details
where fee = 0 ;
#185 free session and 1149 paid session

#how many sessions were conducted
select count(DISTINCT session_id) as total_sessions from covid_details;
#1334 sessions

#most sessions conducted date
select `date` , count(session_id) as total_session from covid_details
GROUP BY `date`
order by total_session desc
limit 1 ;
#137 sessions on 2021-08-28

#most used vaccine
select vaccine,count(vaccine) as totalcount from covid_details
GROUP BY vaccine
order by totalcount desc;
#covishield with 856 count

#total days of camp
select count(DISTINCT `date`) from covid_details;

# top 5 busiest center
select center_id,`name`,count(session_id) as total_count from covid_details
group by center_id,`name`
order by total_count desc
limit 5; 
#Kavery Hospital - WP,Fortis Hospitals Vadapalani,Rainbow Childrens Medicare,Vijaya Health Centre,Fortis Malar Hospital	

#start date end date
select min(`date`) as start_date,max(`date`) as end_date from covid_details;
#21-08-2021	to 01-09-2021

# available capacity is 0 in date and centre wise
select `name`,`date` from covid_details
where available_capacity = 0
group by `name`,`date`
order by `date`;

#total does1 capacity, higest capacity of does1
select sum(available_capacity_dose1) as total_does1_capacity,
max(available_capacity_dose1) as higest_capacity_of_does1
from covid_details;
#total:64349	highest:498

#total does2 capacity, higest capacity of does2
select sum(available_capacity_dose2) as total_does2_capacity,
max(available_capacity_dose2) as higest_capacity_of_does2
from covid_details;
#total:59821	highest:493

#highest fee , total fee
select max(fee) as highest_fee,
sum(fee) as total_fee
from covid_details;
#highest:1410	total:1115595

#avg num of hours per day
ALTER TABLE covid_details
ADD COLUMN total_hours_difference INT;
UPDATE covid_details
SET total_hours_difference = TIMESTAMPDIFF(HOUR, `from`, `to`);
select avg(total_hours_difference) as average_hours_per_day from covid_details;
#5.5 hours

#area which conducted the highest number of session
select block_name , count(session_id) as no_of_sessions from covid_details
group by block_name
order by no_of_sessions desc
limit 1 ;