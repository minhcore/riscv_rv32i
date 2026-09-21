# RISC-V RV32I Processor - Development Roadmap

> Project based on the textbook: **"Digital Design and Computer Architecture: RISC-V Edition"** (Sarah L. Harris & David Money Harris).
> Chiến lược phát triển: **Problem-Driven Development** (Học và nâng cấp kiến trúc dựa trên nhu cầu thực tế của ứng dụng).

---

## 🧭 I. Tầm nhìn Vĩ mô (Macro Roadmap)

Chiến lược phát triển thực tế: Tập trung đưa CPU đơn kỳ hoàn chỉnh chạy được chương trình C thực tế trên FPGA trước, sau đó mới nâng cấp vi kiến trúc lên Pipeline và Cache khi có nhu cầu tối ưu hóa tốc độ:

```
+---------------------------+       +---------------------------+       +---------------------------+
| GIAI ĐOẠN 1:              |       | GIAI ĐOẠN 2:              |       | GIAI ĐOẠN 3:              |
| Single-Cycle RV32I Core   | ----> | Basic SoC & FPGA          | ----> | Interrupts & Timers (CSR) |
| (Chạy trơn tru code C)    |       | (MMIO, UART, Nạp FPGA)    |       | (Lập trình nhúng baremetal|
+---------------------------+       +---------------------------+       +---------------------------+
                                                                                  |
+---------------------------+       +---------------------------+                 |
| GIAI ĐOẠN 5:              |       | GIAI ĐOẠN 4:              |                 |
| Memory & Cache Subsystem  |<----- | Pipeline 5 tầng (Tăng tốc)| <---------------+
| (I-Cache, D-Cache, OS)    |       | (Hazard Unit, Forwarding) |
+---------------------------+       +---------------------------+
```

1. **Giai đoạn 1: Core Fundamentals & Môi trường C (Single-Cycle Core)** *(Chương 7.3)*
   - Hoàn thiện trọn vẹn tập lệnh RV32I đơn chu kỳ.
   - Xây dựng `startup.s` và chạy thành công các thuật toán viết bằng C (CPI = 1).
2. **Giai đoạn 2: Tích hợp SoC cơ bản & Hiện thực hóa trên FPGA** *(Chương 9)*
   - Đưa CPU đơn kỳ vào hệ thống SoC: Memory-Mapped I/O (MMIO), kết nối module UART và GPIO.
   - Nạp lên kit FPGA thật, chạy chương trình C in dòng chữ `"Hello World!"` qua cổng Serial và chớp tắt LED.
3. **Giai đoạn 3: Bắt ngắt, Bộ định thời Timer & Thanh ghi CSR (Privileged Architecture)**
   - Hỗ trợ ngắt ngoại vi, ngắt Timer định kỳ và các thanh ghi điều khiển trạng thái (CSR).
   - Phục vụ ứng dụng lập trình nhúng thời gian thực (Real-Time Bare-metal).
4. **Giai đoạn 4: Tối ưu hiệu năng - Nâng cấp Pipeline 5 tầng** *(Chương 7.5)*
   - *Động lực:* Khi CPU đơn kỳ gặp giới hạn về xung nhịp (Fmax thấp do critical path dài) khi chạy thuật toán nặng.
   - Chia Datapath thành 5 tầng (IF, ID, EX, MEM, WB), thiết kế Hazard Unit (Forwarding, Stall, Flush).
5. **Giai đoạn 5: Phân hệ Bộ nhớ & Cache (Memory & Cache Subsystem)** *(Chương 8)*
   - Xây dựng L1 Instruction Cache và Data Cache giải quyết nghẽn cổ chai với RAM ngoài, hướng tới chạy hệ điều hành (FreeRTOS / Linux).

---

## 🛠️ II. Kế hoạch Vi mô & Danh mục công việc chi tiết (Micro Roadmap)

### 📌 Giai đoạn 1: Hoàn thiện tập lệnh RV32I & Chạy code C (Single-Cycle)

#### Hiện trạng (Đã hoàn thành):
- [x] Lệnh truy xuất bộ nhớ: `lw`, `sw`
- [x] Lệnh số học R-type: `add`, `sub`, `and`, `or`, `slt`
- [x] Lệnh tức thời: `addi`
- [x] Toàn bộ lệnh rẽ nhánh có điều kiện (B-type): `beq`, `bne`, `blt`, `bge`, `bltu`, `bgeu` (so sánh có dấu / không dấu)
- [x] Lệnh nhảy không điều kiện: `jal` (với PC + 4 ghi về thanh ghi đích)
- [x] Lệnh nhảy gián tiếp: `jalr` (hỗ trợ lời gọi hàm và ret)
- [x] Lệnh nạp tức thời 20-bit cao: `lui` (U-type)
- [x] Lệnh cộng tức thời 20-bit cao vào PC: `auipc` (U-type, hỗ trợ địa chỉ PC-relative)
- [x] Toolchain Flow: C -> ASM (`test.s`) -> ELF -> Verilog Hex (`mem.h`) -> ModelSim.

