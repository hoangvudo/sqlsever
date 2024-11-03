-- Tạo cơ sở dữ liệu Quan_Ly_Caffe
CREATE DATABASE Quan_Ly_Caffe;
GO

-- Sử dụng cơ sở dữ liệu vừa tạo
USE Quan_Ly_Caffe;
GO

-- Bảng NhaCungCap (Nhà Cung Cấp)
CREATE TABLE NhaCungCap (
    MaNCC VARCHAR(10) PRIMARY KEY,
    TenNCC VARCHAR(100) NOT NULL,
    DiaChi VARCHAR(200),
    SDT VARCHAR(15)
);

-- Bảng LoaiKH (Loại Khách Hàng)
CREATE TABLE LoaiKH (
    MaLKH VARCHAR(10) PRIMARY KEY,
    TenLKH VARCHAR(100) NOT NULL,
    GiamGia DECIMAL(5, 2)
);

-- Bảng KhachHang (Khách Hàng)
CREATE TABLE KhachHang (
    MaKH VARCHAR(10) PRIMARY KEY,
    TenKH VARCHAR(100) NOT NULL,
    DiaChi VARCHAR(200),
    SDT VARCHAR(15),
    MaLKH VARCHAR(10),
    FOREIGN KEY (MaLKH) REFERENCES LoaiKH(MaLKH)
);

-- Bảng NhanVien (Nhân Viên)
CREATE TABLE NhanVien (
    MaNV VARCHAR(10) PRIMARY KEY,
    TenNV VARCHAR(100) NOT NULL,
    DiaChi VARCHAR(200),
    SDT VARCHAR(15),
    ChucVu VARCHAR(50) NOT NULL
);

-- Bảng SanPham (Sản Phẩm)
CREATE TABLE SanPham (
    MaSP VARCHAR(10) PRIMARY KEY,
    TenSP VARCHAR(100) NOT NULL,
    SoLuong INT,
    Gia DECIMAL(10, 2),
    MaNCC VARCHAR(10),
    FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
);

-- Bảng KhuVuc (Khu vực)
CREATE TABLE KhuVuc (
    MaKV VARCHAR(10) PRIMARY KEY,
    TenKV VARCHAR(100) NOT NULL
);

-- Bảng Ban (Bàn)
CREATE TABLE Ban (
    MaBan VARCHAR(10) PRIMARY KEY,
    TenBan VARCHAR(100) NOT NULL,
    MaKV VARCHAR(10),
    FOREIGN KEY (MaKV) REFERENCES KhuVuc(MaKV)
);

-- Bảng HoaDon (Hóa Đơn)
CREATE TABLE HoaDon (
    MaHD VARCHAR(10) PRIMARY KEY,
    NgayLap DATE NOT NULL,
    TongTien DECIMAL(15, 2),
    MaNV VARCHAR(10),
    MaKH VARCHAR(10),
    MaBan VARCHAR(10),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
    FOREIGN KEY (MaBan) REFERENCES Ban(MaBan)
);

-- Bảng ChiTietHoaDon (Chi Tiết Hóa Đơn)
CREATE TABLE ChiTietHoaDon (
    MaHD VARCHAR(10),
    MaSP VARCHAR(10),
    SoLuong INT,
    Gia DECIMAL(10, 2),
    PRIMARY KEY (MaHD, MaSP),
    FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

-- Nhập dữ liệu bảng Nhà Cung Cấp

INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, SDT)
VALUES 
    ('NCC001', 'Cong Ty Thuc Pham ABC', '123 Pham Van Dong, TP HCM', '0123456789'),
    ('NCC002', 'Cong Ty Do Uong XYZ', '456 Nguyen Van Linh, TP HCM', '0987654321'),
    ('NCC003', 'Cong Ty Banh Keo KLM', '789 Le Loi, TP HCM', '0901234567'),
    ('NCC004', 'Cong Ty Do Gia Dung EFG', '101 Tran Hung Dao, TP HCM', '0912345678'),
    ('NCC005', 'Cong Ty Noi That HIJ', '202 Vo Van Tan, TP HCM', '0923456789'),
    ('NCC006', 'Cong Ty Dien Tu LMN', '303 Dien Bien Phu, TP HCM', '0934567890'),
    ('NCC007', 'Cong Ty Nuoc Giai Khat OPQ', '404 Pham Ngoc Thach, TP HCM', '0945678901'),
    ('NCC008', 'Cong Ty Thuc Pham Tuoi RST', '505 Nguyen Thi Minh Khai, TP HCM', '0956789012'),
    ('NCC009', 'Cong Ty Do Choi UVW', '606 Cach Mang Thang Tam, TP HCM', '0967890123'),
    ('NCC010', 'Cong Ty Sua XYZ', '707 Pasteur, TP HCM', '0978901234');

	-- Nhập dữ liệu bảng Loại Khách Hàng
	INSERT INTO LoaiKH (MaLKH, TenLKH, GiamGia)
