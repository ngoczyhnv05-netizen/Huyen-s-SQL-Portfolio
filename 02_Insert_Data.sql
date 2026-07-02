-- HỆ THỐNG QUẢN LÝ NHÂN SỰ - DỮ LIỆU MẪU

USE QLLUONG

-- 1. Departments
INSERT INTO Departments (DepartmentName, Description)
VALUES 
(N'IT', N'Công nghệ thông tin'),
(N'HR', N'Nhân sự'),
(N'Finance', N'Tài chính')

-- 2. Positions
INSERT INTO Positions (PositionName, BaseSalary)
VALUES 
(N'Nhân viên', 8000000),
(N'Trưởng nhóm', 12000000),
(N'Quản lý', 20000000)

-- 3. Employees
INSERT INTO Employees (FullName, Gender, DateOfBirth, Phone, Email, Address, DepartmentID, PositionID, HireDate, Status)
VALUES 
(N'Nguyễn Văn A', N'Nam', '1995-01-01', '901', 'a@gmail.com', N'Hà Nội', 1, 1, '2022-01-01', N'Active'),
(N'Trần Thị B', N'Nữ', '1996-02-02', '902', 'b@gmail.com', N'Hà Nội', 1, 2, '2022-02-01', N'Active'),
(N'Lê Văn C', N'Nam', '1994-03-03', '903', 'c@gmail.com', N'Hà Nội', 2, 1, '2021-03-01', N'Active'),
(N'Phạm Thị D', N'Nữ', '1997-04-04', '904', 'd@gmail.com', N'Hà Nội', 2, 2, '2023-01-01', N'Active'),
(N'Hoàng Văn E', N'Nam', '1993-05-05', '905', 'e@gmail.com', N'Hà Nội', 3, 3, '2020-01-01', N'Active'),
(N'Vũ Thị F', N'Nữ', '1998-06-06', '906', 'f@gmail.com', N'Hà Nội', 1, 1, '2023-06-01', N'Active'),
(N'Đỗ Văn G', N'Nam', '1992-07-07', '907', 'g@gmail.com', N'Hà Nội', 3, 2, '2019-01-01', N'Active'),
(N'Bùi Thị H', N'Nữ', '1999-08-08', '908', 'h@gmail.com', N'Hà Nội', 2, 1, '2024-01-01', N'Active'),
(N'Ngô Văn I', N'Nam', '1991-09-09', '909', 'i@gmail.com', N'Hà Nội', 1, 3, '2018-01-01', N'Active'),
(N'Phan Thị K', N'Nữ', '1995-10-10', '910', 'k@gmail.com', N'Hà Nội', 3, 1, '2022-05-01', N'Active')

-- 4. Contracts
INSERT INTO Contracts (EmployeeID, StartDate, EndDate, SalaryCoefficient)
VALUES 
(1, '2025-01-01', '2027-01-01', 1.0),
(2, '2025-01-01', '2027-01-01', 1.0),
(3, '2025-01-01', '2027-01-01', 1.0),
(4, '2025-01-01', '2027-01-01', 1.0),
(5, '2025-01-01', '2027-01-01', 1.0),
(6, '2025-01-01', '2027-01-01', 1.0),
(7, '2025-01-01', '2027-01-01', 1.0),
(8, '2025-01-01', '2027-01-01', 1.0),
(9, '2025-01-01', '2027-01-01', 1.0),
(10, '2025-01-01', '2027-01-01', 1.0)

-- 5. Attendance
INSERT INTO Attendance (EmployeeID, WorkDate, WorkHours, OvertimeHours)
VALUES 
(1, '2026-01-01', 8, 2),
(2, '2026-01-01', 8, 2),
(3, '2026-01-01', 8, 2),
(4, '2026-01-01', 8, 2),
(5, '2026-01-01', 8, 2),
(6, '2026-01-01', 8, 2),
(7, '2026-01-01', 8, 2),
(8, '2026-01-01', 8, 2),
(9, '2026-01-01', 8, 2),
(10, '2026-01-01', 8, 2),
(1, '2026-02-01', 8, 1),
(2, '2026-02-01', 8, 1),
(3, '2026-02-01', 8, 1),
(4, '2026-02-01', 8, 1),
(5, '2026-02-01', 8, 1),
(6, '2026-02-01', 8, 1),
(7, '2026-02-01', 8, 1),
(8, '2026-02-01', 8, 1),
(9, '2026-02-01', 8, 1),
(10, '2026-02-01', 8, 1)

-- 6. Allowances
INSERT INTO Allowances (AllowanceName, Amount)
VALUES 
(N'Ăn trưa', 500000),
(N'Đi lại', 300000)

-- 7. Bonuses
INSERT INTO Bonuses (BonusName, Amount)
VALUES 
(N'Thưởng KPI', 1000000),
(N'Thưởng dự án', 2000000)

-- 8. Deductions
INSERT INTO Deductions (DeductionName, Amount)
VALUES 
(N'Bảo hiểm', 800000),
(N'Phạt đi muộn', 200000)

-- 9. Insurance
INSERT INTO Insurance (EmployeeID, SocialInsurance, HealthInsurance, UnemploymentInsurance)
VALUES 
(1, 500000, 300000, 200000),
(2, 500000, 300000, 200000),
(3, 500000, 300000, 200000),
(4, 500000, 300000, 200000),
(5, 500000, 300000, 200000),
(6, 500000, 300000, 200000),
(7, 500000, 300000, 200000),
(8, 500000, 300000, 200000),
(9, 500000, 300000, 200000),
(10, 500000, 300000, 200000)

-- 10. Payroll
INSERT INTO Payroll (EmployeeID, Month, Year, TotalWorkDays, GrossSalary, NetSalary)
VALUES 
(1, 1, 2026, 20, 8000000, 8200000),
(2, 1, 2026, 20, 12000000, 12200000),
(3, 1, 2026, 20, 8000000, 8200000),
(4, 1, 2026, 20, 12000000, 12200000),
(5, 1, 2026, 20, 20000000, 20200000),
(6, 1, 2026, 20, 8000000, 8200000),
(7, 1, 2026, 20, 12000000, 12200000),
(8, 1, 2026, 20, 8000000, 8200000),
(9, 1, 2026, 20, 20000000, 20200000),
(10, 1, 2026, 20, 8000000, 8200000),
(1, 2, 2026, 20, 8000000, 8700000),
(2, 2, 2026, 20, 12000000, 12700000),
(3, 2, 2026, 20, 8000000, 8700000),
(4, 2, 2026, 20, 12000000, 12700000),
(5, 2, 2026, 20, 20000000, 20700000),
(6, 2, 2026, 20, 8000000, 8700000),
(7, 2, 2026, 20, 12000000, 12700000),
(8, 2, 2026, 20, 8000000, 8700000),
(9, 2, 2026, 20, 20000000, 20700000),
(10, 2, 2026, 20, 8000000, 8700000)
