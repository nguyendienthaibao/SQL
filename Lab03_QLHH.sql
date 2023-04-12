/* Học phần: Cơ sở dữ liệu
   Người thực hiện: Nguyễn Điền Thái Bảo
   MSSV: 2112966
   Lớp: CTK45B
   Ngày bắt đầu: 23/02/2023
   Ngày kết thúc: 04/04/2023
*/	

---------------------------------------------------
-----------ĐỊNH NGHĨA CƠ SỞ DỮ LIỆU----------------
CREATE DATABASE Lab03_QLHH
go
use Lab03_QLHH
go

create table HangHoa
(MAHH char (6) primary key,
TenHH Nvarchar (40),
DVT Nvarchar (10),
SoLuongTon int
)
go

create table DoiTac
(MADT char(6) primary key,
Ten Nvarchar (30),
DiaChi Nvarchar (50),
DienThoai char(10)
)
go

create table HoaDon
(SOHD char(6) primary key,
NgayLapHD datetime,
MADT char (6) references DoiTac(MADT),
TongTG int
)
go

create table KhaNangCC
(MADT char(6) references DoiTac(MADT),
MAHH char (6) references HangHoa(MAHH),
)
go

create table CT_HoaDon
(SOHD char(6) references HoaDON(SOHD),
MAHH char (6) references HangHoa(MAHH),
DonGia int,
Soluong int
)
go

-------------------------------------------------
-------------NHẬP DỮ LIỆU CHO CÁC BẢNG-----------
insert into HangHoa values('CPU01','CPU INTEL,CELERON 600 BOX',N'Cái',5)
insert into HangHoa values('CPU02','CPU INTEL,PIII 700',N'Cái',10)
insert into HangHoa values('CPU03','CPU AMD K7 ATHL,ON 600',N'Cái',8)
insert into HangHoa values('HDD01','HDD 10.2 GB QUANTUM',N'Cái',10)
insert into HangHoa values('HDD02','HDD 13.6 GB SEAGATE',N'Cái',15)
insert into HangHoa values('HDD03','HDD 20 GB QUANTUM',N'Cái',6)
insert into HangHoa values('KB01','KB GENIUS',N'Cái',12)
insert into HangHoa values('KB02','KB MITSUMIMI',N'Cái',5)
insert into HangHoa values('MB01','GIGABYTE CHIPSET INTEL',N'Cái',10)
insert into HangHoa values('MB02','ACOPR BX CHIPSET VIA',N'Cái',10)
insert into HangHoa values('MB03','INTEL PHI CHIPSET INTEL',N'Cái',10)
insert into HangHoa values('MB04','ECS CHIPSET SIS',N'Cái',10)
insert into HangHoa values('MB05','ECS CHIPSET VIA',N'Cái',10)
insert into HangHoa values('MNT01','SAMSUNG 14" SYNCMASTER',N'Cái',5)
insert into HangHoa values('MNT02','LG 14" ',N'Cái',5)
insert into HangHoa values('MNT03','ACER 14" ',N'Cái',8)
insert into HangHoa values('MNT04','PHILIPS 14" ',N'Cái',6)
insert into HangHoa values('MNT05','VIEWSONIC 14" ',N'Cái',7)

insert into DoiTac values ('CC001',N'Cty TNC',N'176 BTX Q1- TP.HCM','088250259') 
insert into DoiTac values ('CC002',N'Cty Hoàng Long',N'15A TTT Q1- TP.HCM','088250898') 
insert into DoiTac values ('CC003',N'Cty Hợp Nhất',N'152 BTX Q1- TP.HCM','088252376') 
insert into DoiTac values ('K0001',N'Nguyễn Minh Hải',N'91 Nguyễn Văn Trỗi TP.Đà lạt','063831129')
insert into DoiTac values ('K0002',N'Như Quỳnh',N'21 Điện Biên Phủ Nha Trang','058590270')
insert into DoiTac values ('K0003',N'Trần Nhật Duật',N' Lê Lợi TP.Huế','054848376')
insert into DoiTac values ('K0004',N'Phan Nguyễn Hùng Anh',N'11 Nam Kỳ Khởi Nghĩa TP.Đà lạt','063823409')