VALUES 
    ('LKH001', 'Khach Hang VIP', 10),
    ('LKH002', 'Khach Hang Thuong', 0),
    ('LKH003', 'Khach Hang Tiem Nang', 5),
    ('LKH004', 'Khach Hang Than Thiet', 8),
    ('LKH005', 'Khach Hang Moi', 2),
    ('LKH006', 'Khach Hang Dac Biet', 12),
    ('LKH007', 'Khach Hang Truc Tuyen', 6),
    ('LKH008', 'Khach Hang Cu', 3),
    ('LKH009', 'Khach Hang Cao Cap', 15),
    ('LKH010', 'Khach Hang Thuong Xuyen', 7);


	-- Nhập dữ liệu bảng Khách Hàng
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, SDT, MaLKH)
VALUES 
    ('KH001', 'Nguyen Huu Phuc', '25 Pham Ngoc Thach, Quan 1, TP HCM', '0912345678', 'LKH001'),
    ('KH002', 'Tran Thanh Ha', '15 Nguyen Van Troi, Quan 3, TP HCM', '0934567890', 'LKH002'),
    ('KH003', 'Pham Van Cuong', '105 Cong Hoa, Tan Binh, TP HCM', '0945678901', 'LKH003'),
    ('KH004', 'Le Thi Thuy', '68 Tran Quang Khai, Quan 1, TP HCM', '0956789012', 'LKH004'),
    ('KH005', 'Dinh Van Minh', '12 Bui Vien, Quan 1, TP HCM', '0967890123', 'LKH005'),
    ('KH006', 'Ngo Hoang Anh', '23 Nguyen Hue, Quan 1, TP HCM', '0978901234', 'LKH006'),
    ('KH007', 'Hoang Thi Le', '40 Ly Tu Trong, Quan 1, TP HCM', '0989012345', 'LKH007'),
    ('KH008', 'Vu Quynh Nhu', '11 Ba Huyen Thanh Quan, Quan 3, TP HCM', '0990123456', 'LKH008'),
    ('KH009', 'Trinh Thi Dung', '19 Nguyen Thi Minh Khai, Quan 3, TP HCM', '0911234567', 'LKH009'),
    ('KH010', 'Doan Huu Khanh', '78 Tran Hung Dao, Quan 5, TP HCM', '0922345678', 'LKH010');

	-- Nhập dữ liệu bảng Nhân Viên
INSERT INTO NhanVien (MaNV, TenNV, DiaChi, SDT, ChucVu)
VALUES 
    ('NV001', 'Le Van Binh', '22 Pasteur, Quan 3, TP HCM', '0945678901', 'Quan Ly'),
    ('NV002', 'Pham Thi Hong', '125 Le Duan, Quan 1, TP HCM', '0956789012', 'Nhan Vien'),
    ('NV003', 'Nguyen Van Tai', '77 Nguyen Dinh Chieu, Quan 3, TP HCM', '0967890123', 'Thu Ngan'),
    ('NV004', 'Tran Quang Hai', '88 Vo Thi Sau, Quan 3, TP HCM', '0978901234', 'Pha Che'),
    ('NV005', 'Dinh Ngoc Linh', '99 Nguyen Thi Minh Khai, Quan 1, TP HCM', '0989012345', 'Bao Ve'),
    ('NV006', 'Le Thi Ngoc Mai', '60 Ly Tu Trong, Quan 1, TP HCM', '0990123456', 'Phuc Vu'),
    ('NV007', 'Ngo Thanh Tam', '21 Tran Hung Dao, Quan 5, TP HCM', '0911234567', 'Quan Ly'),
    ('NV008', 'Pham Cong Minh', '35 Phan Dinh Phung, Phu Nhuan, TP HCM', '0922345678', 'Nhan Vien'),
    ('NV009', 'Nguyen Thi Thanh', '12 Vo Van Tan, Quan 3, TP HCM', '0933456789', 'Thu Ngan'),
    ('NV010', 'Tran Thanh Son', '45 Hai Ba Trung, Quan 1, TP HCM', '0944567890', 'Pha Che');



	-- Du lieu cho bang SanPham
