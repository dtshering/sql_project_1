/* what skills are required for the top-paying data analust jobs?
     -use the top 10 highest-paying Data Analyst jobs form first query
     -Add the specific skills required for these roles
     -why? it provides a detailed look at whichskills to develop that align with top salaries*/

--use CTE--

WITH top_paying_job AS (
SELECT job_id,
       job_title,
       salary_year_avg,
       name AS company_name
FROM job_posting 
LEFT JOIN company  ON job_posting.company_id=company.company_id
WHERE job_title_short = 'Data Analyst'  AND 
      job_location = 'Anywhere' AND 
      salary_year_avg IS NOT NULL
      AND TRIM(salary_year_avg)<> '' /*is done because this variable is stored as text*/
ORDER BY 
      salary_year_avg DESC
LIMIT 10
)
SELECT 
    top_paying_job.*,
    skills
FROM top_paying_job
JOIN job_skills ON top_paying_job.job_id = job_skills.job_id
JOIN skills ON job_skills.skill_id = skills.skill_id
ORDER BY salary_year_avg DESC
LIMIT 10

/*Excel (7 mentions) and SQL (6 mentions) are the top skills required, highlighting their importance for high-paying Data Analyst roles.
Python (4 mentions) is also highly sought after, reinforcing its relevance in analytics.
R (3 mentions), Tableau (3 mentions), and Power BI (3 mentions) indicate a demand for statistical computing and visualization tool