set dateformat dmy 
insert into HoaDon values ('N0001','25/01/2006',N'CC001',null)
insert into HoaDon values ('N0002','01/05/2006',N'CC002',null)
insert into HoaDon values ('X0001','12/05/2006',N'K0001',null)
insert into HoaDon values ('X0002','16/06/2006',N'K0002',null)
insert into HoaDon values ('X0003','20/04/2006',N'K0003',null)

insert into KhaNangCC values ('CC001',N'CPU01')
insert into KhaNangCC values ('CC001',N'HDD03')
insert into KhaNangCC values ('CC001',N'KB01')
insert into KhaNangCC values ('CC001',N'MB02')
insert into KhaNangCC values ('CC001',N'MB04')
insert into KhaNangCC values ('CC001',N'MNT01')
insert into KhaNangCC values ('CC002',N'CPU01')
insert into KhaNangCC values ('CC002',N'CPU02')
insert into KhaNangCC values ('CC002',N'CPU03')
insert into KhaNangCC values ('CC002',N'KB02')
insert into KhaNangCC values ('CC002',N'MB01')
insert into KhaNangCC values ('CC002',N'MB05')
insert into KhaNangCC values ('CC002',N'MNT03')
insert into KhaNangCC values ('CC003',N'HDD01')
insert into KhaNangCC values ('CC003',N'HDD02')
insert into KhaNangCC values ('CC003',N'HDD03')
insert into KhaNangCC values ('CC003',N'MB03')

insert into CT_HoaDon values ('N0001',N'CPU01',63,10)
insert into CT_HoaDon values ('N0001',N'HDD03',97,7)
insert into CT_HoaDon values ('N0001',N'KB01',3,5)
insert into CT_HoaDon values ('N0001',N'MB02',57,5)
insert into CT_HoaDon values ('N0001',N'MNT01',112,3)
insert into CT_HoaDon values ('N0002',N'CPU02',115,3)
insert into CT_HoaDon values ('N0002',N'KB02',5,7)
insert into CT_HoaDon values ('N0002',N'MNT03',111,5)
insert into CT_HoaDon values ('X0001',N'CPU01',67,2)
insert into CT_HoaDon values ('X0001',N'HDD03',100,2)
insert into CT_HoaDon values ('X0001',N'KB01',5,2)
insert into CT_HoaDon values ('X0001',N'MB02',62,1)
insert into CT_HoaDon values ('X0002',N'CPU01',67,1)
insert into CT_HoaDon values ('X0002',N'KB02',7,3)
insert into CT_HoaDon values ('X0002',N'MNT01',115,2)
insert into CT_HoaDon values ('X0003',N'CPU01',67,1)
insert into CT_HoaDon values ('X0003',N'MNT03',115,2)

select * from HangHoa
select * from DoiTac
select * from HoaDon
select * from KhaNangCC
select * from CT_HoaDon

-------------------------------------------------
----------------TRUY VẤN DỮ LIỆU-----------------
--1) Liệt kê các mặt hàng thuộc loại đĩa cứng
select *
from HangHoa
where TenHH like N'HDD%'

--2) Liệt kê các mặt hàng có số lượng tồn trên 10
select *
from HangHoa
where  SoLuongTon > 10

--3) Cho biết thông tin về các nhà cung cấp ở Thành Phố Hồ Chí Minh
select * 
from DoiTac
where DiaChi like N'%HCM%'

--4) Liệt kê các hóa đơn nhập hàng 5/2006
select HoaDon.SOHD,NgayLapHD,Ten,DiaChi,DienThoai,MAHH as SoMatHang
from DoiTac,HoaDon,CT_HoaDon
where DoiTac.MADT=HoaDon.MADT and MONTH(NgayLapHD) = 5 and YEAR(NgayLapHD)=2006 and HoaDon.SOHD=CT_HoaDon.SOHD 