INSERT INTO SanPham (MaSP, TenSP, SoLuong, Gia, MaNCC)
VALUES 
    ('SP001', 'Cafe Den', 100, 15000, 'NCC001'),
    ('SP002', 'Cafe Sua', 100, 20000, 'NCC001'),
    ('SP003', 'Nuoc Cam', 50, 25000, 'NCC002'),
    ('SP004', 'Sinh To Xoai', 30, 30000, 'NCC002'),
    ('SP005', 'Banh Ngot', 40, 10000, 'NCC003'),
    ('SP006', 'Tra Dao', 60, 15000, 'NCC003'),
    ('SP007', 'Nuoc Ngot', 80, 12000, 'NCC004'),
    ('SP008', 'Banh Sandwich', 20, 18000, 'NCC005'),
    ('SP009', 'Kem Tuoi', 25, 20000, 'NCC006'),
    ('SP010', 'Nuoc Suoi', 200, 5000, 'NCC007');

-- Du lieu  cho bang KhuVuc
INSERT INTO KhuVuc (MaKV, TenKV)
VALUES 
    ('KV001', 'Trong Nha'),
    ('KV002', 'Ngoai Troi'),
    ('KV003', 'Tang 1'),
    ('KV004', 'Tang 2'),
    ('KV005', 'San Thuong'),
    ('KV006', 'Phong VIP'),
    ('KV007', 'Phong Thuong'),
    ('KV008', 'Khu San Vuon'),
    ('KV009', 'Khu Lau 1'),
    ('KV010', 'Khu Lau 2');

-- Du lieu mau cho bang Ban
INSERT INTO Ban (MaBan, TenBan, MaKV)
VALUES 
    ('B001', 'Ban 1', 'KV001'),
    ('B002', 'Ban 2', 'KV002'),
    ('B003', 'Ban 3', 'KV003'),
    ('B004', 'Ban 4', 'KV004'),
    ('B005', 'Ban 5', 'KV005'),
    ('B006', 'Ban 6', 'KV006'),
    ('B007', 'Ban 7', 'KV007'),
    ('B008', 'Ban 8', 'KV008'),
    ('B009', 'Ban 9', 'KV009'),
    ('B010', 'Ban 10', 'KV010');

-- Du lieu mau cho bang HoaDon
INSERT INTO HoaDon (MaHD, NgayLap, TongTien, MaNV, MaKH, MaBan)
VALUES 
    ('HD001', '2024-10-31', 67000, 'NV001', 'KH001', 'B001'),
    ('HD002', '2024-10-31', 50000, 'NV002', 'KH002', 'B002'),
    ('HD003', '2024-10-31', 80000, 'NV003', 'KH003', 'B003'),
    ('HD004', '2024-10-31', 45000, 'NV004', 'KH004', 'B004'),
    ('HD005', '2024-10-31', 32000, 'NV005', 'KH005', 'B005'),
    ('HD006', '2024-10-31', 90000, 'NV006', 'KH006', 'B006'),
    ('HD007', '2024-10-31', 78000, 'NV007', 'KH007', 'B007'),
    ('HD008', '2024-10-31', 85000, 'NV008', 'KH008', 'B008'),
    ('HD009', '2024-10-31', 76000, 'NV009', 'KH009', 'B009'),
    ('HD010', '2024-10-31', 54000, 'NV010', 'KH010', 'B010');

-- Du lieu mau cho bang ChiTietHoaDon
INSERT INTO ChiTietHoaDon (MaHD, MaSP, SoLuong, Gia)
VALUES 
    ('HD001', 'SP001', 2, 15000),
    ('HD001', 'SP003', 1, 25000),
    ('HD002', 'SP002', 2, 20000),
    ('HD002', 'SP004', 1, 30000),
    ('HD003', 'SP005', 3, 10000),
    ('HD003', 'SP006', 1, 15000),
    ('HD004', 'SP007', 2, 12000),
    ('HD004', 'SP008', 1, 18000),
    ('HD005', 'SP009', 1, 20000),
    ('HD005', 'SP010', 5, 5000);

 -- Sử dụng câu lệnh Select
 -- 1. Lấy tất cả thông tin từ bảng NhaCungCap:
 SELECT * FROM NhaCungCap;

 -- 2. Lấy tên và số điện thoại của các nhà cung cấp:
SELECT TenNCC, SDT FROM NhaCungCap;

-- 3. Lấy tất cả thông tin khách hàng có loại khách hàng là "Khach Hang VIP":
SELECT * FROM KhachHang WHERE MaLKH = 'LKH001';

