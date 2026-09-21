# RISC-V RV32I Processor - Development Roadmap

> Reference: **"Digital Design and Computer Architecture: RISC-V Edition"** (Sarah L. Harris & David Money Harris).  
> Development Strategy: **Pedagogical & Problem-Driven Development** (Đi từ Single-Cycle -> Direct MMIO SoC -> Interrupts/CSR -> 5-Stage Pipelining).

---

## 🧭 I. Macro Roadmap

```
+---------------------------+       +---------------------------+
| PHASE 1: Single-Cycle     | ----> | PHASE 2: Basic SoC & FPGA |
| (Harris Ch. 6, 7.3, 7.6)  |       | (Harris Ch. 9.2, 9.3, AppA|
| - Full RV32I Base ISA     |       | - Direct MMIO (Addr Dec)  |
| - C benchmark trong RAM   |       | - GPIO, UART, FPGA Board  |
+---------------------------+       +---------------------------+
                                                  |
                                                  v
+---------------------------+       +---------------------------+
| PHASE 4: 5-Stage Pipeline | <---- | PHASE 3: CSR & Interrupts |
| (Harris Ch. 7.5, 7.6.3)   |       | (Harris Ch. 9.3.8, 6.6.2) |
| - Hazard Unit (Forwarding)|       | - CSR Registers           |
| - Stalling, Branch Flush  |       | - Hardware Timer, ISR     |
+---------------------------+       +---------------------------+
                                                  |
                                                  v
                                    +---------------------------+
                                    | PHASE 5 (Nâng cao/Tùy chọn)|
                                    | (Harris Ch. 8, Ch. 7.7)   |
                                    | - Standard Bus (APB/WB)   |
                                    | - L1 Caches & Peripherals |
                                    +---------------------------+
```

---

## 🛠️ II. Detailed Milestones

### 📌 Phase 1: Complete RV32I Single-Cycle Core (Harris Ch. 6, 7.3, 7.6)
*Mục tiêu: Đạt CPI = 1, chạy mượt mà các thuật toán viết bằng C trên bộ nhớ mô phỏng.*

#### Completed:
- [x] Memory access: `lw`, `sw`
- [x] R-type arithmetic & logic: `add`, `sub`, `and`, `or`, `slt`
- [x] Immediate arithmetic: `addi`
- [x] Conditional branches (B-type): `beq`, `bne`, `blt`, `bge`, `bltu`, `bgeu` (signed và unsigned)
- [x] Unconditional jumps: `jal`, `jalr`
- [x] Upper immediate instructions: `lui`, `auipc`
- [x] Shift operations: `sll`, `srl`, `sra`, `slli`, `srli`, `srai`
- [x] Toolchain workflow: C -> ASM (`test.s`) -> ELF -> Hex (`mem.h`) -> Simulation

#### In Progress / Next Goals:
- [ ] Sub-word memory access: `lb`, `lbu`, `lh`, `lhu`, `sb`, `sh` (8-bit và 16-bit)
- [ ] Stack initialization (`startup.s`): Set `sp` về đỉnh RAM và gọi hàm `main()`
- [ ] C Software verification: Chạy các bài test chuẩn (Fibonacci, Bubble Sort, Factorial)

---

### 📌 Phase 2: Basic SoC & FPGA với Direct MMIO (Harris Ch. 9.2, 9.3, Appendix A)
*Mục tiêu: Giao tiếp thế giới thực qua Memory-Mapped I/O bằng kiến trúc Address Decoder + MUX trực tiếp theo sách Harris (Zero wait-state, giữ thiết kế tinh gọn).*

- [ ] **Address Decoder & Memory Map**:
  - `0x0000_0000 - 0x0000_1FFF`: RAM dữ liệu / mã lệnh (8 KB)
  - `0x1000_0000`: GPIO Data (LEDs out, Switches in)
  - `0x1000_0010`: UART Data Register & Status Register
- [ ] **GPIO Module**: Chớp tắt LED và đọc nút bấm từ C bằng con trỏ `volatile`
- [ ] **UART Transmitter Module**: Bộ phát UART 115200 baud để `printf` chuỗi ký tự qua cổng Serial COM lên màn hình máy tính
- [ ] **FPGA Implementation (Appendix A)**: Gán chân I/O (Pin Constraints), tổng hợp bitstream và nạp chạy thực tế trên bo mạch FPGA

---

### 📌 Phase 3: CSR & Interrupts - Privileged Architecture (Harris Ch. 9.3.6, 9.3.8 & 6.6.2)
*Mục tiêu: Hỗ trợ ngắt phần cứng, bộ đếm thời gian và môi trường chạy bare-metal OS.*

- [ ] **Control & Status Registers (CSR)**: Hiện thực các thanh ghi `mstatus`, `mie`, `mip`, `mtvec`, `mepc`, `mcause`
- [ ] **Privileged Instructions**: Lệnh `csrrw`, `csrrs`, `ecall` (system call) và `mret` (return from exception/interrupt)
- [ ] **Hardware Timer**: Hiện thực `mtime` và `mtimecmp` để kích hoạt ngắt định kỳ
- [ ] **Trap Handler**: Viết ISR (Interrupt Service Routine) bằng C/ASM để xử lý ngắt mượt mà

---

### 📌 Phase 4: 5-Stage Pipelined Core (Harris Ch. 7.5, 7.6.3)
*Mục tiêu: Đẩy xung nhịp lên cao bằng kiến trúc 5 tầng chuẩn RISC (IF -> ID -> EX -> MEM -> WB).*

- [ ] **Pipeline Registers**: Tách đường truyền dữ liệu thành 5 tầng với các thanh ghi trung gian (IF/ID, ID/EX, EX/MEM, MEM/WB)
- [ ] **Hazard Unit - Data Forwarding**: Chuyển tiếp dữ liệu từ tầng EX/MEM và MEM/WB về đầu vào ALU (giải quyết RAW hazards không cần stall)
- [ ] **Hazard Unit - Stalling & Flushing**:
  - Xử lý Load-Use Delay (stall 1 chu kỳ)
  - Xử lý Branch Misprediction (flush các lệnh đã fetch nhầm)
- [ ] **Verification**: Chạy lại toàn bộ testbench C của Phase 1 & 2 để kiểm chứng độ chính xác và so sánh tốc độ

---

### 📌 Phase 5: Caches & Standard Bus Protocol (Nâng cao - Harris Ch. 8, Ch. 7.7)
*Mục tiêu: Hoàn thiện kiến trúc công nghiệp khi tích hợp bộ nhớ lớn và ngoại vi phức tạp.*

- [ ] **Chuẩn hóa Bus Interface**: Refactor cổng giao tiếp bộ nhớ sang chuẩn công nghiệp (AMBA APB hoặc Wishbone B4)
- [ ] **L1 Cache (Chương 8.3)**: Thiết kế Direct-Mapped hoặc 2-Way Set-Associative Instruction Cache
- [ ] **Ngoại vi nâng cao (Chương 9.4)**: Bộ điều khiển hiển thị VGA Framebuffer hoặc SPI Flash controller

---

## 📚 References
- *Digital Design and Computer Architecture: RISC-V Edition* - Sarah L. Harris & David Money Harris.
- *The RISC-V Instruction Set Manual, Volume I: Unprivileged ISA (RV32I)*.
- *The RISC-V Instruction Set Manual, Volume II: Privileged Architecture*.
