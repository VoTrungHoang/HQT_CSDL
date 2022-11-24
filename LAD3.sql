---BAI1
select TENDEAN, SUM(THOIGIAN) AS 'Tong gio' from DEAN
inner join CONGVIEC on CONGVIEC.MADA = DEAN.MADA
inner join PHANCONG on PHANCONG.MADA = CONGVIEC.MADA
GROUP BY TENDEAN

----cast

select TENDEAN, CAST(SUM(THOIGIAN) as decimal (6,2)) as ' Tong gio' from DEAN
inner join CONGVIEC on CONGVIEC.MADA = DEAN.MADA
inner join PHANCONG on PHANCONG.MADA = CONGVIEC.MADA
GROUP BY TENDEAN



select TENDEAN, CAST(SUM(THOIGIAN) as varchar(10)) as ' Tong gio' from DEAN
inner join CONGVIEC on CONGVIEC.MADA = DEAN.MADA
inner join PHANCONG on PHANCONG.MADA = CONGVIEC.MADA
GROUP BY TENDEAN

-----convert

select TENDEAN, CONVERT (decimal (6,2),SUM(THOIGIAN))  as ' Tong gio' from DEAN
inner join CONGVIEC on CONGVIEC.MADA = DEAN.MADA
inner join PHANCONG on PHANCONG.MADA = CONGVIEC.MADA
GROUP BY TENDEAN

select TENDEAN, CONVERT (varchar(10),SUM(THOIGIAN))  as ' Tong gio' from DEAN
inner join CONGVIEC on CONGVIEC.MADA = DEAN.MADA
inner join PHANCONG on PHANCONG.MADA = CONGVIEC.MADA
GROUP BY TENDEAN

----LUONG

select TENPHG, AVG(LUONG) as 'Luong Trung binh' from PHONGBAN
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG
group by TENPHG

---

select TENPHG, CAST( AVG(LUONG) as DECIMAL(10,2)) as 'Luong Trung binh' from PHONGBAN
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG
group by TENPHG

---

select TENPHG, CONVERT( DECIMAL(10,2),AVG(LUONG)) as 'Luong Trung binh' from PHONGBAN
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG
group by TENPHG

---

select TENPHG, CAST(AVG(LUONG) as varchar(10)) as 'Luong Trung binh',--- CHU Y DAY PHAY
LEFT(CAST(AVG(LUONG) as varchar(10)),3) + 
REPLACE(CAST(AVG(LUONG) as varchar(10)),LEFT(CAST( AVG(LUONG) as varchar(10)),3),',')
from PHONGBAN
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG
group by TENPHG

---

select TENPHG, CONVERT(varchar(10),AVG(LUONG)) as 'Luong Trung binh',--- CHU Y DAY PHAY
LEFT(CONVERT(varchar(10),AVG(LUONG)),3) + 
REPLACE(CONVERT(varchar(10),AVG(LUONG)),LEFT(CONVERT(varchar(10),AVG(LUONG)),3),',')
from PHONGBAN
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG
group by TENPHG


-----BAI 2

select TENDEAN, CAST(SUM(THOIGIAN) as decimal (6,2)) AS 'Tong gio',
CEILING(CAST(SUM(THOIGIAN) as decimal (6,2))) AS 'Tong gio moi'
from DEAN
inner join CONGVIEC on CONGVIEC.MADA = DEAN.MADA
inner join PHANCONG on PHANCONG.MADA = CONGVIEC.MADA
GROUP BY TENDEAN

---

select TENDEAN, CAST(SUM(THOIGIAN) as decimal (6,2)) AS 'Tong gio',
FLOOR(CAST(SUM(THOIGIAN) as decimal (6,2))) AS 'Tong gio moi'
from DEAN
inner join CONGVIEC on CONGVIEC.MADA = DEAN.MADA
inner join PHANCONG on PHANCONG.MADA = CONGVIEC.MADA
GROUP BY TENDEAN

---

select TENDEAN, CAST(SUM(THOIGIAN) as decimal (6,2)) AS 'Tong gio',
ROUND(CAST(SUM(THOIGIAN) as decimal (6,2)),2) AS 'Tong gio moi'
from DEAN
inner join CONGVIEC on CONGVIEC.MADA = DEAN.MADA
inner join PHANCONG on PHANCONG.MADA = CONGVIEC.MADA
GROUP BY TENDEAN

--- Trung binh la 32600
select ROUND(AVG(LUONG),2) from NHANVIEN
inner join PHONGBAN on PHONGBAN.MAPHG = NHANVIEN.PHG
where TENPHG = N'Nghiên cứu'

select HONV + ' ' + TENLOT + ' ' + TENNV,LUONG from NHANVIEN 
where LUONG >= (select ROUND(AVG(LUONG),2) from NHANVIEN
inner join PHONGBAN on PHONGBAN.MAPHG = NHANVIEN.PHG
where TENPHG = N'Nghiên cứu')


---BAI3

select upper(HONV) as 'HoNV' ,
LOWER(TENLOT) as 'TenLot',
LOWER(LEFT(TENNV,1)) + upper(SUBSTRING(TENNV,2,1)) + SUBSTRING(TENNV,3,LEN(TENNV)-2),
TENNV,
DCHI, COUNT(MA_NVIEN) AS 'SO THAN NHAN' from NHANVIEN
inner join THANNHAN on THANNHAN.MA_NVIEN = NHANVIEN.MANV
Group by HONV, TENLOT, TENNV, DCHI
having COUNT(MA_NVIEN) >= 2

---DIA CHI
select DCHI,
SUBSTRING(DCHI,CHARINDEX(' ',DCHI),CHARINDEX(',',DCHI) - 3) as 'Ten Duong'
from NHANVIEN

----


----BAI4

select * from NHANVIEN
where YEAR(NGSINH) between 1960 and 1965

---
select *, YEAR(getdate()) - YEAR(NGSINH) as 'TUOI',
DATENAME(WEEKDAY,NGSINH) as 'THU'
from NHANVIEN

---


select TENPHG,TRPHG,B.TENNV, COUNT(A.MaNV) as 'SoLuong'
from NHANVIEN A
inner join PHONGBAN on PHONGBAN.MAPHG = A.PHG
inner join NHANVIEN B on B.MANV = PHONGBAN.TRPHG
group by TENPHG,TRPHG,B.TENNV