-- 4. Tính tổng số tiền hóa đơn của tất cả khách hàng:
SELECT SUM(TongTien) AS TongTienHoaDon FROM HoaDon;

-- 5. Lấy danh sách sản phẩm có số lượng lớn hơn 50:
SELECT * FROM SanPham WHERE SoLuong > 50;

-- 6. Lấy danh sách nhân viên có chức vụ là "Quan Ly":
SELECT * FROM NhanVien WHERE ChucVu = 'Quan Ly';

-- 7. Lấy tên sản phẩm và giá của sản phẩm có mã là 'SP001':
SELECT TenSP, Gia FROM SanPham WHERE MaSP = 'SP001';

-- 8. Lấy danh sách hóa đơn được lập vào ngày '2024-10-31':
SELECT * FROM HoaDon WHERE NgayLap = '2024-10-31';

-- 9. Lấy số lượng và giá của từng sản phẩm trong hóa đơn có mã là 'HD001':
SELECT 
    ct.MaSP, 
    sp.TenSP, 
    ct.SoLuong, 
    ct.Gia
FROM 
    ChiTietHoaDon ct
JOIN 
    SanPham sp ON ct.MaSP = sp.MaSP
WHERE 
    ct.MaHD = 'HD001';

-- 10. Lấy tên và địa chỉ của tất cả khách hàng, sắp xếp theo chữ cái đầu khách hàng:
SELECT TenKH, DiaChi FROM KhachHang ORDER BY TenKH;

-- Tao Khung Nhìn
-- 1. Khung nhìn cho danh sách nhà cung cấp cùng với địa chỉ và số điện thoại:
CREATE VIEW DanhSachNhaCungCap AS
SELECT TenNCC, DiaChi, SDT
FROM NhaCungCap;

 -- câu lệnh thực hiện
SELECT * FROM DanhSachNhaCungCap;

-- 2. Khung nhìn cho thông tin khách hàng và loại khách hàng:
CREATE VIEW KhachHangVaLoai AS
SELECT KH.TenKH, KH.DiaChi, KH.SDT, LKH.TenLKH
FROM KhachHang KH
JOIN LoaiKH LKH ON KH.MaLKH = LKH.MaLKH;

-- Câu lệnh thực hiện
SELECT * FROM KhachHangVaLoai;

-- 3. Khung nhìn cho danh sách hóa đơn cùng với tên nhân viên và tên khách hàng:
CREATE VIEW HoaDonVaKhach AS
SELECT HD.MaHD, HD.NgayLap, HD.TongTien, NV.TenNV, KH.TenKH
FROM HoaDon HD
JOIN NhanVien NV ON HD.MaNV = NV.MaNV
JOIN KhachHang KH ON HD.MaKH = KH.MaKH;

-- Câu lệnh thực hiện
SELECT * FROM HoaDonVaKhach;

-- 4. Khung nhìn cho danh sách sản phẩm và nhà cung cấp tương ứng:
CREATE VIEW SanPhamVaNhaCungCap AS
SELECT SP.TenSP, SP.Gia, NCC.TenNCC
FROM SanPham SP
JOIN NhaCungCap NCC ON SP.MaNCC = NCC.MaNCC;

-- Câu lệnh thực hiện
 SELECT * FROM SanPhamVaNhaCungCap;

-- 5. Khung nhìn cho chi tiết hóa đơn bao gồm sản phẩm và số lượng:
CREATE VIEW ChiTietHoaDonn AS
SELECT HD.MaHD, SP.TenSP, CTHD.SoLuong, CTHD.Gia
FROM ChiTietHoaDon CTHD
JOIN HoaDon HD ON CTHD.MaHD = HD.MaHD
JOIN SanPham SP ON CTHD.MaSP = SP.MaSP;

-- Câu lệnh thực hiện 
SELECT * FROM ChiTietHoaDonn;


-- Viết thủ tục , hàm , trigger

-- 1. Thủ tục thêm
-- Thủ tục này sẽ thêm một sản phẩm mới vào bảng SanPham.

CREATE PROCEDURE ThemSanPham
    @MaSP Varchar(10),  
    @TenSP NVARCHAR(100),
    @Gia DECIMAL(10, 2),
    @SoLuong INT
AS
BEGIN
    INSERT INTO SanPham (MaSP, TenSP, Gia, SoLuong)
    VALUES (@MaSP, @TenSP, @Gia, @SoLuong);
END;

