/* Học phần: Cơ sở dữ liệu
   Người thực hiện: Nguyễn Điền Thái Bảo
   MSSV: 2112966
   Lớp: CTK45B
   Ngày bắt đầu: 23/02/2023
   Ngày kết thúc: 04/04/2023
*/	

---------------------------------------------------
-----------ĐỊNH NGHĨA CƠ SỞ DỮ LIỆU----------------
CREATE DATABASE Lab04_QLBao
go
use Lab04_QLBao
go

create table BAO_TCHI
(MaBaoTC char (5) primary key,
Ten Nvarchar (30),
DinhKy Nvarchar(20),
SoLuong int,
GiaBan int
)
go

create table PhatHanh
(MaBaoTC char(5) references BAO_TCHI(MaBaoTC),
SoBaoTC int ,
NgayPhatHanh Datetime ,
)
go

create table KHACHHANG
(MaKH char(5) primary key,
TenKH Nvarchar (20),
DiaCHi Nvarchar (10),
)
go

create table DATBAO
(MaKH char(5) references KHACHHANG(MaKH),
MaBaoTC char (5) references BAO_TCHI(MaBaoTC),
SLMua int,
NgayDM datetime
)
go

-------------------------------------------------
-------------NHẬP DỮ LIỆU CHO CÁC BẢNG-----------
insert into BAO_TCHI values('TT01',N'Tuổi trẻ',N'Nhật báo',1000,1500)
insert into BAO_TCHI values ('KT01',N'Kiến Thức ngày nay',N'Bán Nguyệt San',3000,6000)
insert into BAO_TCHI values ('TN01',N'Thanh Niên',N'Nhật báo',1000,2000)
insert into BAO_TCHI values ('PN01',N'Phụ Nữ',N'Tuần báo',2000,4000)
insert into BAO_TCHI values ('PN02',N'Phụ Nữ',N'Nhật báo',1000,2000)

set dateformat dmy 
insert into PhatHanh values ('TT01',123,'15/12/2005')
insert into PhatHanh values ('KT01',70,'15/12/2005')
insert into PhatHanh values ('TT01',124,'16/12/2005')
insert into PhatHanh values ('TN01',256,'17/12/2005')
insert into PhatHanh values ('PN01',45,'23/12/2005')
insert into PhatHanh values ('PN02',111,'18/12/2005')
insert into PhatHanh values ('PN02',112,'19/12/2005')
insert into PhatHanh values ('TT01',125,'17/12/2005')
insert into PhatHanh values ('PN01',46,'30/12/2005')

insert into KHACHHANG values ('KH01',N'LAM',N'2 NCT')
insert into KHACHHANG values ('KH02',N'NAM',N'32 THĐ')
insert into KHACHHANG values ('KH03',N'NGỌC',N'16 LHP')

insert into DATBAO values ('KH01',N'TT01',100,'12/01/2000')
insert into DATBAO values ('KH02',N'TN01',150,'01/05/2001')
insert into DATBAO values ('KH01',N'PN01',200,'25/06/2001')
insert into DATBAO values ('KH03',N'KT01',50,'17/03/2002')
insert into DATBAO values ('KH03',N'PN02',200,'26/08/2003')
insert into DATBAO values ('KH02',N'TT01',250,'15/01/2004')
insert into DATBAO values ('KH01',N'KT01',300,'14/10/2004')

select * from BAO_TCHI
select * from PhatHanh
select * from KHACHHANG
select * from DATBAO

-------------------------------------------------
----------------TRUY VẤN DỮ LIỆU-----------------
--1) Cho biết các tờ báo, tạp chí có định kỳ phát hành hàng tuần
select MaBaoTC,Ten,GiaBan
from BAO_TCHI
where BAO_TCHI.DinhKy = N'Tuần báo'

--2) Cho biết thông tin về các tờ báo thuộc loại báo phụ nữ
select * 
from BAO_TCHI
where BAO_TCHI.MaBaoTC like '%PN%'

--3) Cho biết tên các khánh hàng có đặt mua báo phụ nữ
select DISTINCT TenKH,DiaChi
from KHACHHANG a, DATBAO b
where a.MaKH = b.MaKH and b.MaBaoTC like '%PN%'

--4) Cho biết tên các khách hàng có đặt mua tất cả các báo phụ nữ
select TenKH,DiaChi
from KHACHHANG a, DATBAO b
where a.MaKH=b.MaKH and b.MaBaoTC = 'PN01' and b.MaBaoTC = 'PN02'

--5) Cho biết các khách hàng không đặt mua báo thanh niên
select	*
From	KHACHHANG 
Where	MaKH NOT IN (Select	    A.MaKH
						From	DATBAO A,BAO_TCHI b
						Where	A.MaBaoTC = B.MaBaoTC and B.MaBaoTC = N'TN01')

--6) Cho biết số tờ báo mà mỗi khách hàng đã đặt mua 
select TenKH,sum(SLmua)as soluongmua
from KHACHHANG a, DATBAO b
where a.MaKH = b.MaKH
group by TenKH

--7) Cho biết số khách hàng đặt mua báo trong năm 2004
select NgayDM, count(b.MaKH) as soKhachHang
from KHACHHANG a,DATBAO b
where a.MaKH = b.MaKH and year(NgayDM)=2004
group by NgayDM

--8) Cho biết thông tin đặt mua báo của các khách hàng
select TenKh,Ten,DinhKy,SLMua,(DatBao.SLMua*BAO_TCHI.GiaBan) as SoTien
from KHACHHANG,BAO_TCHI,DATBAO
where KHACHHANG.MaKH = DATBAO.MaKH and BAO_TCHI.MaBaoTC = DATBAO.MaBaoTC
order by TenKH

