USE tienda;
CREATE SCHEMA creacion_tienda ;
USE creacion_tienda ;
CREATE TABLE customers (
	customer_number INT NOT NULL,
	customer_name VARCHAR (50) NOT NULL,
    contact_last_name VARCHAR (50) NOT NULL,
    contact_first_name VARCHAR (50) NOT NULL,
	phone VARCHAR (50) NOT NULL,
	adress_line1 VARCHAR (50) NOT NULL,
	adress_line2 VARCHAR (50) NOT NULL,
    city VARCHAR (50) NOT NULL,
    state VARCHAR (50) NOT NULL,
    postal_code VARCHAR (15) NOT NULL,
	country VARCHAR (50) NOT NULL,
    sales_rep_employee_number INT,
    credit_limit DEC (10,2),
PRIMARY KEY (customer_number)
);
CREATE TABLE employees (
	employee_number INT NOT NULL,
    last_name VARCHAR (50) NOT NULL,
	first_name VARCHAR (50) NOT NULL,
    extension VARCHAR (10) NOT NULL,
    email VARCHAR (100) NOT NULL,
    ofice_code VARCHAR (10),
    reports_to INT,
    job_title VARCHAR (50),
PRIMARY KEY (employee_number)
);

CREATE TABLE customers2 (
	customer_number INT NOT NULL,
	customer_name VARCHAR (50) NOT NULL,
    contact_last_name VARCHAR (50) NOT NULL,
    contact_first_name VARCHAR (50) NOT NULL,
	phone VARCHAR (50) NOT NULL,
	adress_line1 VARCHAR (50) NOT NULL,
	adress_line2 VARCHAR (50) NOT NULL,
    city VARCHAR (50) NOT NULL,
    state VARCHAR (50) NOT NULL,
    postal_code VARCHAR (15) NOT NULL,
	country VARCHAR (50) NOT NULL,
    sales_rep_employee_number INT,
    credit_limit DEC (10,2),
PRIMARY KEY (customer_number),
CONSTRAINT fk_customers2_employees
	FOREIGN KEY (sales_rep_employee_number)
REFERENCES employees (employee_number)
ON DELETE CASCADE
ON UPDATE CASCADE
);
);