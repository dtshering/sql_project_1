/*
what are the top skills based on salary?
-look at the average salary associated with each skill for Data Analyst positions
-focuses on roles with specified salaries, regardless of location
-why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most fainancially rewarding skills to acquire or improve
    */

SELECT 
     skills,
     round(avg(salary_year_avg),0) AS avg_salary
FROM job_posting
JOIN job_skills ON job_posting.job_id = job_skills.job_id
JOIN skills ON job_skills.skill_id = skills.skill_id
WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL
       -- AND job_work_from_home = 'True'
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 50

/* AI and Data Science Skills Pay the Most – Jobs that require machine learning and big data tools offer higher salaries.
Cloud and Large Databases Are in Demand – Companies value skills in handling large amounts of data and cloud storage.
Some Rare Skills Pay Surprisingly Well – Niche skills like blockchain, old software tools, and data privacy rules can lead to high salaries. */