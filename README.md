

## Họ tên: Phạm Tuấn Dương  
## MSSV: K205480106042  
## Lớp: 56KMT.01  
## Môn học: Lập trình Python  
## Đề tài: Giám sát giá bitcoin

## I. Mục tiêu
- Lấy dữ liệu bitcoin.
- Xử lý dữ liệu: sử dụng FastAPI và Node-RED, sau đó lưu vào cơ sở dữ liệu.
- Xây dựng trang web.

## II. Cơ sở dữ liệu
Bảng: Em sẽ tạo 2 bảng là bảng coin và bảng price để lưu:
- **Coin** gồm: `cid`, `name`
- **Price** gồm: `id`, `cid`, `priceCoin`,`time`
- Store procedure gồm: lưu giá bitcoin mới vào cơ sở dữ liệu, lấy ra giá và thời gian của giá bitcoin.

## III. Module đọc dữ liệu
Sử dụng Python và FastAPI để tạo một API để lấy dữ liệu từ dịch vụ API liên quan đến tiền điện tử.

### Mô tả nguồn dữ liệu
- Lấy dữ liệu qua API của các trang về tiền điện tử.
- Dữ liệu bao gồm thông tin và giá đồng bitcoin.
- **Node-RED**: Xây dựng một chu trình trong Node-RED để tự động gọi API Python để lấy dữ liệu. Sau đó, xử lý dữ liệu và ghi dữ liệu vào cơ sở dữ liệu (SQL Server).

## IV. Web
- Sử dụng ASP.NET để vào DB lấy dữ liệu rồi trả về.
- Sử dụng HTML, CSS, JS để tạo giao diện web.
- Hiển thị giá bitcoin hiện tại và vẽ biểu đồ giá bitcoin theo ngày.
- Mong Muốn: Nếu còn thời gian em sẽ làm thêm phần xuất ra file excel.
