# RISC-V RV32I Processor - Development Roadmap

> Project based on the textbook: **"Digital Design and Computer Architecture: RISC-V Edition"** (Sarah L. Harris & David Money Harris).

---

## 🧭 I. Tầm nhìn Vĩ mô (Macro Roadmap)

Lộ trình phát triển đưa vi xử lý từ mô hình đồ chơi trên mô phỏng thành một hệ thống System-on-Chip (SoC) hoàn chỉnh có thể vận hành trên phần cứng thật (FPGA):

```
+---------------------------+       +---------------------------+       +---------------------------+
| GIAI ĐOẠN 1:              |       | GIAI ĐOẠN 2:              |       | GIAI ĐOẠN 3:              |
| Single-Cycle RV32I Core   | ----> | 5-Stage Pipelined Core    | ----> | Memory & Cache Subsystem  |
| (Hiểu Datapath & Control) |       | (Forwarding & Hazards)    |       | (I-Cache & D-Cache)       |
+---------------------------+       +---------------------------+       +---------------------------+
                                                                                      |
+---------------------------+       +---------------------------+                     |
| GIAI ĐOẠN 5:              |       | GIAI ĐOẠN 4:              |                     |
| FPGA Deployment & Software|<----- | System-on-Chip (SoC)      | <-------------------+
| (Bare-metal C / OS)       |       | (Standard Bus, UART, GPIO)|
+---------------------------+       +---------------------------+
```

1. **Giai đoạn 1: Core Fundamentals (Single-Cycle Core)** *(Chương 7.3)*
   - Làm chủ Datapath, Control Unit, ALU, Decoder và luồng thực thi lệnh trong 1 chu kỳ clock.
2. **Giai đoạn 2: High-Performance Microarchitecture (Pipeline 5 tầng)** *(Chương 7.5)*
   - Nâng cao xung nhịp và thông lượng (throughput). Giải quyết triệt để các xung đột phần cứng (Hazard), kỹ thuật Forwarding, Stall và Flush để đạt $CPI \approx 1$.
3. **Giai đoạn 3: Memory Hierarchy & Cache System** *(Chương 8)*
   - Xây dựng bộ nhớ đệm (L1 Instruction Cache & Data Cache) để giải quyết vấn đề nghẽn cổ chai tốc độ giữa CPU và bộ nhớ chính (RAM ngoài).
4. **Giai đoạn 4: System-on-Chip (SoC) & Interconnect** *(Chương 9)*
   - Tích hợp chuẩn giao tiếp bus (Wishbone hoặc AXI-Lite). Kết nối các thiết bị ngoại vi thông qua Memory-Mapped I/O (MMIO): UART (giao tiếp máy tính), Timer (bộ định thời), GPIO (LED, nút bấm).
5. **Giai đoạn 5: Hiện thực hóa trên FPGA & Hệ sinh thái phần mềm**
   - Tổng hợp và nạp lên kit FPGA thật (như Altera Cyclone IV / DE10-Lite / Xilinx Artix-7). Chạy chương trình C hoàn chỉnh (`printf` qua UART, mini game, FreeRTOS).

---

## 🛠️ II. Kế hoạch Vi mô & Danh mục công việc chi tiết (Micro Roadmap)

### 📌 Giai đoạn 1: Hoàn thiện tập lệnh RV32I (Single-Cycle)

#### Hiện trạng (Đã hoàn thành):
- [x] Lệnh truy xuất bộ nhớ: `lw`, `sw`
- [x] Lệnh số học R-type: `add`, `sub`, `and`, `or`, `slt`
- [x] Lệnh tức thời: `addi`
- [x] Lệnh rẽ nhánh có điều kiện: `beq`
- [x] Lệnh nhảy không điều kiện: `jal` (với $PC + 4$ ghi về thanh ghi đích)
- [x] Lệnh nhảy gián tiếp: `jalr` (hỗ trợ lời gọi hàm và `ret`)
- [x] Lệnh nạp tức thời 20-bit cao: `lui` (U-type)
- [x] Toolchain Flow: C $\rightarrow$ ASM (`test.s`) $\rightarrow$ ELF $\rightarrow$ Verilog Hex (`mem.h`) $\rightarrow$ ModelSim.

#### Mục tiêu tiếp theo:
- [ ] **Bổ sung lệnh `auipc`:** Hỗ trợ địa chỉ PC-relative ($PC + \text{Imm} \ll 12$).
- [ ] **Mở rộng các lệnh rẽ nhánh:** `bne`, `blt`, `bge`, `bltu`, `bgeu` (so sánh có dấu / không dấu).
- [ ] **Mở rộng các lệnh dịch bit (Shift):** `sll`, `srl`, `sra`, `slli`, `srli`, `srai`.
- [ ] **Hỗ trợ tải dữ liệu cỡ nhỏ:** `lb`, `lbu`, `lh`, `lhu`, `sb`, `sh` (đọc/ghi 8-bit và 16-bit).
- [ ] **Xây dựng `startup.s`:** Khởi tạo con trỏ ngăn xếp `sp` trỏ vào đỉnh RAM và nhảy vào `main`.
- [ ] **Kiểm thử liên kết C:** Chạy thành công các thuật toán viết bằng C (nhân/chia cộng dồn, Fibonacci, Bubble Sort) trên ModelSim.

