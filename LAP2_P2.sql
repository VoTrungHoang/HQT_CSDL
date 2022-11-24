---Cho biêt nhân viên có lương cao nhất
SELECT MAX(LUONG) FROM NHANVIEN;
---Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng "Nghiên cứu”
SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên có lương trung bình trên mức lương trung bình của phòng "Nghiên cứu"'
	FROM NHANVIEN
	WHERE NHANVIEN.LUONG > (SELECT AVG(NHANVIEN.LUONG)
							FROM NHANVIEN, PHONGBAN
							WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND
								  PHONGBAN.TENPHG = N'Nghiên cứu')
---Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
SELECT PHONGBAN.TENPHG, COUNT(NHANVIEN.MANV) AS N'Số lượng nhân viên'
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.PHG = PHONGBAN.MAPHG
	GROUP BY PHONGBAN.TENPHG
	HAVING AVG(NHANVIEN.LUONG)>30000	
---Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
	SELECT PHONGBAN.TENPHG, COUNT(DEAN.PHONG) AS 'Số lượng đề án'
	FROM PHONGBAN, DEAN
	WHERE PHONGBAN.MAPHG = DEAN.PHONG
	GROUP BY PHONGBAN.TENPHG



SELECT * FROM NHANVIEN;