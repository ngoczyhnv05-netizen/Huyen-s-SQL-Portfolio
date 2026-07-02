USE QLLUONG

-- Dùng cursor duyệt từng nhân viên và tính lương
DECLARE @EmployeeID INT
DECLARE @FullName NVARCHAR(150)

DECLARE cursorEmployee CURSOR FOR
SELECT EmployeeID, FullName FROM Employees

OPEN cursorEmployee

FETCH NEXT FROM cursorEmployee INTO @EmployeeID, @FullName

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @FullName
    FETCH NEXT FROM cursorEmployee INTO @EmployeeID, @FullName
END

CLOSE cursorEmployee
DEALLOCATE cursorEmployee
