/* first assignment of hr database*/

/*. Write a query to display the names (first_name, last_name) using alias name “First Name", "Last 
Name"*/
Select first_name as "First Name", last_name as "Last Name" from hr.employees;

/*2. Write a query to get unique department ID from employee table*/
select distinct(department_ID) 
from hr.employees
where department_ID is not null;

/*. Write a query to get all employee details from the employee table order by first name, descending*/
select * from hr.employees
order by first_name desc;

/*4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is 
calculated as 15% of salary)*/
select concat(first_name," ", last_name) as "names", salary, salary*0.15 as "PF" from hr.employees;

/*5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of 
salary*/
select employee_ID, concat(first_name," ",last_name) as "names",salary from hr.employees order by salary;

/*6. Write a query to get the total salaries payable to employees*/
select sum(salary) as "Total salary" from hr.employees;

/*7. Write a query to get the maximum and minimum salary from employees table*/
select min(salary) as "max_salary", min(salary) as "min salary" from hr.employees;

/*8. Write a query to get the average salary and number of employees in the employees table*/
select avg(salary) as "avg salary", count(*) as "no of employees" from hr.employees;

/*9. Write a query to get the number of employees working with the company*/
select count(*) as "no of employees" from hr.employees;

/*10. Write a query to get the number of jobs available in the employees table*/
select count(distinct(job_id)) as "no of jobs" from hr.employees;

/*11. Write a query get all first name from employees table in upper case*/
select upper(first_name) from hr.employees;

/*12. Write a query to get the first 3 characters of first name from employees table*/
select substring(first_name,1,3) as "first 3 characters" from hr.employees;

/*13. Write a query to get first name from employees table after removing white spaces from both side*/
select trim(first_name) from hr.employees;

/*v14. Write a query to get the length of the employee names (first_name, last_name) from employees table*/
select first_name as "First name", last_name as "Last name ",
length(first_name)+ length(last_name) as "length of employees" from hr.employees;

/*15. Write a query to check if the first_name fields of the employees table contains numbers*/
select * from hr.employees where first_name regexp '[0-9]';

/*16. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
not in the range $10,000 through $15,000*/
select concat(first_name," ", last_name) as " names ", salary from hr.employees
where salary not between 10000 and 15000;

/*17. Write a query to display the name (first_name, last_name) and department ID of all employees in 
departments 30 or 100 in ascending order*/
select concat(first_name," ", last_name) as "names" , department_id from hr.employees
where department_id  = 30 or department_id =100 order by department_id;

/*18. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
not in the range $10,000 through $15,000 and are in department 30 or 100*/
select concat(first_name, " " , last_name) as "names", salary from hr.employees
where salary not between 10000 and 15000 and 
department_id=30 or department_id = 100;

/*19. Write a query to display the name (first_name, last_name) and hire date for all employees who were 
hired in 1987*/
select concat(first_name," ", last_name) as "names", hire_date as "Hire date" from hr.employees
where year(hire_date) = 1987;

/*20. Write a query to display the first_name of all employees who have both "b" and "c" in their first name*/
select first_name from hr.employees
where first_name ="%b%" and first_name = "%c%";

/*21. Write a query to display the last name, job, and salary for all employees whose job is that of a 
Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000*/
select last_name,job_id, salary from hr.employees 
where job_id = "Programmer" or job_id = "Shipping Clerk" and
salary not in(4500,10000,15000);

/*22. Write a query to display the last name of employees whose names have exactly 6 characters*/
select last_name from hr.employees 
where length(last_name) = 6;

/*23. Write a query to display the last name of employees having 'e' as the third character*/
select last_name from hr.employees 
where last_name = "__e%";

/*24. Write a query to get the job_id and related employee's id
Partial output of the query : 
job_id Employees ID
AC_ACCOUNT206
AC_MGR 205
AD_ASST 200
AD_PRES 100
AD_VP 101 ,102
FI_ACCOUNT 110 ,113 ,111 ,109 ,112*/
select job_id, employee_id from hr.employees
where job_id = "AC_ACCOUNT" or job_id = "AC_MGR" or job_id = "AD_ASST" or job_id = "AD_PRES" or job_id = "AD_VP" or job_id = "FI_ACCOUNT"
and employee_id in (06,205,200,100,101,102,110 ,113 ,111 ,109 ,112);

select job_id as "Job ID", group_concat(employee_id) as "Employee ID" from hr.employees group by job_id;

/*25. Write a query to update the portion of the phone_number in the employees table, within the phone 
number the substring '124' will be replaced by '999'*/
select substring_replace(123,999) from hr.employees; 
/*correct method*/
update hr.employees set phone_number = replace(phone_number,'124','999') where phone_number like "%124%";

/*26. Write a query to get the details of the employees where the length of the first name greater than or 
equal to 8*/
select first_name from hr.employees where length(first_name)>=8;

/*27. Write a query to append '@example.com' to email field*/
select concat(lower(email),"@example.com") as "email" from hr.employees;

/*28. Write a query to extract the last 4 character of phone numbers*/
select right(phone_number,4) as "Phone Number" from hr.employees;

/*29. Write a query to get the last word of the street address*/
select street_address, substring_index(rtrim(street_address), ' ', -1) as "Last word of street address"
from hr.locations;


/*30. Write a query to get the locations that have minimum street length*/
select * from hr.locations where length(street_address) <=
(select min(length(street_address)) from hr.locations);

/*31. Write a query to display the first word from those job titles which contains more than one words*/
select job_title, substr(job_title,1, instr(job_title, ' ')-1) from hr.jobs;

/*32. Write a query to display the length of first name for employees where last name contain character 'c' 
after 2nd position*/
select first_name as 'First Name', last_name as 'Last Name', length(first_name) as 'Length of First Name'
from hr.employees where last_name like '__%c%';

/*33. Write a query that displays the first name and the length of the first name for all employees whose 
name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the 
employees' first names*/

select first_name as 'First Name', length(first_name) as 'Length of First Name' from hr.employees
where first_name like 'A%' or first_name like 'J%' or first_name like 'M%' order by first_name; 

/*34. Write a query to display the first name and salary for all employees. Format the salary to be 10 
characters long, left-padded with the $ symbol. Label the column SALARY*/
select first_name as "First Name", lpad(salary,10,'$') as 'Salary' from hr.employees;

/*35. Write a query to display the first eight characters of the employees' first names and indicates the 
amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in 
descending order of salary*/
select left(first_name,8) as 'First Name', repeat('$', floor(salary/1000)) as 'Salary in $', salary 
from hr.employees;

/*36. Write a query to display the employees with their code, first name, last name and hire date who hired 
either on seventh day of any month or seventh month in any year*/
select employee_id as 'ID', first_name as 'First Name', last_name as 'Last Name', hire_date as 'Hire Date' from hr.employees 
where hire_date like '%-%-07' or hire_date like '%-07-%';