--9) Cho biết các tờ báo, tạp chí và tổng số lượng đặt mua của các khách hàng đối với tờ báo, tạp chí đó
select Ten,DinhKy,Sum(SlMua)as SoluongMua
from BAO_TCHI A,DATBAO B
where A.MaBaoTC=B.MaBaoTC
group by Ten,DinhKy

--10) Cho biết tên các tờ báo dành cho học sinh, sinh viên
select * 
from BAO_TCHI A
where A.MaBaoTC like '%HS'

--11) Cho biết những tờ báo không có người đặt mua
select	*
From	BAO_TCHI 
Where	MaBaoTC NOT IN (Select	    A.MaBaoTC
						From	DATBAO A,KHACHHANG b
						Where	A.MaKH = B.MaKH)

--12) Cho biết tên, định kỳ của những tờ báo có nhiều người đặt mua nhất
select Ten,DinhKy
from BAO_TCHI,DATBAO
Where	BAO_TCHI.MaBaoTC = DATBAO.MaBaoTC  and
		DATBAO.SLMua = (Select Max(F.SLMua)
						From	BAO_TCHI E, DATBAO F
						Where	BAO_TCHI.MaBaoTC = DATBAO.MaBaoTC )

--13) Cho biết khách hàng đặt mua nhiều báo, tạp chí nhất
select DISTINCT TenKH, DiaChi
from KHACHHANG,DATBAO
where KHACHHANG.MaKH = DATBAO.MaKH and DATBAO.SLMua = (Select Max(F.SLMua)
						From	KHACHHANG E, DATBAO F
						Where	E.MaKH = F.MaKH )

--14) Cho biết các tờ báo phát hành định kỳ một tháng 2 lần
select MaBaoTC,GiaBan
from BAO_TCHI
where BAO_TCHI.DinhKy = N'Bán Nguyệt San'

--15) Cho biết các tờ báo, tạp chí có từ 3 khách hàng đặt mua trở lên
Select	 a.MaBaoTC,Ten, COUNT(c.MaKH) As SanPham
From	BAO_TCHI A, DATBAO C
Where	A.MaBaoTC = C.MaBaoTC
Group by	A.MaBaoTC, Ten
Having	COUNT( DISTINCT MaKH) >= 3

-------------------------------------------------
----------------THỦ TỤC & HÀM--------------------
--Aa) Tính tổng số tiền mua báo/tạp chí của một khách hàng cho trước
create function fn_TongTienMua(@MaKh char(5)) returns int
As
Begin
	declare @TongTienMua int
	if exists (select * from KHACHHANG where MaKH = @MaKh) 
		Begin

		select @TongTienMua = sum(SLMua * GiaBan)
		from	BAO_TCHI A, DATBAO B	
		where	A.MaBaoTC = B.MaBaoTC and B.MaKH = @MaKh
		End	
	 	
return @TongTienMua
End
------Thử nghiệm hàm-------
print dbo.fn_TongTienMua('KH01')

--Ab) Tính tổng số tiền thu được của một tờ báo/tạp chí cho trước
create function fn_TongTienThu(@MaBaoTapChi char(5)) returns int
As
Begin
	declare @TongTienThu int
	if exists (select * from BAO_TCHI where MaBaoTC = @MaBaoTapChi) 
		Begin
		
		select @TongTienThu = sum(SLMua * GiaBan)
		from	BAO_TCHI A, DATBAO B	
		where	A.MaBaoTC = B.MaBaoTC and A.MaBaoTC = @MaBaoTapChi
		End	
	 	
return @TongTienThu
End
------Thử nghiệm hàm-------
print dbo.fn_TongTienThu('TT01')

--Ba) In danh mục báo, tạp chí phải giao cho 1 hách hàng cho trước
create proc usp_InDanhMucBaoTChi @MaKH char(4)
as
	if exists(select * from KHACHHANG where MaKH = @MaKH)
		begin
			select C.MaKH, TenKH, DiaChi, A.MaBaoTC, Ten, SLMua, NgayDM, GiaBan
			from DATBAO A, BAO_TCHI B, KHACHHANG C
			where A.MaBaoTC = B.MaBaoTC and A.MaKH = C.MaKH and A.MaKH = @MaKH
		end
	else
		begin
			print N'Không tồn tại mã khách hàng đã nhập'
		end
go
------Thử nghiệm hàm-------
exec usp_InDanhMucBaoTChi 'KH01'

--Bb) In danh sách khách hàng đặt mua báo/tạp chí cho trước
create proc usp_DanhSachKhachHang 
	@MaBaoTC CHAR(4)
AS
	BEGIN
	    IF EXISTS (SELECT * FROM dbo.BAO_TCHI WHERE MaBaoTC = @MaBaoTC)
			BEGIN
			    SELECT B.TenKH, B.MaKH, SUM(C.SLMua) AS SoLuong, SUM(C.SLMua*A.GiaBan) AS DonGia
				FROM dbo.BAO_TCHI A, dbo.KHACHHANG B, dbo.DATBAO C
				WHERE A.MaBaoTC = C.MaBaoTC AND B.MaKH = C.MaKH AND @MaBaoTC = A.MaBaoTC
				GROUP BY B.TenKH, B.MaKH
			END
		ELSE
			PRINT N'Không có mã báo/tạp chí ' + @MaBaoTC + ' trong Database.'
	END
GO
------Thử nghiệm hàm-------
EXEC usp_DanhSachKhachHang 'TT01'