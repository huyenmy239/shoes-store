# Hệ Thống Quản Lý Cửa Hàng Giày

## Giới Thiệu Dự Án

Dự án này nhằm phát triển một hệ thống quản lý cơ sở dữ liệu toàn diện cho cửa hàng giày TEAM-9, để xử lý các khía cạnh khác nhau của hoạt động cửa hàng, bao gồm quản lý hàng tồn kho, xử lý đơn hàng, quản lý khách hàng và báo cáo doanh số.

## Thành Viên Nhóm
- **Nguyễn Thị Huyền My** (N21DCCN147)
- **Lê Ngọc Luân** (N21DCCN144)
- **Nguyễn Đình Luật** (N21DCCN145)
- **Đặng Xuân Nam** (N21DCCN148)

## Giảng Viên Hướng Dẫn
- **Nguyễn Thị Bích Nguyên**

## Mục Lục
- [Giới Thiệu Dự Án](#giới-thiệu-dự-án)
- [Thành Viên Nhóm](#thành-viên-nhóm)
- [Giảng Viên Hướng Dẫn](#giảng-viên-hướng-dẫn)
- [Tính Năng](#tính-năng)
- [Yêu Cầu Hệ Thống](#yêu-cầu-hệ-thống)
- [Cài Đặt](#cài-đặt)
- [Cơ Sở Dữ Liệu](#cơ-sở-dữ-liệu)
- [Sử Dụng](#sử-dụng)
- [Sao Lưu và Phục Hồi](#sao-lưu-và-phục-hồi)

## Tính Năng
### Quản Lý
- Xem và quản lý thông tin sản phẩm.
- Thêm và xóa tài khoản nhân viên.
- Chỉnh sửa chi tiết nhân viên.
- Xem các đơn hàng đã xử lý và đang xử lý.
- Tạo báo cáo doanh số.

### Nhân Viên
- Đăng nhập vào hệ thống.
- Thay đổi mật khẩu tài khoản.
- Quản lý hàng tồn kho.
- Cập nhật các sự kiện khuyến mãi.
- Xử lý đơn hàng trực tuyến và tạo hóa đơn.
- Xử lý đổi trả và bảo hành sản phẩm.

### Khách Hàng
- Đăng ký và quản lý tài khoản cá nhân.
- Duyệt và mua sản phẩm.
- Quản lý giỏ hàng.
- Theo dõi trạng thái đơn hàng.
- Đăng nhận xét sản phẩm.
- Yêu cầu đổi trả và bảo hành sản phẩm.

## Yêu Cầu Hệ Thống
- **Cơ sở dữ liệu**: MySQL hoặc bất kỳ hệ thống cơ sở dữ liệu quan hệ nào hỗ trợ SQL.
- **Backend**: Python, Django.
- **Frontend**: HTML, CSS, JavaScript.

## Cài Đặt
1. Clone repository từ GitHub:
    ```bash
    git clone <repository_url>
    cd shoe-store-management
    ```

## Cơ Sở Dữ Liệu
### Các Thực Thể và Quan Hệ
- **QTQuanLy**: Lưu trữ thông tin về các giai đoạn quản lý.
- **NhanVien**: Lưu trữ chi tiết nhân viên.
- **Loai**: Lưu trữ các loại sản phẩm.
- **Hang**: Lưu trữ các nhãn hiệu sản phẩm.
- **SanPham**: Lưu trữ chi tiết sản phẩm.
- **PhieuBH**: Lưu trữ chi tiết bảo hành.
- **KhachHang**: Lưu trữ chi tiết khách hàng.
- **DatHang**: Lưu trữ chi tiết đơn hàng.
- **GiaoHang**: Lưu trữ chi tiết giao hàng.
- **KhuyenMai**: Lưu trữ chi tiết khuyến mãi.
- **DoiTra**: Lưu trữ chi tiết đổi trả.
- **HoaDon**: Lưu trữ chi tiết hóa đơn.

### Chuẩn Hóa
Cơ sở dữ liệu được thiết kế theo dạng chuẩn ba (3NF) để đảm bảo tính toàn vẹn dữ liệu và loại bỏ sự dư thừa.

### Sơ Đồ
Tài liệu này chứa các sơ đồ thực thể-quan hệ chi tiết minh họa cấu trúc cơ sở dữ liệu và các mối quan hệ giữa các thực thể khác nhau.

## Sử Dụng
- **Quản Lý**: Quản lý có thể truy cập admin panel để giám sát hoạt động cửa hàng, quản lý nhân viên và tạo báo cáo.
- **Nhân Viên**: Nhân viên có thể đăng nhập vào hệ thống để quản lý sản phẩm, xử lý đơn hàng và giải quyết các câu hỏi của khách hàng.
- **Khách Hàng**: Khách hàng có thể tạo tài khoản, duyệt sản phẩm, mua hàng và theo dõi đơn hàng thông qua giao diện người dùng.

## Sao Lưu và Phục Hồi
### Sao Lưu
1. Truy cập công cụ quản lý cơ sở dữ liệu.
2. Chọn cơ sở dữ liệu.
3. Chọn tùy chọn "Export" và lưu file sao lưu.

### Phục Hồi
1. Truy cập công cụ quản lý cơ sở dữ liệu.
2. Chọn cơ sở dữ liệu.
3. Chọn tùy chọn "Import" và tải lên file sao lưu.

### Sao Lưu Định Kỳ
Tham khảo tài liệu quản lý cơ sở dữ liệu của hệ thống để thiết lập sao lưu định kỳ bằng cron jobs hoặc bất kỳ công cụ lập lịch nào khác.