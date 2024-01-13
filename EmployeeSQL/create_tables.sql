DROP TABLE IF EXISTS departments, dept_emp, dept_manager, employees, salaries, titles;

CREATE TABLE departments (dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
						 dept_name VARCHAR(50));
						 
CREATE TABLE titles (title_id VARCHAR(30) PRIMARY KEY NOT NULL,
					title VARCHAR(100));
					
CREATE TABLE employees (emp_no INT PRIMARY KEY NOT NULL,
					   emp_title_id VARCHAR(30),
					   birth_date DATE,
					   first_name VARCHAR(50),
					   last_name VARCHAR(50),
					   sex CHAR(1),
					   hire_date DATE,
					   FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));
						 
CREATE TABLE dept_emp (id SERIAL PRIMARY KEY NOT NULL,
					   emp_no INT NOT NULL,
					  dept_no VARCHAR(30),
					  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
					  FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
					  
CREATE TABLE dept_manager (id SERIAL PRIMARY KEY NOT NULL,
						   dept_no VARCHAR(30),
						   emp_no INT NOT NULL,
						   FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
					  	   FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
					   
CREATE TABLE salaries (emp_no INT PRIMARY KEY NOT NULL,
    					salary INT
						);

ALTER TABLE salaries
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
					  
