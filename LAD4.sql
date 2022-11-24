---------BAI1
declare @THONGKE table(MaPB int, LuongTB float)

insert into @THONGKE
       select PHG, AVG(LUONG) from NHANVIEN group by PHG
	   
select TENNV, PHG, LUONG, LuongTB,
TinhTrang = case
when LUONG > LuongTB then 'KHONG TANG LUONG'
else 'TANG LUONG'
end
  from NHANVIEN a
  inner join @THONGKE b
  on a.PHG = B.MaPB

  ----

declare @THONGKE table(MaPB int, LuongTB float)

insert into @THONGKE
       select PHG, AVG(LUONG) from NHANVIEN group by PHG
	  
select TENNV, PHG, LUONG, LuongTB,
TinhTrang = case
when LUONG > LuongTB then 'TRUONG PHONG'
else 'NHAN VIEN'
end
  from NHANVIEN a
  inner join @THONGKE b
  on a.PHG = B.MaPB

  ---
 select IIF(phai = N'Nam', 'Mr.','Ms.')+ TENNV as 'Ten' from NHANVIEN

 ----
 select TENNV, LUONG,
 Thue = case
        when LUONG between 0 and 25000 then LUONG*0.1
		when LUONG between 25000 and 30000 then LUONG*0.12
		when LUONG between 30000 and 40000 then LUONG*0.15
		when LUONG between 40000 and 50000 then LUONG*0.2
		else LUONG *0.25
		END
from NHANVIEN

----------BAI 2	
select * from NHANVIEN
declare @i int = 2, @dem int;
set @dem = (select COUNT(*) from NHANVIEN)
while (@i < @dem)
begin  
     select MANV, HONV, TENLOT, TENNV from NHANVIEN
	 where CAST(MANV as int ) = @i;
	 set @i = @i +2;
end

--------------
select * from NHANVIEN
declare @i int = 2, @dem int;
set @dem = (select COUNT(*) from NHANVIEN)
while (@i < @dem)
begin  
      if(@i =4)
	    begin
		  set @i = @i + 2;
		  continue;
	    end;
	  select MANV, HONV, TENLOT, TENNV from NHANVIEN
	 where CAST(MANV as int ) = @i;
	 set @i = @i +2;
end


-------BAI 3
begin try
    insert PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
	values('Ke Hoach',111,'017','2020-12-12')
	print 'Chen thanh cong'
end try
begin catch
    print 'Loi' + convert(varchar, Error_number(),1)
	+ '=>' + Error_message()
end catch

-----
begin try
    insert PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
	values('Ke Hoach',111,'019','2020-12-12')
	print 'Chen thanh cong'
end try
begin catch
    print 'Loi' + convert(varchar, Error_number(),1)
	+ '=>' + Error_message()
end catch
------------------------------
begin try 
    declare @a int = 4,@b int = 0, @result int;
	set @result = @a / @b;
end try
begin catch
    declare @ErMessage nvarchar(2048),
	        @ErSeverity int,
	        @ErState int
	select @ErMessage = ERROR_MESSAGE(),
	        @ErSeverity = ERROR_SEVERITY(),
	        @ErState = ERROR_STATE()
	raiserror(@ErMessage,@ErSeverity, @ErState)
end catch
