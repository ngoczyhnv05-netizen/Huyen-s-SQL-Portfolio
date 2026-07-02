USE QLLUONG

-- 1. Thủ tục thêm nhân viên mới
CREATE PROCEDURE sp_ThemNhanVien
    @FullName NVARCHAR(150),
    @Gender NVARCHAR(10),
    @DateOfBirth DATE,
    @Phone VARCHAR(15),
    @Email VARCHAR(100),
    @Address NVARCHAR(255),
    @DepartmentName NVARCHAR(100),
    @PositionName NVARCHAR(100),
    @HireDate DATE,
    @Status NVARCHAR(50)
AS
BEGIN
    DECLARE @DepartmentID INT
    DECLARE @PositionID INT

    SELECT @DepartmentID = DepartmentID FROM Departments WHERE DepartmentName = @DepartmentName
    IF @DepartmentID IS NULL
    BEGIN
        INSERT INTO Departments (DepartmentName) VALUES (@DepartmentName)
        SELECT @DepartmentID = DepartmentID FROM Departments WHERE DepartmentName = @DepartmentName
    END

    SELECT @PositionID = PositionID FROM Positions WHERE PositionName = @PositionName
    IF @PositionID IS NULL
    BEGIN
        INSERT INTO Positions (PositionName, BaseSalary) VALUES (@PositionName, 7000000)
        SELECT @PositionID = PositionID FROM Positions WHERE PositionName = @PositionName
    END

    INSERT INTO Employees (FullName, Gender, DateOfBirth, Phone, Email, Address, DepartmentID, PositionID, HireDate, Status)
    VALUES (@FullName, @Gender, @DateOfBirth, @Phone, @Email, @Address, @DepartmentID, @PositionID, @HireDate, @Status)
END

-- 2. Thủ tục cập nhật bảo hiểm
CREATE PROCEDURE sp_CapNhatBaoHiem
    @FullName NVARCHAR(150),
    @SocialInsurance DECIMAL(12,2),
    @HealthInsurance DECIMAL(12,2),
    @UnemploymentInsurance DECIMAL(12,2)
AS
BEGIN
    DECLARE @EmployeeID INT
    SELECT @EmployeeID = EmployeeID FROM Employees WHERE FullName = @FullName

    IF EXISTS (SELECT * FROM Insurance WHERE EmployeeID = @EmployeeID)
    BEGIN
        UPDATE Insurance
        SET SocialInsurance = @SocialInsurance,
            HealthInsurance = @HealthInsurance,
            UnemploymentInsurance = @UnemploymentInsurance
        WHERE EmployeeID = @EmployeeID
    END
    ELSE
    BEGIN
        INSERT INTO Insurance (EmployeeID, SocialInsurance, HealthInsurance, UnemploymentInsurance)
        VALUES (@EmployeeID, @SocialInsurance, @HealthInsurance, @UnemploymentInsurance)
    END
END

-- 3. Thủ tục lấy danh sách nhân viên theo phòng
CREATE PROCEDURE sp_DSNhanVienTheoPhong
    @DepartmentName NVARCHAR(100)
AS
BEGIN
    SELECT 
        e.FullName,
        e.Gender,
        e.DateOfBirth,
        e.Phone,
        e.Email,
        p.PositionName,
        e.HireDate,
        e.Status
    FROM Employees e
    INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
    INNER JOIN Positions p ON e.PositionID = p.PositionID
    WHERE d.DepartmentName = @DepartmentName
END

-- 4. Thủ tục thống kê lương theo phòng
CREATE PROCEDURE sp_ThongKeLuongTheoPhong
AS
BEGIN
    SELECT 
        d.DepartmentName,
        COUNT(e.EmployeeID) AS SoLuongNhanVien,
        AVG(p.BaseSalary) AS LuongTrungBinh,
        MIN(p.BaseSalary) AS LuongThapNhat,
        MAX(p.BaseSalary) AS LuongCaoNhat
    FROM Departments d
    LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
    LEFT JOIN Positions p ON e.PositionID = p.PositionID
    GROUP BY d.DepartmentName
END

-- 5. Thủ tục tìm nhân viên theo tên
CREATE PROCEDURE sp_TimNhanVienTheoTen
    @FullName NVARCHAR(150)
AS
BEGIN
    SELECT 
        e.FullName,
        e.Gender,
        e.DateOfBirth,
        e.Phone,
        e.Email,
        e.Address,
        d.DepartmentName,
        p.PositionName,
        e.HireDate,
        e.Status
    FROM Employees e
    INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
    INNER JOIN Positions p ON e.PositionID = p.PositionID
    WHERE e.FullName LIKE N'%' + @FullName + N'%'
END