--5) Cho biết tên nhà cung cấp đĩa cứng
select A.MaDT, Ten, DiaChi, DienThoai
from DoiTac A, KhaNangCC B
where A.MaDT = B.MaDT and MaHH like 'HDD%'
group by A.MaDT, Ten, DiaChi, DienThoai

--6) Cho biết tên các nhà cung cấp có thể cung cấp tất cả các loại đĩa cứng
select A.MaDT, Ten, DiaChi, DienThoai
from DoiTac A, KhaNangCC B
where A.MaDT = B.MaDT and MaHH like 'HDD%'
group by A.MaDT, Ten, DiaChi, DienThoai
having count(MaHH) = (select count(C.MaHH)
					from HangHoa C
					where C.MaHH like 'HDD%')

--7) Nhà cung cấp không cung cấp đĩa cứng
Select	*
From	DoiTac 
Where	MADT NOT IN (	Select	A.MaDT
						From	DoiTac A, KhaNangCC B
						Where	A.MADT = B.MADT and  MAHH like 'HDD%')

--8) Thông tin mặt hàng chưa bán được
Select	*
From	HangHoa 
Where	MaHH NOT IN (	Select	A.MaHH
						From	HangHoa A, KhaNangCC B
						Where	A.MaHH = B.MaHH )

--9) Mặt hàng bán chạy nhất theo số lượng
select TenHH,Sum(SoLuong) as TongSoLuong
from HangHoa ,CT_HoaDon
where HangHoa.MAHH = CT_HoaDon.MAHH
group by TenHH 
having sum (SoLuong) >= all
(select sum(B.SoLuong) from HangHoa A, CT_HoaDon B
where A.MAHH= B.MAHH 
group by a.TenHH)

--10) Mặt hàng nhập về ít nhất
select TenHH,Sum(SoLuong) as TongSoLuong
from HangHoa ,CT_HoaDon
where HangHoa.MAHH = CT_HoaDon.MAHH
group by TenHH 
having sum (SoLuong) <= all
(select sum(B.SoLuong) from HangHoa A, CT_HoaDon B
where A.MAHH= B.MAHH 
group by a.TenHH)

--11) Hóa đơn nhập nhiều mặt hàng nhất
select HoaDon.SOHD,NgayLapHD,MaDT
from HoaDon,CT_HoaDon
where HoaDon.SoHD = CT_HoaDon.SoHD
group by HoaDon.SOHD, NgayLapHD,MADT
having sum (SoLuong) >= all
(select sum(B.SoLuong)
from HoaDon A, CT_HoaDon B
where A.SoHD=B.SoHD
group by A.SoHD)

--12) Mặt hàng không được nhập hàng trong 1/2006
select * from HangHoa A
where A.MaHH not in
(select A.MaHH 
from HangHoa A, HoaDon B, CT_HoaDon C
Where A.MaHH = c.MaHH and B.SoHD = C.SoHD and MONTH(NgayLapHD) = 1 and YEAR(NgayLapHD) = 2006)

--13) Mặt hàng không bán được trong 6/2006
select * from HangHoa A
where A.MaHH not in
(select A.MaHH 
from HangHoa A, HoaDon B, CT_HoaDon C
Where A.MaHH = c.MaHH and B.SoHD = C.SoHD and MONTH(NgayLapHD) = 6 and YEAR(NgayLapHD) = 2006)

--14) Cho biết cửa hàng bán bao nhiêu mặt hàng
select Ten,count(CT_HoaDon.SOHD) as SoMatHang
from DoiTac,HoaDon,CT_HoaDon
where DoiTac.MADT=HoaDon.MADT and HoaDon.SOHD=CT_HoaDon.SOHD
group by DoiTac.Ten,Ct_HoaDon.SOHD

