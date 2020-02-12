1. SELECT firstName, lastName, branches.name AS branchName from Employees 
JOIN branch_employee ON (employees.id = branch_employee.employee_id)
JOIN branches ON (branches.id = branch_employee.branch_id)
WHERE rank_id = (SELECT id FROM ranks WHERE name = "junior") AND id IN (SELECT id FROM branches 
JOIN branch_employee ON (branches.id = branch_employee.branch_id)
WHERE name IN ("QC", "Ortigas")) ;

2. UPDATE employees SET salary += 1000
	WHERE id IN (
	SELECT id FROM employees
	JOIN roles ON (employees.role_id = roles.id)  
	JOIN department_employees ON (employees.id = department_employee.employee_id)
	JOIN departments ON (department_employee.department_id = departments.id)
	WHERE role_id = 
 (SELECT id FROM roles WHERE name = "superadmin") 
 AND department_employee.department_id IN (SELECT id FROM departments WHERE name = ALL ("IT","HR" )));