use university;

WITH RECURSIVE PrerequisiteCourses AS (
    SELECT p.prereq_id AS course_id, c.title, c.dept_name AS department, c.credits
    FROM prereq p
    JOIN course c ON p.prereq_id = c.course_id
    WHERE p.course_id = 'CS-347'
    UNION ALL
    SELECT p.prereq_id AS course_id,c.title,c.dept_name AS department,c.credits
    FROM prereq p
    JOIN course c ON p.prereq_id = c.course_id
    JOIN PrerequisiteCourses pc ON p.course_id = pc.course_id
)
SELECT *
FROM PrerequisiteCourses;


SELECT s.course_id, c.title, COUNT(*) AS number_of_sections
FROM section s
JOIN course c ON s.course_id = c.course_id
WHERE s.semester = 'Spring'
GROUP BY s.course_id, c.title
ORDER BY number_of_sections DESC
LIMIT 1;

SELECT DISTINCT t1.course_id
FROM takes t1
WHERE 5 > (
    SELECT COUNT(DISTINCT t2.course_id)
    FROM takes t2
    WHERE (
        SELECT COUNT(*) FROM takes t3 WHERE t3.course_id = t2.course_id
    ) > (
        SELECT COUNT(*) FROM takes t3 WHERE t3.course_id = t1.course_id
    )
);

SELECT c.course_id, c.title
FROM course c
WHERE NOT EXISTS (
    SELECT 1
    FROM section s
    WHERE s.course_id = c.course_id
);

SELECT *
FROM student
WHERE tot_cred > (
    SELECT AVG(tot_cred)
    FROM student
);

SELECT t.course_id, t.sec_id, t.semester, t.year
FROM teaches t
WHERE EXISTS (
    SELECT 1
    FROM instructor i
    WHERE i.ID = t.ID AND i.salary > (SELECT AVG(salary) FROM instructor)
);

SELECT t.course_id, t.sec_id, t.semester, t.year
FROM teaches t
WHERE t.ID IN (
    SELECT i.ID
    FROM instructor i
    WHERE i.salary > (
        SELECT AVG(salary)
        FROM instructor
    )
);





