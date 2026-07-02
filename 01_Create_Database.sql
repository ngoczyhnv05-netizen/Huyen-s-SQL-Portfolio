- HỆ THỐNG QUẢN LÝ NHÂN SỰ - TẠO CƠ SỞ DỮ LIỆU

CREATE DATABASE QLLUONG

USE QLLUONG

-- 1. Bảng phòng ban
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255)
)

-- 2. Bảng chức vụ
CREATE TABLE Positions (
    PositionID INT PRIMARY KEY IDENTITY(1,1),
    PositionName NVARCHAR(100) NOT NULL,
    BaseSalary DECIMAL(12,2) NOT NULL
)

-- 3. Bảng nhân viên
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(150) NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address NVARCHAR(255),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    PositionID INT FOREIGN KEY REFERENCES Positions(PositionID),
    HireDate DATE NOT NULL,
    Status NVARCHAR(50) NOT NULL
)

-- 4. Bảng hợp đồng
CREATE TABLE Contracts (
    ContractID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    SalaryCoefficient DECIMAL(5,2) NOT NULL
)

-- 5. Bảng chấm công
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    WorkDate DATE NOT NULL,
    WorkHours DECIMAL(5,2) NOT NULL,
    OvertimeHours DECIMAL(5,2) DEFAULT 0
)

-- 6. Bảng phụ cấp
CREATE TABLE Allowances (
    AllowanceID INT PRIMARY KEY IDENTITY(1,1),
    AllowanceName NVARCHAR(100) NOT NULL,
    Amount DECIMAL(12,2) NOT NULL
)

-- 7. Bảng thưởng
CREATE TABLE Bonuses (
    BonusID INT PRIMARY KEY IDENTITY(1,1),
    BonusName NVARCHAR(100) NOT NULL,
    Amount DECIMAL(12,2) NOT NULL
)

-- 8. Bảng khấu trừ
CREATE TABLE Deductions (
    DeductionID INT PRIMARY KEY IDENTITY(1,1),
    DeductionName NVARCHAR(100) NOT NULL,
    Amount DECIMAL(12,2) NOT NULL
)

-- 9. Bảng lương
CREATE TABLE Payroll (
    PayrollID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    Month INT NOT NULL,
    Year INT NOT NULL,
    TotalWorkDays INT DEFAULT 20,
    GrossSalary DECIMAL(14,2),
    NetSalary DECIMAL(14,2)
)

-- 10. Bảng bảo hiểm
CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    SocialInsurance DECIMAL(12,2),
    HealthInsurance DECIMAL(12,2),
    UnemploymentInsurance DECIMAL(12,2)
)
