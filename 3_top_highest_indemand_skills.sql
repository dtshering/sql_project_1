/*
what are the most in-demand skills for data analysts?
-join job postings to inner join table similar to query 2
-identify the top 5 in-demand skills for a data analyst.
-focus on all job postings.
why? Retrieves the top 5 skills with the higest demand in the job market,
    providing insights into the most valuable skills for job seekers.
    */

SELECT 
     skills,
     count(job_skills.job_id) AS count_in_demand
FROM job_posting
JOIN job_skills ON job_posting.job_id = job_skills.job_id
JOIN skills ON job_skills.skill_id = skills.skill_id
WHERE job_title_short = 'Data Analyst' AND
      job_work_from_home = 'True'
GROUP BY skills
ORDER BY count_in_demand DESC
LIMIT 5