--15) Cho biết số mặt hàng mà từng nhà cung cấp có khả năng cung cấp
select TenHH,Ten
from DoiTac,HangHoa,KhaNangCC
where DoiTac.MADT=KhaNangCC.MADT and HangHoa.MAHH=KhaNangCC.MAHH

--16) Thông tin khách hàng có giao dịch với cửa hàng nhiều nhất
select Ten,count(CT_HoaDon.SOHD) as SoGiaoDich
from DoiTac ,CT_HoaDon,HoaDon
where DoiTac.MADT = HoaDon.MADT and HoaDon.SOHD= CT_HoaDon.SOHD
group by Ten 
having count (CT_HoaDon.SOHD)>= all
(select count(CT_HoaDon.SOHD) from CT_HoaDon , HoaDon  , DoiTac 
where DoiTac.MADT = HoaDon.MADT and HoaDon.SOHD= CT_HoaDon.SOHD
group by DoiTac.Ten)

--17) Tính tổng doanh thu năm 2006
select sum(DonGia*SoLuong) as TongDoanhThu
from CT_HoaDon,HoaDon
where HoaDon.SOHD=CT_HoaDon.SOHD and year(NgayLapHD) = 2006

--18) Loại mặt hàng bán chạy nhất
select TenHH,count(CT_HoaDon.Soluong) as SoGiaoDich
from HangHoa ,CT_HoaDon,HoaDon
where  HoaDon.SOHD= CT_HoaDon.SOHD and HangHoa.MAHH = CT_HoaDon.MAHH
group by TenHH 
having count (CT_HoaDon.Soluong)>= all
(select count(CT_HoaDon.Soluong) from CT_HoaDon , HoaDon  , HangHoa
where HoaDon.SOHD= CT_HoaDon.SOHD and HangHoa.MAHH = CT_HoaDon.MAHH
group by TenHH )

--19) Thông tin bán hàng 5/2006
select HangHoa.MAHH, TenHH,DVT,sum(SoLuong) as TongSoLuong , sum(DonGia*SoLuong) as TongDoanhThu
from HangHoa,HoaDon,CT_HoaDon
where HoaDon.SOHD = CT_HoaDon.SOHD and HangHoa.MAHH=CT_HoaDon.MAHH and MONTH(NgayLapHD) = 5 and YEAR(NgayLapHD) = 2006
group by HangHoa.MAHH, TenHH,DVT,SoLuong  

--20) Thông tin mặt hàng nhiều người mua nhất
select HangHoa.MAHH,TenHH
from HangHoa ,CT_HoaDon,HoaDon
where  HoaDon.SOHD= CT_HoaDon.SOHD and HangHoa.MAHH = CT_HoaDon.MAHH
group by HangHoa.MAHH,TenHH
having count (CT_HoaDon.Soluong)>= all
(select count(CT_HoaDon.Soluong) from CT_HoaDon , HoaDon  , HangHoa
where HoaDon.SOHD= CT_HoaDon.SOHD and HangHoa.MAHH = CT_HoaDon.MAHH
group by HangHoa.MAHH,TenHH)

--21) Tính và cập nhật tổng trị giá các hóa đơn
UPDATE HoaDon
set TONGTG = (select sum(DonGia*Soluong)
				from CT_HoaDon B
				where HoaDon.SOHD = B.SOHD
				group by B.SOHD)
select * from HoaDon

-------------------------------------------------
----------------THỦ TỤC & HÀM--------------------
--Aa) Tính tổng số lượng nhập trong một khoảng thời gian của một mặt hàng cho trước
create function fn_TongSoLuongNhap(@bd datetime,@kt datetime) returns int
As
Begin
	declare @TongSoLuongNhap int
	
	select  @TongSoLuongNhap = sum(SoLuong)
	from	CT_HoaDon A, HoaDon B 	
	where	A.SOHD = B.SOHD and B.SOHD like '%N%' and NgayLapHD between @bd and @kt
return @TongSoLuongNhap
End
------Thử nghiệm hàm-------
set dateformat dmy
print dbo.fn_TongSoLuongNhap('1/1/2006','15/7/2006')

