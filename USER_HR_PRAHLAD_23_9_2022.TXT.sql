select emp.employee_id,emp.first_name,emp.department_id,emp.salary,dept.department_name from employees emp inner join departments dept on emp.department_id=dept.department_id
inner join
(select e.employee_id,e.first_name,e2.first_name as manager_name from employees e join employees e2 on e.employee_id=e2.manager_id)  man
on man.employee_id=emp.employee_id ;

