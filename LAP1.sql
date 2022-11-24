---1. Tìm các nhân viên làm việc ở phòng số 4.
select * from NHANVIEN where PHG=4 ;
---2. Tìm các nhân viên có mức lương trên 30000.
select * from NHANVIEN where LUONG > 30000;
---3. Tìm các nhân viên có mức lương trên 25,000 ở phòng 4 hoặc các nhân viên có mức lương trên 30,000 ở phòng 5.
select * from NHANVIEN where (PHG=4 AND LUONG > 25000  ) or (PHG=5 AND LUONG > 30000 )
---4. Cho biết họ tên đầy đủ của các nhân viên ở TP HCM
select CONCAT (HONV,' ',TENLOT,' ',TENNV) as Ten FROM NHANVIEN 
where DCHI like N'%HCM%' or DCHI like N'%Hồ Chí Minh%'
---5. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N'
select CONCAT (HONV,' ',TENLOT,' ',TENNV) as Ten FROM NHANVIEN 
where HONV like N'N%';
---6. Cho biết ngày sinh và địa chỉ của nhân viên Dinh Ba Tien.
select NGSINH, DCHI from NHANVIEN 
where HONV = N'Đinh' and TENLOT = N'Bá' and TENNV= N'Tiên';
