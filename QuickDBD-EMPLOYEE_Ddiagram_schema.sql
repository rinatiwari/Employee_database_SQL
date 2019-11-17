-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/2fnIQ0
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "EmpNo" int   NOT NULL,
    "Birthdate" date   NOT NULL,
    "FirstName" varchar(14)   NOT NULL,
    "LastName" varchar(16)   NOT NULL,
    "Gender" varchar(1)   NOT NULL,
    "HireDate" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "EmpNo"
     )
);

CREATE TABLE "DepartmentEmp" (
    "EmpNo" int   NOT NULL,
    "DeptNo" varchar(4)   NOT NULL,
    "FromDate" date   NOT NULL,
    "ToDate" date   NOT NULL
);

CREATE TABLE "DepartmentManager" (
    "DeptNo" varchar(4)fk   NOT NULL,
    "EmpNo" int   NOT NULL,
    "FromDate" date   NOT NULL,
    "ToDate" date   NOT NULL
);

CREATE TABLE "Departments" (
    "DeptNo" int   NOT NULL,
    "DeptName" varchar(40)unique   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DeptNo"
     )
);

CREATE TABLE "Titles" (
    "EmpNo" int   NOT NULL,
    "Title" varchar(50)   NOT NULL,
    "FromDate" date   NOT NULL,
    "ToDate" date   NOT NULL
);

CREATE TABLE "Salaries" (
    "EmpNo" int   NOT NULL,
    "Salary" int   NOT NULL,
    "FromDate" date   NOT NULL,
    "ToDate" date   NOT NULL
);

ALTER TABLE "DepartmentEmp" ADD CONSTRAINT "fk_DepartmentEmp_EmpNo" FOREIGN KEY("EmpNo")
REFERENCES "Employees" ("EmpNo");

ALTER TABLE "DepartmentEmp" ADD CONSTRAINT "fk_DepartmentEmp_DeptNo" FOREIGN KEY("DeptNo")
REFERENCES "Departments" ("DeptNo");

ALTER TABLE "DepartmentEmp" ADD CONSTRAINT "fk_DepartmentEmp_FromDate" FOREIGN KEY("FromDate")
REFERENCES "Salaries" ("FromDate");

ALTER TABLE "DepartmentEmp" ADD CONSTRAINT "fk_DepartmentEmp_ToDate" FOREIGN KEY("ToDate")
REFERENCES "DepartmentManager" ("ToDate");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_DeptNo" FOREIGN KEY("DeptNo")
REFERENCES "Departments" ("DeptNo");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_EmpNo" FOREIGN KEY("EmpNo")
REFERENCES "Employees" ("EmpNo");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_FromDate" FOREIGN KEY("FromDate")
REFERENCES "Salaries" ("FromDate");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_EmpNo" FOREIGN KEY("EmpNo")
REFERENCES "Employees" ("EmpNo");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_FromDate" FOREIGN KEY("FromDate")
REFERENCES "DepartmentEmp" ("FromDate");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_ToDate" FOREIGN KEY("ToDate")
REFERENCES "Salaries" ("ToDate");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EmpNo" FOREIGN KEY("EmpNo")
REFERENCES "Employees" ("EmpNo");

