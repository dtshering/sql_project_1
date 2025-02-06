/* what are top paying Data Analyst job?
-Identify the top 10 highest paying role that are remotely available?
-focuses on job posting with specified salaries(remove nulls)
-highlight the top paying opportunities for Data Analyst offering insights into employmet
*/
USE luke;

SELECT job_id,
       job_title_short,
       job_title,
       job_location,
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
LIMIT 15;


