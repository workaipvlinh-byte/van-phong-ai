# Văn Phòng AI

Một công ty thu nhỏ chạy ngay trên máy tính của bạn. Nhân viên là AI (Claude Code), bạn ra lệnh qua Telegram, xem cả văn phòng làm việc trên một bảng điều khiển 2.5D.

Bản khởi tạo này chỉ dựng phần móng: **CEO** nghe lệnh, **Thư Ký** giữ khay việc, **Kế Toán** ghi sổ. Phòng ban và nhân viên còn lại bạn tự thêm, tự đặt tên, tự viết nhiệm vụ.

Hướng dẫn đầy đủ, có hình: series **Xây văn phòng AI** trên [toihocai.com](https://toihocai.com/van-phong-ai/).

## Cần gì

- Máy Windows 10/11 (macOS, Linux chạy bằng `chay.sh`).
- Python 3.10 trở lên.
- Claude Code, đã đăng nhập bằng tài khoản Claude trả phí (Pro trở lên). Nhân viên dùng lượt của gói này, không tốn tiền API.
- Telegram trên điện thoại.

## Cài đặt

1. Tải repo về (nút **Code → Download ZIP**), giải nén vào một thư mục, ví dụ `D:\VanPhongAI`.
2. Bấm đúp **CAI-DAT.bat**. File này kiểm tra Python, Claude Code rồi mở văn phòng.
3. Trình duyệt mở `http://localhost:8080`. Làm theo 3 bước: đặt tên công ty, chọn mô hình (Shop, Dịch vụ, Làm content, Văn phòng, Tự dựng), nối Telegram.
4. Từ lần sau chỉ cần bấm đúp **CHAY.bat**. Cửa sổ đen là văn phòng: đóng nó là văn phòng nghỉ.

## Dùng hằng ngày

| Bạn muốn | Làm thế nào |
|---|---|
| Thêm nhân viên | Bấm dấu **+** trong một phòng trên bảng điều khiển, chọn mẫu, sửa nhiệm vụ, bật lên |
| Giao việc | Nhắn bình thường vào nhóm Telegram, CEO trình kế hoạch, bạn bấm ✅ Làm đi |
| Gọi thẳng 1 nhân viên | `/tên-nhân-viên việc`, ví dụ `/content viết bài áo khoác gió` |
| Nối việc giữa nhân viên | Trong bảng nhân viên, chọn **Làm xong chuyển cho** |
| Nhận việc đúng giờ | Thư Ký đưa việc vào các mốc khay (mặc định 06:30, 11:30, 20:00, 21:30), mỗi lần 1 việc |
| Lấy việc ngay | `/khay` |
| Dừng mọi việc | `/dung` |
| Khám sức khoẻ văn phòng | `/kiemtra` |
| Ghi sổ | `/chi 200k mua tên miền`, `/thu 3tr làm web cho khách`, `/so` |
| Dạy văn phòng điều cần nhớ | `/nho Shop chỉ bán áo nam` |

## Thư mục

```
van_phong.py        bộ máy chính (Telegram, Claude Code, lịch, khay việc, sổ, bảng điều khiển)
index.html          bảng điều khiển
van-phong/          chỗ nhân viên làm việc
  brain/            bộ não chung, nhân viên đọc trước khi làm
  tai-lieu/         file bạn để cho nhân viên đọc: sản phẩm, chính sách, tồn kho...
  ket-qua/          kết quả từng nhân viên, lưu theo ngày
data/               cấu hình, khay việc, sổ thu chi, nhật ký (tự tạo)
.env                mã bot Telegram (tự tạo, không chia sẻ cho ai)
```

## An toàn

- Nhân viên chỉ được đọc web và đọc/ghi file trong thư mục `van-phong/`. Không chạy lệnh trên máy, không xoá file, không tự đăng bài hay nhắn cho ai.
- Mọi thứ cần đăng đều vào khay chờ bạn duyệt.
- Chỉ người gửi lệnh `/ketnoi` lúc nối Telegram mới ra lệnh được cho văn phòng.
- Bảng điều khiển mặc định chỉ mở được trên chính máy này.

## Giới hạn của bản khởi tạo

- Máy phải bật thì văn phòng mới làm việc.
- Nhân viên soạn sẵn, bạn tự đăng hoặc tự gửi. Chưa nối Zalo, Messenger, Facebook.
- Mỗi lúc chỉ 1 nhân viên chạy, để không hết lượt Claude quá nhanh. Việc sau tự xếp hàng.
- Gói Claude có giới hạn lượt dùng. Nhiều nhân viên chạy dày đặc thì nên chọn bộ não "nhẹ".

## Giấy phép

Dùng cá nhân và cho công việc của bạn thoải mái. Không bán lại. Xem file `LICENSE`.