EXEC ThemSanPham @MaSP = 'SP011', @TenSP = 'Bo Huc', @Gia = 10000, @SoLuong = 5;


-- 2 SỬA SẢN PHẨM
CREATE PROCEDURE SuaSanPham
    @MaSP Varchar(10),  
    @TenSP NVARCHAR(100),
    @Gia DECIMAL(10, 2),
    @SoLuong INT,
    @MaNcc Varchar(10)
AS
BEGIN
    UPDATE SanPham
    SET TenSP = @TenSP, Gia = @Gia, SoLuong = @SoLuong, MaNCC = @MaNcc
    WHERE MaSP = @MaSP;
END;

EXEC SuaSanPham @MaSP = 'SP011', @TenSP = 'Tra Da', @Gia = 5000, @SoLuong = 100, @MaNcc = 'NCC001';  


-- 3 Xóa sản phẩm
CREATE PROCEDURE XoaSanPham
    @MaSP VARCHAR(10)  -- Sử dụng VARCHAR thay vì INT
AS
BEGIN
    -- Kiểm tra xem sản phẩm có tồn tại trước khi xóa
    IF EXISTS (SELECT 1 FROM SanPham WHERE MaSP = @MaSP)
    BEGIN
        DELETE FROM SanPham
        WHERE MaSP = @MaSP;

        PRINT 'San pham duoc xoa thanh cong.';
    END
    ELSE
    BEGIN
        PRINT 'Khong tim thay san pham voi ma: ' + @MaSP;
    END
END;

EXEC XoaSanPham @MaSP = 'SP013';

-- 4. Xem dữ liệu

CREATE PROCEDURE XemSanPham
AS
BEGIN
    SELECT * FROM SanPham;
END;

EXEC XemSanPham;

-- 5. Trigger cho thao tác thêm

CREATE TRIGGER TriggerThemSanPham
ON SanPham
AFTER INSERT
AS
BEGIN
    PRINT 'Đã thêm sản phẩm mới';
END;

--6 Tạo hàm tìm kiếm khách hàng theo Họ

CREATE FUNCTION TimKhachHangTheoTen
    (@TenKH NVARCHAR(100))  
RETURNS TABLE
AS
RETURN 
(
    SELECT MaKH, TenKH, SDT
    FROM KhachHang
    WHERE TenKH LIKE '%' + @TenKH + '%'
);

SELECT * 
FROM TimKhachHangTheoTen('Dinh');


-- Tạo người dùng

CREATE LOGIN QUAN_LY WITH PASSWORD = 'Vu123@';
CREATE LOGIN NHAN_VIEN WITH PASSWORD = 'Vu123@';
CREATE LOGIN NGUOI_DUNG WITH PASSWORD = 'Vu123@';


-- Sử dụng cơ sở dữ liệu vừa tạo
USE Quan_Ly_Caffe;
GO


-- Tạo người dùng cho chủ quán
CREATE USER QUAN_LY_USER FOR LOGIN QUAN_LY;

-- Tạo người dùng cho nhân viên
CREATE USER NHAN_VIEN_USER FOR LOGIN NHAN_VIEN;

-- Tạo người dùng cho người dùng
CREATE USER NGUOI_DUNG_USER FOR LOGIN NGUOI_DUNG;


-- Tạo vai trò cho chủ quán
CREATE ROLE Role_QuanLy;

-- Cấp quyền cho vai trò chủ quán
GRANT SELECT, INSERT, UPDATE, DELETE ON NhanVien TO Role_QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON KhachHang TO Role_QuanLy;

-- Tạo vai trò cho nhân viên
CREATE ROLE Role_NhanVien;

-- Cấp quyền cho vai trò nhân viên (chỉ được quyền xem)
GRANT SELECT ON KhachHang TO Role_NhanVien;

-- Tạo vai trò cho người dùng
CREATE ROLE Role_NguoiDung;

-- Cấp quyền cho vai trò người dùng (chỉ được quyền xem)
GRANT SELECT ON KhachHang TO Role_NguoiDung;

-- Kiểm tra quyền của người dùng
EXECUTE AS USER = 'QUAN_LY_USER';
SELECT * FROM fn_my_permissions(NULL, 'DATABASE'); 
REVERT;

EXECUTE AS USER = 'NHAN_VIEN_USER';
SELECT * FROM fn_my_permissions(NULL, 'DATABASE'); 
REVERT;

EXECUTE AS USER = 'NGUOI_DUNG_USER';
SELECT * FROM fn_my_permissions(NULL, 'DATABASE'); 
REVERT;






