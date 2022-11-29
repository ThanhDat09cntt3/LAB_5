
-- 1.a:
create proc lab5_bai1_a @name nvarchar(20)
as
	begin
		print 'xin chào: ' + @name
	end
exec lab5_bai1_a 'Thành Đạt'
go
-- 1.b:
create proc lab5_bai1_b @so1 int, @so2 int
as
	begin
		declare @tong int = 0;
		set @tong = @so1 + @so2 
		print 'tong: ' + cast(@tong as varchar(10))
	end
exec lab5_bai1_b 9,5
go

-- 1.c:
create proc lab5_bai1_c @l int
as
	begin
		declare @tong int = 0, @i int = 0;
		while @i < @l
			begin
				set @tong = @tong + @i
				set @i = @i + 2
			end
		print 'tổng: ' + cast(@tong as varchar(10))
	end
exec lab5_bai1_c 14
go

-- 1.d:
create proc lab5_bai1_d @a int, @b int
as
	begin
		while (@a != @b)
			begin
				if(@a > @b)
					set @a = @a -@b
				else
					set @b = @b - @a
			end
			return @a
	end
declare @l int
exec @l = lab5_bai1_d 7,5
print @l
go

-- 2.a:
create proc lab5_bai2_a @MaNV varchar(20)
as
	begin
		select * from NHANVIEN where MANV = @MaNV
	end
exec lab5_bai2_a '001'
go

-- 2.b:
select count(MANV), MADA, TENPHG from NHANVIEN
inner join PHONGBAN on NHANVIEN.PHG = PHONGBAN.MAPHG
inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
where MADA = 2
group by TENPHG,MADA

create proc lab5_bai2_b @manv int
as
begin
		select count(MANV) as 'so luong', MADA, TENPHG from NHANVIEN
		inner join PHONGBAN on NHANVIEN.PHG = PHONGBAN.MAPHG
		inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
		where MADA = @manv
		group by TENPHG,MADA
end
exec lab5_bai2_b 10
go

-- 2.c:
select count(MANV)as 'so luong', MADA, TENPHG from NHANVIEN
inner join PHONGBAN on NHANVIEN.PHG = PHONGBAN.MAPHG
inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
where MADA = 2 and DDIEM_DA = 'Nha Trang'
group by TENPHG,MADA
go

-- 2.d:
select HONV, TENNV, TENPHG, NHANVIEN.MANV, THANNHAN.*
from NHANVIEN
inner join PHONGBAN on PHONGBAN.MAPHG = NHANVIEN.PHG
left outer join THANNHAN on THANNHAN.MA_NVIEN = NHANVIEN.MANV
where THANNHAN.MA_NVIEN is null and TRPHG = '008'

create proc lab5_bai2_d @MaTP varchar(10)
as
begin
	select HONV, TENNV, TENPHG, NHANVIEN.MANV, THANNHAN.*
	from NHANVIEN
	inner join PHONGBAN on PHONGBAN.MAPHG = NHANVIEN.PHG
	left outer join THANNHAN on THANNHAN.MA_NVIEN = NHANVIEN.MANV
	where THANNHAN.MA_NVIEN is null and TRPHG = @MaTP
end
exec lab5_bai2_d '008'
go

-- 2.e:
if exists (select * from NHANVIEN where MANV = '001' and PHG = '5')
print 'Nhan vien co trong phong ban'
else 
print 'Nhan vien khong co trong phong ban'

create proc lab5_bai2_e @MaNV varchar(10), @MaPB varchar(10)
as
begin
	if exists(select * from NHANVIEN where MANV = '001' and PHG=@MaPB)
	print 'Nhan vien:' + @MaNV +'co trong phong ban: '+@MaPB
else 
	print 'Nhan vien: '+ @MaNV+'khong co trong phong ban: '+@MaPB
end
exec lab5_bai2_e '001','5'











