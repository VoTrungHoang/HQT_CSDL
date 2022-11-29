-----bai 2

create proc bai2_1 @MaNV varchar(3)
as
begin
  select * from NHANVIEN where MANV =@MaNV
END
exec bai2_1'001'

select COUNT(MANV) as 'SoLuong',MADA, TENPHG from NHANVIEN
inner join PHONGBAN on NHANVIEN.PHG = PHONGBAN.MAPHG
inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
where MADA = 2 and DDIEM_DA = 'Nha Trang'
group by TENPHG,MADA

---------2

alter proc bai2_2 @manv int
as
begin
     select COUNT (MANV) as 'so luong' ,MADA, TENPHG from NHANVIEN
     inner join PHONGBAN on NHANVIEN. PHG = PHONGBAN.MAPHG
     inner join DEAN on DEAN. PHONG = PHONGBAN.MAPHG
    where MADA = @manv
     group by TENPHG, MADA
end
exec bai2_2 10
-----
create proc.bai2_4 @MaTP varchar (5)
as
begin
    select HONV, TENNV, TENPHG, NHANVIEN.MANV, THANNHAN. *
	from NHANVIEN
    inner join PHONGBAN on PHONGBAN.MAPHG= NHANVIEN . PHG
    left outer join THANNHAN on THANNHAN.MA_NVIEN = NHANVIEN.MANV
	where THANNHAN .MA_NVIEN is null and TRPHG = @MaTP
end

exec bai2_4 '008'
--------

if exists(select * from NHANVIEN where MANV = '001' and PHG ='5')
	print 'Nhan Vien co trong phong ban'
else
	print 'Nhan Vien ko co trong phong ban'

create proc bai2_5 @MaNV varchar(5), @MaPB varchar (5)
as
begin
	if exists(select * from NHANVIEN where MANV = @MaNV and PHG =@MaPB)
	print 'Nhan Vien: '+ @MaNV+' co trong phong ban: '+ @MaPB
else
	print 'Nhan Vien: '+ @MaNV+' KO co trong phong ban: '+@MaPB

end







