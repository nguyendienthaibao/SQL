/* Học phần: Cơ sở dữ liệu
   Người thực hiện: Nguyễn Điền Thái Bảo
   MSSV: 2112966
   Lớp: CTK45B
   Ngày bắt đầu: 23/02/2023
   Ngày kết thúc: 04/04/2023
*/	

---------------------------------------------------
-----------ĐỊNH NGHĨA CƠ SỞ DỮ LIỆU----------------
CREATE DATABASE Lab05_QLTour
go
use Lab05_QLTour
go

create table Tour
(MaTour char (5) primary key,
 TongSoNgay int
)
go

create table ThanhPho
(MaTP char(3) primary key ,
TenTP Nvarchar(20) 
)
go

create table Tour_TP
(MaTour char(5) references Tour(MaTour),
MaTP char(3) references ThanhPho(MaTP) ,
SoNgay int
)
go

create table Lich_TourDL
(MaTour char(5) references Tour(MaTour),
NgayKH datetime,
TenHDV nvarchar(10),
SoNguoi int,
TenKH nvarchar(30)
)
go

-------------------------------------------------
-------------NHẬP DỮ LIỆU CHO CÁC BẢNG-----------
insert into Tour values('T001',3)
insert into Tour values('T002',4)
insert into Tour values('T003',5)
insert into Tour values('T004',7)

insert into ThanhPho values ('01',N'Đà Lạt')
insert into ThanhPho values ('02',N'Nha Trang')
insert into ThanhPho values ('03',N'Phan Thiết')
insert into ThanhPho values ('04',N'Huế')
insert into ThanhPho values ('05',N'Đà Nắng')

insert into Tour_TP values ('T001','01',2 )
insert into Tour_TP values ('T001','03',1 )
insert into Tour_TP values ('T002','01',2 )
insert into Tour_TP values ('T002','02',2 )
insert into Tour_TP values ('T003','02',2 )
insert into Tour_TP values ('T003','01',1 )
insert into Tour_TP values ('T003','04',2 )
insert into Tour_TP values ('T004','02',2 )
insert into Tour_TP values ('T004','05',2 )
insert into Tour_TP values ('T004','04',3 )

set dateformat dmy 
insert into Lich_TourDL values('T001', '14/02/2017', N'Vân', 20, N'Nguyễn Hoàng')
insert into Lich_TourDL values('T002', '14/02/2017', N'Nam', 30, N'Lê Ngọc')
insert into Lich_TourDL values('T002', '06/03/2017', N'Hùng', 20, N'Lý Dũng')
insert into Lich_TourDL values('T003', '18/02/2017', N'Dũng', 20, N'Lý Dũng')
insert into Lich_TourDL values('T004', '18/02/2017', N'Hùng', 30, N'Dũng Nam')
insert into Lich_TourDL values('T003', '10/03/2017', N'Nam', 45, N'Nguyễn An')
insert into Lich_TourDL values('T002', '28/04/2017', N'Vân', 25, N'Ngọc Dung')
insert into Lich_TourDL values('T004', '29/04/2017', N'Dũng', 35, N'Lê Ngọc')
insert into Lich_TourDL values('T001', '30/04/2017', N'Nam', 25, N'Trần Nam')
insert into Lich_TourDL values('T003', '15/06/2017', N'Vân', 20, N'Trịnh Bá')

select * from Tour
select * from ThanhPho
select * from Tour_TP
select * from Lich_TourDL

-------------------------------------------------
----------------TRUY VẤN DỮ LIỆU-----------------
--a) Cho biết các tour du lịch có tổng số ngày của tour từ 3 đến 5 ngày
select MaTour, TongSongay
from Tour
where TongSongay >= 3 and TongSongay <= 5

--b) Cho biết thông tin các tour được tổ chức trong tháng 2 năm 2017
select DISTINCT* 
from Lich_TourDL A 
where MONTH(A.NgayKH) = 2 and YEAR(A.NgayKH) = 2017

--c) Cho biết các tour không đi qua thành phố 'Nha Trang'
select A.MaTour
from Tour_TP A
where A.MaTour not in (select B.MaTour
						from Tour_TP B
						where B.MaTP = '02')
group by A.MaTour

--d) Cho biết số lượng thành phố mà mỗi tour du lịch đi qua
select MaTour, count(MaTP) as SLTPDiQua
from Tour_TP
group by MaTour

--e) Cho biết số lượng tour du lịch mỗi hướng dẫn viên hướng dẫn
select TenHDV ,  Count(DISTINCT MaTour) as   SoLuongTour
from  Lich_TourDL
group by TenHDV

--f) Cho biết tên thành phố có nhiều tour du lịch đi qua nhất
select A.MaTP, TenTP
from Tour_TP A, ThanhPho B
where A.MaTP = B.MaTP
group by A.MaTP, TenTP
having count(A.MaTour) >=all (select count(C.MaTour)
							from Tour_TP C
							group by C.MaTP)

--g) Cho biết thông tin của tour du lịch đi qua tất cả thành phố
select B.MaTour, TongSoNgay
from Tour A, Tour_TP B
where A.MaTour = B.MaTour
group by B.MaTour, TongSongay
having count(B.MaTP) >= all (select Count(C.MaTP)
							from ThanhPho C)

--h) Lập danh sách các tour đi qua thành phố 'Đà Lạt'
select DISTINCT Lich_TourDL.MaTour, SoNgay
from Lich_TourDL,Tour_TP
where Lich_TourDL.MaTour =Tour_TP.MaTour
		and Tour_TP.MaTP= '01'

--i) Cho biết thông tin của tour du lịch có tổng số lượng khách tham gia nhiều nhất
select A.MaTour, TongSoNgay, sum(Songuoi) as TongSoNguoi
from Lich_TourDL A, Tour B
where A.MaTour = B.MaTour
group by A.MaTour, TongSoNgay
having sum(Songuoi) >=all (select sum(Songuoi)
							from Lich_TourDL D
							group by D.MaTour)
	
--j) Cho biết tên thành phố mà tất cả các tour du lịch đều đi qua
select TenTP
from ThanhPho A, Tour_TP B
where A.MaTP = B.MaTP
group by TenTP
having count(B.MaTour) >=all (select Count(C.MaTour)
							from Tour C)