--Ab) Tính tổng số lượng xuất trong một khoảng thời gian của một mặt hàng cho trước
create function fn_TongSoLuongXuat(@bd datetime,@kt datetime) returns int
As
Begin
	declare @TongSoLuongXuat int
	
	select  @TongSoLuongXuat = sum(SoLuong)
	from	CT_HoaDon A, HoaDon B 	
	where	A.SOHD = B.SOHD and B.SOHD like '%X%' and NgayLapHD between @bd and @kt
return  @TongSoLuongXuat
End
------Thử nghiệm hàm-------
set dateformat dmy
print dbo.fn_TongSoLuongXuat('1/1/2006','15/7/2006')

--Ac) Tính tổng doanh thu trong một tháng cho trước
create function fn_TongDoanhThu(@thang int) returns int
As
Begin
	declare @TongDoanhThu int
	
	select  @TongDoanhThu = sum(SoLuong*DonGia)
	from	CT_HoaDon A, HoaDon B 	
	where	A.SOHD = B.SOHD and B.SOHD like '%X%' and Month(NgayLapHD)= @thang
return  @TongDoanhThu
End
------Thử nghiệm hàm-------
set dateformat dmy
print dbo.fn_TongDoanhThu(6)

--Ad) Tính tổng doanh thu của một mặt hàng trong một khoảng thời gian cho trước
create function fn_TongDoanhThuMotMatHang(@Mahh char (6),@bd datetime ,@kt datetime) returns int
As
Begin
	declare @TongDoanhThuHang int
	
	select @TongDoanhThuHang = sum(SoLuong*DonGia)
	from	CT_HoaDon A, HoaDon B 	
	where	A.SOHD = B.SOHD and B.SOHD like '%X%' and A.MAHH = @Mahh and NgayLapHD  between @bd and @kt
return  @TongDoanhThuHang
End
------Thử nghiệm hàm-------
set dateformat dmy
print dbo.fn_TongDoanhThuMotMatHang('CPU01','1/4/2006','30/6/2006')

--Ae) Tính tổng số tiền nhập hàng trong một khoảng thời gian cho trước
create function fn_TongTienNhapHangTrongThoiGianChoTruoc(@bd datetime ,@kt datetime) returns int
As
Begin
	declare @TongTienNhapHang int
	
	select @TongTienNhapHang  = sum(SoLuong*DonGia)
	from	CT_HoaDon A, HoaDon B 	
	where	A.SOHD = B.SOHD and B.SOHD like '%N%'and NgayLapHD  between @bd and @kt
return  @TongTienNhapHang 
End
------Thử nghiệm hàm-------
set dateformat dmy
print dbo.fn_TongTienNhapHangTrongThoiGianChoTruoc('1/1/2006','30/1/2006')

--Af) Tính tổng số tiền của một hóa đơn cho trước
create function fn_TongTienHoaDon(@SoHd char(6)) returns int
As
Begin
	declare @TongTienHoaDon int
	if exists (select * from HoaDon where SOHD = @SoHd) 
	select @TongTienHoaDon = sum(SoLuong*DonGia)
	from	CT_HoaDon A, HoaDon B 	
	where	A.SOHD = B.SOHD and B.SOHD = @SoHd
return  @TongTienHoaDon 
End
------Thử nghiệm hàm-------
print dbo.fn_TongTienHoaDon('X0003')
print dbo.fn_TongTienHoaDon('N0002')

--a.
ALTER PROC usp_UpdateSLTonNhap
	@MaHH CHAR(5)
