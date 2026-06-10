-- 1. Show all data
show tables;

-- 2. Show only age, gender, stress level
select age, gender, stress_level from teen_mental_health
order by age;

-- 3. Find students with stress level greater than 7
select * from teen_mental_health
where stress_level > 7;

-- 4. Find female students using Instagram
select * from teen_mental_health
where platform_usage = "Instagram" or platform_usage = "All Platforms"
order by platform_usage;

-- 5. Count total students
select count(*) as total_student 
from teen_mental_health;

-- 6. Average sleep hours
select round(avg(sleep_hours), 02) as avg_salary 
from teen_mental_health;

-- 7. Maximum addiction level
select max(addiction_level) as Maximum_addiction_level
from teen_mental_health;

-- 8. Minimum academic performance
select min(academic_performance) as min_academic_performace
from teen_mental_health;

-- 9. Count students by gender
select gender, count(*) as total
from teen_mental_health
group by gender;

-- 10. Average stress level by platform
select platform_usage, round(avg(stress_level), 02) as avg_stress_level
from teen_mental_health
group by platform_usage;

-- 11. Platforms where average addiction level is greater than 5
select platform_usage, avg(addiction_level) as avg_add_level 
from teen_mental_health
group by platform_usage
having avg_add_level > 5;

-- 12. Sleep quality having more than 100 students
select sleep_quality, count(*) as total from teen_mental_health
group by sleep_quality
having total > 100;

-- 13. Top 10 students with highest risk score
select * from teen_mental_health
order by mental_health_risk_score desc
limit 10;

-- 14. Lowest sleep hours students
select * from teen_mental_health
order by sleep_hours asc
limit 1;

-- 15. Categorize stress level
select stress_level, count(*) total 
from teen_mental_health
group by stress_level;

-- 16. Rank students by addiction level
select *, row_number() over (order by addiction_level desc) as Roll_Number
from teen_mental_health;

-- 17. Running average of mental health risk score
select *, avg(mental_health_risk_score) over (order by age) as running_avg
from teen_mental_health;
-- 18. Highest academic performer by gender
select gender, max(academic_performance) as high
from teen_mental_health
group by gender;

-- 19. Students having above average stress level
select * from teen_mental_health
where stress_level > (select avg(stress_level) from teen_mental_health);

-- 20. Students with highest addiction level
select * from teen_mental_health
where addiction_level = (select max(addiction_level) from teen_mental_health);

-- 21. Which platform has highest average anxiety?
select platform_usage, avg(anxiety_level) as avg_anxiety
from teen_mental_health
group by platform_usage
order by avg_anxiety desc
limit 1;

-- 22. Find students sleeping less than 5 hours and stress > 7
select * from teen_mental_health
where sleep_hours > 5 and stress_level > 7;

-- 23. Average academic performance by sleep quality
select sleep_quality, round(avg(academic_performance), 02) as avg_aca_performance
from teen_mental_health
group by sleep_quality;

-- 24. Count depressed students
select count(*) as total_depressed_student from teen_mental_health
where depression_label = 1;

-- 25. Find correlation-type analysis

-- 26. Find top 3 highest risk students from each gender
select * from teen_mental_health;
-- 27. Find duplicate records

-- 28. Percentage of depressed students
select round(count(case when depression_label = 1 then 1 end)*100 / count(*),02) as percentage_dep_student
from teen_mental_health;

-- 29. Find platform with highest average risk score
select platform_usage, avg(mental_health_risk_score) as highest_avg
from teen_mental_health
group by platform_usage
order by highest_avg desc
limit 1;

-- 30. Compare male vs female average stress
select gender, avg(stress_level) from teen_mental_health
group by gender;

-- Find whether high screen time affects academic performance.
SELECT 
    CASE 
        WHEN daily_social_media_hours >= 5 THEN 'High Screen Time'
        ELSE 'Low Screen Time'
    END AS screen_time_category,
    AVG(academic_performance) AS avg_academic_score
FROM teen_mental_health
GROUP BY screen_time_category;

-- Which sleep quality group has highest mental health risk?
select sleep_quality, avg(mental_health_risk_score) as highest
from teen_mental_health
group by sleep_quality
order by highest desc
limit 1;

-- Find highly addicted students with poor sleep.