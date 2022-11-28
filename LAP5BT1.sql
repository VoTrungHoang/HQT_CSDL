
------bai a
create proc sp_lad5_Bai1_a @name nvarchar(20)
as
  begin 
     print 'Xin chao: '+ @name
  end

  exec sp_lad5_Bai1_a N'Tieng Viet'


  --------bai b
  create proc sp_lad5_Bai1_b @numberA int, @numberB int
as
    begin 
	   declare @sum int = 0;
	   set @sum = @numberA + @numberB
	   print 'Tong: ' + cast (@sum as varchar(10))
	end

exec sp_lad5_Bai1_b 5,8


----------bai c

create proc sp_lab5_Bai1_c @n int
as
    begin
	   declare @sum int = 0, @i int = 0;
	   while @i < @n 
	      begin 
		     set @sum = @sum + @i
			 set @i = @i +2
		  end
	   print 'sum even: ' + cast(@sum as varchar(10))
	end
	   
	   exec sp_lab5_Bai1_c 10

	   
--------bai d
create proc sp_lab5_Bai1_d @a int, @b int
as
    begin
	  while (@a != @b)
	    begin
		  if (@a > @b)
		    set @a = @a -@b
	      else
		    set @b = @b - @a 
		end
		return @a
	end

declare @c int
exec @c= sp_lab5_Bai1_d 10,60
print @c