AS
	IF EXISTS(SELECT * FROM dbo.HangHoa WHERE MaHH = @MaHH)
		BEGIN
		DROP TABLE IF EXISTS NewSLTonNhap
		   SELECT HangHoa.MaHH,  SoLuongTon + s.SoLuong AS SoLuongTonMoi
			INTO NewSLTonNhap
			FROM dbo.HangHoa, (
				SELECT MaHH,SUM(SoLuong) AS SoLuong
				FROM dbo.CT_HoaDon
				GROUP BY MaHH
				) s
			WHERE HangHoa.MaHH =s.MaHH

			UPDATE dbo.HangHoa
			SET	SoLuongTon = SoLuongTonMoi
			FROM NewSLTonNhap
			WHERE HangHoa.MaHH = NewSLTonNhap.MaHH AND HangHoa.MaHH = @MaHH
		END
	ELSE
		PRINT N'Không có ' + @MaHH + ' trong DataBase.'
GO

EXEC usp_UpdateSLTonNhap 'CPU01'
SELECT * FROM dbo.HangHoa

CREATE PROC usp_UpdateSLTonXuat
	@MaHH CHAR(5)
AS
	IF EXISTS(SELECT * FROM dbo.HangHoa WHERE MaHH = @MaHH)
		BEGIN

			DROP TABLE IF EXISTS SLCanXuat
			SELECT MaHH,SUM(SoLuong) AS SoLuongXuat
			INTO SLCanXuat
			FROM dbo.CT_HoaDon
			GROUP BY MaHH

			IF (SELECT HangHoa.MaHH, SoLuongTon, SoLuongXuat
				FROM dbo.HangHoa, dbo.SLCanXuat
				WHERE SoLuongTon >  SoLuongXuat AND HangHoa.MaHH = SLCanXuat.MaHH
				)

				BEGIN
				   DROP TABLE IF EXISTS NewSLTonXuat
					SELECT HangHoa.MaHH,  SoLuongTon - SoLuongXuat AS SoLuongTonMoi
					INTO NewSLTonXuat
					FROM dbo.HangHoa, SLCanXuat
					WHERE HangHoa.MaHH =SLCanXuat.MaHH
					UPDATE dbo.HangHoa
					SET	SoLuongTon = SoLuongTonMoi
					FROM NewSLTonXuat
					WHERE HangHoa.MaHH = NewSLTonXuat.MaHH AND HangHoa.MaHH = @MaHH
				END 

			ELSE
			PRINT N'Số lượng tồn không đủ đến xuất khẩu.'
		END					
	ELSE
		PRINT N'Không có ' + @MaHH + ' trong DataBase.'
GO


--b.
ALTER PROC usp_UpdateMotHoaDon
	@SoHD CHAR(5)
AS
	IF EXISTS(SELECT * FROM dbo.HoaDon WHERE SoHD = @SoHD)
		BEGIN
			DROP TABLE IF EXISTS ValuesMotHH
			SELECT B.SoHD,SUM(B.DonGia * B.SoLuong) AS TongTGHH
			INTO ValuesMotHH
			FROM dbo.HoaDon A, dbo.CT_HoaDon B
			WHERE A.SoHD = B.SoHD
			GROUP BY B.SoHD


			UPDATE dbo.HoaDon
			SET TongTG = CONVERT(INT, ValuesMotHH.TongTGHH)
			FROM dbo.ValuesMotHH
			WHERE ValuesMotHH.SoHD = HoaDon.SoHD AND HoaDon.SoHD = @SoHD
		END
	ELSE
	PRINT N'Không có mặt hàng hóa đơn ' + @SoHD + '.'
GO

EXEC usp_UpdateMotHoaDon'N0001'


--c.
CREATE PROC usp_AllInformationAboutHH
	@SoHD CHAR(5)
AS
	IF EXISTS(SELECT * FROM dbo.HoaDon WHERE SoHD = @SoHD)
		BEGIN
		SELECT *
		FROM dbo.HoaDon A, dbo.CT_HoaDon B, dbo.DoiTac C
		WHERE A.SoHD = B.SoHD AND A.MaDT = C.MADT AND @SoHD = A.SoHD
		END
	ELSE
		PRINT N'Không có mặt hàng hóa đơn ' + @SoHD + '.'
GO

EXEC usp_AllInformationAboutHH 'N0001'
