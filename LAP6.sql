----Bai1
create trigger trg_insertNhanVien on NhanVien
for insert
as
	if (select luong from inserted)<15000
		begin 
			print ' Luong phai lon hon 15000'
			rollback transaction
		end

insert into NHANVIEN 
values ('Vo','Dai','Huy','021','2020-12-12', 'HCM','Nam',14000,'006',1)


----------------
create trigger trg_insertNhanVien2 on NhanVien
for insert
as
	declare @age int
	set @age = YEAR(GETDATE()) - (select YEAR(NgSinh) from inserted)
	if(@age < 18 or @age > 65)
		begin
			print ' Tuoi khong hop le'
			rollback transaction
			end
-----------------------
create trigger trg_UpdateNhanVien on NhanVien
for update
as
	if(select dchi from inserted) like '%HCM%'
		begin
			print' Dia chi khong hop le'
			rollback transaction
		end
select*from NHANVIEN
update NHANVIEN set TENNV ='NamNV' where MANV = '001'


------- BAI2

create trigger trg_insertNhanVien2a on NhanVien
after insert
as 
begin
	select COUNT(case when UPPER(Phai)= 'Nam' then 1 end) Nam,
		COUNT(case when UPPER(Phai)= N'Nữ' then 1 end) Nữ
	from NHANVIEN
end

--------------------

create trigger trg_insertNhanVien2b on NhanVien
after insert
as 
begin
	IF UPDATE(Phai)
		begin
			select COUNT(case when UPPER(Phai)= 'Nam' then 1 end) Nam,
				COUNT(case when UPPER(Phai)= N'Nữ' then 1 end) Nữ
			from NHANVIEN
		end
end

-------------------------

create trigger trg_CountDeAn2c on DeAn
after delete
as 
begin
	select MA_NVIEN, COUNT(MADA) AS 'So luong' from PHANCONG
	group by MA_NVIEN
END


 delete DEAN where MADA = 22

 -------------------------BAI3

 create trigger trg_deleteNhanThanNV on NhanVien
instead of delete
as
begin
	 delete from THANNHAN where MA_NVIEN in ( select MANV from deleted)
	  delete from NHANVIEN where MANV in ( select MANV from deleted)
end

SelECt * from NHANVIEN
delete NHANVIEN where MANV ='005'


------------------------

alter trigger trg_insertNhanVien3b on nhanvien
after insert
as begin
	insert into PHANCONG values ((select MaNV from inserted),1,1,100)
end

insert into NHANVIEN 
values ('Vo','Dai','Huy','055','1980-10-12', 'HCM',N'Nữ',17000,'006',1)









