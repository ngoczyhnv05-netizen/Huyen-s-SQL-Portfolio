USE QLLUONG

-- Báo cáo 1: Thống kê nhân viên theo phòng ban
SELECT 
    d.DepartmentName,
    COUNT(e.EmployeeID) AS SoLuongNhanVien
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName

-- Báo cáo 2: Danh sách nhân viên + bảo hiểm
SELECT 
    e.FullName,
    e.Gender,
    d.DepartmentName,
    p.PositionName,
    e.HireDate,
    e.Status,
    i.SocialInsurance AS BHXH,
    i.HealthInsurance AS BHYT,
    i.UnemploymentInsurance AS BHTN
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
INNER JOIN Positions p ON e.PositionID = p.PositionID
LEFT JOIN Insurance i ON e.EmployeeID = i.EmployeeID

-- Báo cáo 3: Nhân viên mới trong tháng hiện tại
SELECT 
    FullName,
    Gender,
    HireDate
FROM Employees
WHERE MONTH(HireDate) = MONTH(GETDATE())
  AND YEAR(HireDate) = YEAR(GETDATE())

-- Báo cáo 4: Top 5 nhân viên lương cao nhất
SELECT TOP 5
    e.FullName,
    p.PositionName,
    p.BaseSalary,
    d.DepartmentName
FROM Employees e
INNER JOIN Positions p ON e.PositionID = p.PositionID
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
ORDER BY p.BaseSalary DESC

-- Báo cáo 5: Lương trung bình theo phòng ban
SELECT 
    d.DepartmentName,
    AVG(p.BaseSalary) AS LuongTrungBinh
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
INNER JOIN Positions p ON e.PositionID = p.PositionID
GROUP BY d.DepartmentName

-- Báo cáo 6: Hợp đồng sắp hết hạn (còn 3 tháng)
SELECT 
    e.FullName,
    c.StartDate,
    c.EndDate,
    c.SalaryCoefficient
FROM Contracts c
INNER JOIN Employees e ON c.EmployeeID = e.EmployeeID
WHERE DATEDIFF(MONTH, GETDATE(), c.EndDate) <= 3

-- Báo cáo 7: Bảng lương tháng 2/2026
SELECT 
    e.FullName,
    p.Month,
    p.Year,
    p.GrossSalary AS LuongTruocThue,
    p.NetSalary AS LuongThucNhan
FROM Payroll p
INNER JOIN Employees e ON p.EmployeeID = e.EmployeeID
WHERE p.Month = 2 AND p.Year = 2026
