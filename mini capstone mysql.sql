it and hr

update employees set salary += 1000 where role_id = 3
(select firstName, lastName from employees where employee_id = 
(select employee_id from department_employee where department_id =
(select id from departments where name in ("hr", "it"))));


-- bonus
-- 6)
delete from employees where role_id = 3