---

### 📌 Giai đoạn 2: Nâng cấp lên CPU Pipeline 5 tầng (5-Stage Pipelining)

- [ ] **Tách Datapath thành 5 tầng với các thanh ghi Pipeline:**
  - `IF/ID`: Lưu Program Counter và Lệnh lấy về.
  - `ID/EX`: Lưu các giá trị thanh ghi đọc ra, immediate mở rộng, tín hiệu điều khiển ALU.
  - `EX/MEM`: Lưu kết quả tính toán ALU, dữ liệu cần ghi RAM, tín hiệu điều khiển bộ nhớ.
  - `MEM/WB`: Lưu dữ liệu đọc từ RAM hoặc kết quả ALU để ghi về Register File.
- [ ] **Thiết kế Hazard Unit (Khối quản lý xung đột):**
  - **Data Forwarding (Bypassing):** Chuyển kết quả từ tầng `EX/MEM` hoặc `MEM/WB` quay ngược về đầu vào ALU, loại bỏ thời gian chờ ghi vào Register File.
  - **Load-Use Hazard Stall:** Phát hiện khi lệnh kế tiếp cần ngay dữ liệu của lệnh `lw` trước đó $\rightarrow$ đóng băng (Stall) tầng `IF` & `ID`, chèn bong bóng (NOP/Bubble) vào `EX`.
  - **Branch Hazard Handling:** Xử lý khi rẽ nhánh nhảy sang địa chỉ mới $\rightarrow$ Xóa (Flush) các lệnh đã nạp sai trong pipeline.

---

### 📌 Giai đoạn 3: Bắt ngắt, Ngoại lệ & Thanh ghi CSR (Privileged Architecture)

- [ ] **Thanh ghi điều khiển & trạng thái (CSR - Control and Status Registers):**
  - `mstatus`: Bật/tắt ngắt toàn cục (MIE).
  - `mie` & `mip`: Cho phép và cờ báo ngắt ngoại vi/timer/phần mềm.
  - `mtvec`: Lưu địa chỉ vector xử lý ngắt (Interrupt Service Routine).
  - `mepc`: Lưu lại giá trị PC tại thời điểm xảy ra ngắt/ngoại lệ.
  - `mcause`: Lưu mã nguyên nhân phát sinh ngắt.
- [ ] **Lệnh đặc quyền:** `mret` (quay về sau khi xử lý ngắt xong) và `ecall` (lời gọi hệ thống).

---

### 📌 Giai đoạn 4: Phân hệ Bộ nhớ & Cache (Memory & Cache Subsystem)

- [ ] **L1 Instruction Cache (I-Cache):**
  - Kiến trúc Direct-Mapped đơn giản (Line size 16/32 bytes).
  - Khối FSM điều khiển: Xử lý Cache Hit (1 cycle) và Cache Miss (nạp dòng dữ liệu từ bộ nhớ chính).
- [ ] **L1 Data Cache (D-Cache):**
  - Hỗ trợ chính sách ghi: Write-Through hoặc Write-Back kèm Dirty Bit.
- [ ] **Bộ giải mã địa chỉ (Address Decoder / Interconnect):**
  - Phân vùng không gian địa chỉ 32-bit (Memory Map): ROM, RAM, Ngoại vi (MMIO).

---

### 📌 Giai đoạn 5: Tích hợp SoC & Triển khai lên FPGA (SoC Integration & FPGA)

- [ ] **Chuẩn hóa Bus giao tiếp:** Chuyển đổi giao tiếp lõi sang chuẩn **Wishbone Bus** hoặc **AXI4-Lite**.
- [ ] **Thiết kế module UART (Universal Asynchronous Receiver-Transmitter):**
  - Baudrate 115200, truyền nhận chuỗi ký tự nối tiếp qua cổng COM máy tính.
- [ ] **Thiết kế Timer & GPIO Module:**
  - Bộ đếm thời gian thực phát sinh ngắt định kỳ.
  - Module đọc nút nhấn, hiển thị LED 7 đoạn và LED đơn.
- [ ] **Hiện thực hóa trên FPGA:**
  - Viết file ràng buộc chân (Pin Constraints).
  - Biên dịch và nạp bitstream lên board FPGA thực tế.
  - Viết chương trình C bare-metal: `Hello World!`, đọc cảm biến hoặc điều khiển ngoại vi.

---

## 📚 Tài liệu tham khảo
- *Digital Design and Computer Architecture: RISC-V Edition* - Sarah L. Harris & David Money Harris.
- *The RISC-V Instruction Set Manual, Volume I: Unprivileged ISA (RV32I)*.
- *The RISC-V Instruction Set Manual, Volume II: Privileged Architecture*.
