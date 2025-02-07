-- cau 2
SELECT 
    e.student_id, 
    s.name AS student_name, 
    s.email, 
    c.course_name, 
    e.enrollment_date
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.student_id IN (
    SELECT student_id 
    FROM enrollments 
    GROUP BY student_id 
    HAVING COUNT(course_id) > 1
)
ORDER BY e.student_id ASC, e.enrollment_date ASC;
-- cau 3
SELECT 
    s.name AS student_name, 
    s.email, 
    e.enrollment_date, 
    c.course_name, 
    c.fee
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.course_id IN (
    SELECT e1.course_id 
    FROM enrollments e1
    JOIN students s1 ON e1.student_id = s1.student_id
    WHERE s1.name = 'Nguyen Van An'
)
AND s.name <> 'Nguyen Van An'
ORDER BY c.course_name, e.enrollment_date;
-- cau 4
SELECT 
    c.course_name, 
    c.duration, 
    c.fee, 
    COUNT(e.student_id) AS total_students
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_id, c.course_name, c.duration, c.fee
HAVING COUNT(e.student_id) > 2
ORDER BY total_students DESC;
-- cau 5
select 
	s.student_id,
    s.name as student_name,
    s.email,
    sum(c.fee) as total_fee_paid,
    count(e.course_id) as courses_count 
from students s
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id
group by s.student_id, s.name, s.email
having courses_count >= 2 
and min(c.duration) > 30;
