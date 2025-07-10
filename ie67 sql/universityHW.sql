use university;

select max(salary) as maximum_salary, dept_name from instructor group by dept_name

select * from takes tak join teaches tea on tak.course_id = tea.course_id join instructor i on i.ID = tea.ID

select distinct takes.id from takes join teaches on takes.course_id = teaches.course_id and takes.sec_id = teaches.sec_id join instructor on teaches.id = instructor.id where instructor.name = 'Katz'

select distinct course.course_id, course.title from course join section on course.course_id = section.course_id join time_slot on section.time_slot_id = time_slot.time_slot_id where course.dept_name = 'Comp. Sci.' and time_slot.end_hr >= 12

select prereq.prereq_id, course.title
from prereq
join course on prereq.prereq_id = course.course_id
where prereq.course_id = 'CS-315'

select takes.course_id, takes.sec_id, count(takes.ID) as students_Num
from takes
where takes.semester = 'Spring' and takes.year = 2017
group by takes.course_id, takes.sec_id

select section.course_id, section.sec_id, count(takes.ID) AS students_Num
from section
left join takes on section.course_id = takes.course_id
               and section.sec_id = takes.sec_id
               and section.semester = takes.semester
               and section.year = takes.year
where section.semester = 'Spring' and section.year = 2017
group by section.course_id, section.sec_id

select student.ID, student.name
from student
where student.dept_name = 'History'
and not exists (
    select *
    from takes
    join course on takes.course_id = course.course_id
    where takes.ID = student.ID
    and course.dept_name = 'Music'
)


select instructor.ID, instructor.name
from instructor
where not exists (
    select *
    from teaches
    join takes on teaches.course_id = takes.course_id
        and teaches.sec_id = takes.sec_id
        and teaches.semester = takes.semester
        and teaches.year = takes.year
    where teaches.ID = instructor.ID
    and takes.grade = 'A'
)


insert into course values ('CS-001', 'Weekly Seminar', 'Comp. Sci.', 2)

INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id)
VALUES ('CS-001', '1', 'Spring', 2022, NULL, NULL, NULL);

INSERT INTO takes (ID, course_id, sec_id, semester, year)
SELECT ID, 'CS-001', '1', 'Spring', 2022
FROM student
WHERE dept_name = 'Comp. Sci.';

DELETE FROM takes
WHERE course_id = 'CS-001' AND sec_id = '1' AND semester = 'Spring' AND year = 2022 AND ID = '12345';


