/*
what are the most optimal skills to learn (high in demand and high paying)
-identify skills in high demand and associated with high average salaries for Data Aanalysts role
-concentrates on remote positions with specified salaries
-why? targets skills that offer job security and finanacial benefits
    offering strategic insights for career development in data analysis
    */


WITH skills_in_demand AS (
SELECT 
     skills.skill_id,
     skills.skills,
     count(job_skills.job_id) AS count_in_demand
FROM job_posting
JOIN job_skills ON job_posting.job_id = job_skills.job_id
JOIN skills ON job_skills.skill_id = skills.skill_id
WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL AND
      job_work_from_home = True
GROUP BY skills.skill_id, skills.skills
), average_salary AS(
SELECT 
     job_skills.skill_id,
     ROUND(AVG(CAST(salary_year_avg AS DECIMAL(10,2))), 0) AS avg_salary
FROM job_posting
JOIN job_skills ON job_posting.job_id = job_skills.job_id
JOIN skills ON job_skills.skill_id = skills.skill_id
WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL AND 
      job_work_from_home = 'True'
GROUP BY job_skills.skill_id,skills.skills
)
SELECT 
      skills_in_demand.skill_id,
      skills_in_demand.skills,
      count_in_demand,
      avg_salary
FROM skills_in_demand
JOIN average_salary ON skills_in_demand.skill_id = average_salary.skill_id
WHERE count_in_demand > 10
ORDER BY 
         avg_salary DESC,
         count_in_demand DESC
LIMIT 30

--optional

SELECT
      skills.skill_id,
      skills.skills,
      COUNT(job_skills.job_id) AS count_in_demand,
      ROUND(AVG(CAST(salary_year_avg AS DECIMAL(10,2))), 0) AS avg_salary
FROM job_posting
JOIN job_skills ON job_posting.job_id = job_skills.job_id
JOIN skills ON job_skills.skill_id = skills.skill_id
WHERE
      job_title_short = 'Data Analyst'
      AND salary_year_avg IS NOT NULL
      AND job_work_from_home = True
GROUP BY
      skills.skill_id, skills.skills
HAVING
      COUNT(job_skills.job_id)>10
ORDER BY
      avg_salary DESC,
      count_in_demand DESC
LIMIT 30;