#### Mục tiêu tiếp theo:
- [ ] **Mở rộng các lệnh dịch bit (Shift):** `sll`, `srl`, `sra`, `slli`, `srli`, `srai`.
- [ ] **Hỗ trợ tải dữ liệu cỡ nhỏ:** `lb`, `lbu`, `lh`, `lhu`, `sb`, `sh` (đọc/ghi 8-bit và 16-bit).
- [ ] **Xây dựng `startup.s`:** Khởi tạo con trỏ ngăn xếp `sp` trỏ vào đỉnh RAM và nhảy vào hàm `main()`.
- [ ] **Kiểm thử liên kết phần mềm C:** Chạy thành công các hàm C hoàn chỉnh (Fibonacci, Bubble Sort, tính giai thừa) trên ModelSim.

---

### 📌 Giai đoạn 2: Tích hợp SoC cơ bản & Hiện thực hóa trên FPGA

- [ ] **Bộ giải mã địa chỉ (Address Decoder / Interconnect):**
  - Phân vùng không gian địa chỉ 32-bit (Memory Map): ROM (chứa code), RAM (dữ liệu), Vùng ngoại vi MMIO.
- [ ] **Thiết kế module UART Transmitter:**
  - Bộ truyền nối tiếp RS232/UART tốc độ baud 115200 để gửi ký tự lên máy tính.
- [ ] **Thiết kế module GPIO:**
  - Giao tiếp đọc nút bấm, điều khiển LED đơn trên board.
- [ ] **Hiện thực hóa trên FPGA:**
  - Viết file ràng buộc chân (Pin Constraints).
  - Biên dịch và nạp bitstream lên board FPGA thực tế.
  - Viết chương trình C bare-metal in `"Hello World!"` qua UART.

---

### 📌 Giai đoạn 3: Bắt ngắt, Ngoại lệ & Thanh ghi CSR (Privileged Architecture)

- [ ] **Thanh ghi điều khiển & trạng thái (CSR - Control and Status Registers):**
  - `mstatus`: Bật/tắt ngắt toàn cục (MIE).
  - `mie` & `mip`: Cho phép và cờ báo ngắt ngoại vi/timer/phần mềm.
  - `mtvec`: Lưu địa chỉ vector xử lý ngắt (Interrupt Service Routine).
  - `mepc`: Lưu lại giá trị PC tại thời điểm xảy ra ngắt/ngoại lệ.
  - `mcause`: Lưu mã nguyên nhân phát sinh ngắt.
- [ ] **Bộ đếm thời gian Timer (mtime & mtimecmp):**
  - Phát sinh ngắt định kỳ phục vụ đa nhiệm hoặc delay phần mềm.
- [ ] **Lệnh đặc quyền:** `mret` (quay về sau khi xử lý ngắt xong) và `ecall` (lời gọi hệ thống).

---

### 📌 Giai đoạn 4: Tối ưu hiệu năng - Nâng cấp Pipeline 5 tầng (5-Stage Pipelining)

> *Thực hiện khi cần nâng cao xung nhịp Fmax và thông lượng xử lý của vi xử lý.*

- [ ] **Tách Datapath thành 5 tầng với các thanh ghi Pipeline:**
  - `IF/ID`: Lưu Program Counter và Lệnh lấy về.
  - `ID/EX`: Lưu các giá trị thanh ghi đọc ra, immediate mở rộng, tín hiệu điều khiển ALU.
  - `EX/MEM`: Lưu kết quả tính toán ALU, dữ liệu cần ghi RAM, tín hiệu điều khiển bộ nhớ.
  - `MEM/WB`: Lưu dữ liệu đọc từ RAM hoặc kết quả ALU để ghi về Register File.
- [ ] **Thiết kế Hazard Unit (Khối quản lý xung đột):**
  - **Data Forwarding (Bypassing):** Chuyển kết quả từ tầng `EX/MEM` hoặc `MEM/WB` quay ngược về đầu vào ALU, loại bỏ thời gian chờ ghi vào Register File.
  - **Load-Use Hazard Stall:** Phát hiện khi lệnh kế tiếp cần ngay dữ liệu của lệnh `lw` trước đó -> đóng băng (Stall) tầng `IF` & `ID`, chèn bong bóng (NOP/Bubble) vào `EX`.
  - **Branch Hazard Handling:** Xử lý khi rẽ nhánh nhảy sang địa chỉ mới -> Xóa (Flush) các lệnh đã nạp sai trong pipeline.

---

### 📌 Giai đoạn 5: Phân hệ Bộ nhớ & Cache (Memory & Cache Subsystem)

- [ ] **L1 Instruction Cache (I-Cache):**
  - Kiến trúc Direct-Mapped đơn giản (Line size 16/32 bytes).
  - FSM điều khiển: Cache Hit (1 cycle) và Cache Miss (nạp dòng dữ liệu từ RAM ngoài).
- [ ] **L1 Data Cache (D-Cache):**
  - Hỗ trợ chính sách ghi: Write-Through hoặc Write-Back kèm Dirty Bit.
- [ ] **Chuẩn hóa Bus giao tiếp:** Chuyển đổi giao tiếp SoC sang chuẩn **Wishbone Bus** hoặc **AXI4-Lite**.

---

## 📚 Tài liệu tham khảo
- *Digital Design and Computer Architecture: RISC-V Edition* - Sarah L. Harris & David Money Harris.
- *The RISC-V Instruction Set Manual, Volume I: Unprivileged ISA (RV32I)*.
- *The RISC-V Instruction Set Manual, Volume II: Privileged Architecture*.
