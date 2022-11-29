-----BAI3
create proc sp_InsertPB
	@MaPB int, @TenPB nvarchar(15),
	@MaTP nvarchar(9), @NgayNhanChuc date
as
	begin 
		if (exists (select * from PhongBan where MaPHG = @MaPB) )
			print 'Them That Bai'
		else
			begin
				insert into PHONGBAN(MAPHG, TENPHG, TRPHG, NG_NHANCHUC)
				values (@MaPB, @TenPB, @MaTP, @NgayNhanChuc)
				print 'Them Thanh Cong'
			end
end
------

create proc sp_UpdatePB
	@MaPB int, @TenPB nvarchar(15),
	@MaTP nvarchar(9), @NgayNhanChuc date
as
	begin
		if (exists(select * from PhongBan where MaPHG = @MaPB))
			update PhongBan set TENPHG = @TenPB, TRPHG = @MaTP,
			NG_NHANCHUC = @NgayNhanChuc where MAPHG = @MaPB
		else
			begin
				insert into PHONGBAN(MAPHG, TENPHG, TRPHG, NG_NHANCHUC)
				values (@MaPB, @TenPB, @MaTP, @NgayNhanChuc)
				print 'Them Thanh Cong'
			end
	end
exec sp_UpdatePB '8', 'IT','008','2020-10-06'
--------3
create proc spInsertNhanVien
 @HONV nvarchar(15), @TENLOT nvarchar(15),@TENNV nvarchar(15),
 @MANV nvarchar(6),@NGSINH date, @DCHI nvarchar(50),@PHAI nvarchar (3),
 @LUONG float, @MA_NQL nvarchar(3) = null,@PHG int
as
begin --proc
	declare @age int
	set @age = YEAR(GETDATE()) - YEAR (@NGSINH)
	if @PHG = (select MaPHG from PHONGBAN where TENPHG = '‘IT')
		begin --thuoc phong IT
			if @LUONG < 25000
				set @MA_NQL = '009'
			else set @MA_NQL = '005'

			if (@PHAI = 'Nam' and (@age> 8 and @age <= 65))
				or (@PHAI = N'N@' and (@age >=18 and @age <= 60))
				begin --do tuoi lao dong

					insert into NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI,
								PHAI, LUONG, MA_NQL, PHG)
					values (@HONV, @TENLOT, @TENNV, @MANV, @NGSINH, @DCHI,
						 @PHAI, @LUONG, @MA_NQL, @PHG)

				end --do tuoi lao dong
			else
				print 'Khong thuoc do tuoi lao dong'

		    end --thuoc phong IT

	else
		print 'Khong Phai Phong Ban IT'
end --proc