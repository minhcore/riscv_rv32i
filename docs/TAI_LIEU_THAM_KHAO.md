# TỔNG QUAN VÀ TRA CỨU TÀI LIỆU THAM KHẢO TOÀN DIỆN
*(Comprehensive Reference Catalog & Project Feasibility Guide)*

---

## 1. THÔNG SỐ TỔNG QUAN KHO TÀI LIỆU (REPOSITORY METRICS)

- **Vị trí thư mục:** `d:/Computer_Science_Parallel_Computing_Textbooks`
- **Tổng số lượng tài liệu:** 68 tệp (gồm 67 tệp PDF và 1 tệp DJVU)
- **Tổng dung lượng lưu trữ:** ~ 1.08 GB
- **Tổng dung lượng học thuật:** ~ 36.500+ trang sách giáo trình, chuyên khảo và bài báo kinh điển
- **Ngôn ngữ:** Tiếng Anh (58 tài liệu), Tiếng Trung (10 tài liệu dịch thuật và chuyên khảo nguyên bản)
- **Mục đích của tệp này:** Cung cấp bức tranh toàn cảnh về toàn bộ tri thức hiện có trong thư mục. Khi bắt đầu bất kỳ dự án công nghệ nào mới (thiết kế vi xử lý, tối ưu hóa bộ nhớ đệm, lập trình GPU/CUDA, làm hệ điều hành, viết trình biên dịch, hệ thống phân tán, kiểm chứng phần cứng), bạn chỉ cần nạp tệp `.md` này vào ngữ cảnh (context) để đánh giá tức thì mức độ đầy đủ của tài liệu và chọn đúng tài liệu tham khảo trọng tâm.

---

## 2. MA TRẬN ĐÁNH GIÁ KHẢ THI DỰ ÁN (PROJECT FEASIBILITY MATRIX)

Bảng đối chiếu nhanh giúp bạn hoặc trợ lý AI xác định ngay liệu kho tài liệu này có đủ đáp ứng nhu cầu cho dự án cụ thể hay không:

| Lĩnh vực dự án | Mức độ đầy đủ | Khả năng tự chủ khi thực hiện dự án | Tài liệu tham khảo cốt lõi |
| :--- | :---: | :--- | :--- |
| **Thiết kế CPU / ISA / Vi kiến trúc RISC-V** | **Hoàn hảo (10/10)** | Đủ từ mức kiến trúc tập lệnh đến RTL out-of-order, rename, issue, ROB, branch prediction | Hennessy & Patterson 6th, Shen & Lipasti, 姚永斌 (Yao Yongbin), 刘权胜 (Liu Quansheng), Harris & Harris |
| **Thiết kế & Tối ưu Hệ thống Bộ nhớ / Cache** | **Hoàn hảo (10/10)** | Đầy đủ từ DRAM controller, non-blocking cache, coherence (MESI/MOESI), consistency, hardware prefetching đến replacement policies | Jacob (Memory Systems), Nagarajan & Sorin, Gharachorloo, Jain & Lin, Falsafi |
| **Lập trình Song song & Tăng tốc GPU (CUDA/OpenCL)** | **Hoàn hảo (10/10)** | Đầy đủ từ kiến trúc phần cứng GPGPU (SIMT, warp scheduler) đến tối ưu hóa kernel, memory coalescing, profiling | Kirk & Hwu 3rd, Cheng (Professional CUDA C), Sanders, Aamodt, Munshi, Kim |
| **Phần cứng AI & Bộ tăng tốc NPU** | **Tốt (8/10)** | Nắm sâu kiến trúc Huawei Ascend CANN, xử lý dữ liệu Tensor Core, In-Memory Computing | 梁晓峣 (Ascend CANN), Fujiki (In-Near-Memory), Aamodt |
| **Hệ điều hành & Hệ thống Tầng thấp** | **Rất tốt (9/10)** | Đủ kiến trúc Virtual Memory phần cứng, Paging, TLB, quản lý tiến trình, concurrency, có mã nguồn mẫu xv6 | OSTEP (Arpaci-Dusseau), Bhattacharjee, MIT xv6, Bryant & O'Hallaron (CS:APP) |
| **Trình biên dịch & Công cụ Binary (Linker/Loader)** | **Rất tốt (8.5/10)** | Đủ lý thuyết biên dịch kinh điển, thực chiến LLVM backend, định dạng ELF, dynamic linking, relocation | Dragon Book 2nd, Lopes (LLVM Core), Levine (Linkers & Loaders) |
| **Số học Phần cứng & Thiết kế ALU (Digital Arithmetic)** | **Hoàn hảo (10/10)** | Đầy đủ thuật toán cộng, nhân, chia, căn bậc hai, dấu phẩy động (IEEE 754), CORDIC, dư thừa số | Ercegovac & Lang, Behrooz Parhami 2nd |
| **Kiểm chứng Hình thức & Đặc tả Phần cứng** | **Rất tốt (9/10)** | Đầy đủ TLA+, Alloy, SystemVerilog Assertions, SAT/SMT Solvers, ngôn ngữ Scala/Chisel | Leslie Lamport, Armin Biere (SAT 2nd), Vijayaraghavan (SVA), Daniel Jackson, Odersky |
| **Mạng máy tính & Hệ thống Phân tán** | **Rất tốt (8.5/10)** | Đầy đủ giao thức Internet hiện đại (HTTP/3, QUIC, 5G), Interconnection Networks, kiến trúc phân tán DDIA | Kurose & Ross 8th, Martin Kleppmann (DDIA), William Dally |
| **Web Fullstack / Cloud DevOps / Mobile** | **Thấp (1/10)** | Kho tài liệu chuyên sâu về Computer Engineering & Systems, không tập trung vào Web/App framework | *Cần bổ sung tài liệu riêng nếu làm Web/Cloud* |

---

## 3. DANH MỤC CHI TIẾT 68 TÀI LIỆU THEO CHUYÊN ĐỀ

---

### NHÓM 1: KIẾN TRÚC MÁY TÍNH & THIẾT KẾ VI XỬ LÝ (COMPUTER ARCHITECTURE & PROCESSORS)
*Kho tài liệu cốt lõi cho mọi kỹ sư kiến trúc máy tính, thiết kế chip và vi kiến trúc CPU.*

#### 1. [Computer-Architecture-A-Quantitative-Approach-6th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Architecture-A-Quantitative-Approach-6th-Edition.pdf)
- **Tên sách:** Computer Architecture: A Quantitative Approach (6th Edition, 2019)
- **Tác giả:** John L. Hennessy & David A. Patterson (Giải thưởng Turing) | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 34.95 MB | 1.527 trang (kèm đầy đủ phụ lục A - M)
- **Từ khóa:** ILP, DLP, TLP, SIMD, Vector, GPU Architecture, Domain-Specific Architectures (DSA), Google TPU, Cache Hierarchy, Flash, DRAM, Multiprocessors.
- **Giá trị thực chiến:** Cuốn kinh điển số 1 thế giới về kiến trúc máy tính hiện đại. Điểm nhấn của bản thứ 6 là chương riêng về Domain-Specific Architecture (tăng tốc Deep Learning), phân tích phần cứng TPUv1, GPU Tensor Core.

#### 2. [Computer-Architecture-A-Quantitative-Approach-5th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Architecture-A-Quantitative-Approach-5th-Edition.pdf)
- **Tên sách:** Computer Architecture: A Quantitative Approach (5th Edition, 2012)
- **Tác giả:** John L. Hennessy & David A. Patterson | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 12.50 MB | 1.357 trang
- **Từ khóa:** MIPS64, ILP, Branch Prediction, Out-of-Order Execution, Tomasulo, Directory-based Coherence.
- **Ghi chú:** Bản tiền nhiệm, rất hữu ích khi cần tra cứu các phân tích truyền thống trên nền tảng MIPS64 trước khi bản 6th chuyển dịch sang DSA và RISC-V.

#### 3. [Computer-Organization-and-Design-The-Hardware-Software-Interface-RISC-V-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Organization-and-Design-The-Hardware-Software-Interface-RISC-V-Edition.pdf)
- **Tên sách:** Computer Organization and Design RISC-V Edition: The Hardware Software Interface
- **Tác giả:** David A. Patterson & John L. Hennessy | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 33.72 MB | 1.665 trang (bản mở rộng đầy đủ phụ lục)
- **Từ khóa:** RISC-V ISA, Datapath, Pipelining, Hazards, Forwarding, Memory Hierarchy, Virtual Memory, I/O.
- **Giá trị thực chiến:** Tài liệu chuẩn mực để xây dựng lõi vi xử lý RISC-V pipeline (Single-cycle, Multi-cycle, 5-stage Pipelined Datapath) với mã Verilog và bảng vi thao tác chi tiết.

#### 4. [Computer-Organization-and-Design-The-Hardware-Software-Interface-5th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Organization-and-Design-The-Hardware-Software-Interface-5th-Edition.pdf)
- **Tên sách:** Computer Organization and Design: The Hardware/Software Interface (5th Edition, 2014)
- **Tác giả:** David A. Patterson & John L. Hennessy | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 29.22 MB | 793 trang
- **Từ khóa:** MIPS Architecture, Pipeline Datapath, Control Unit, Cache, Virtual Memory.
- **Ghi chú:** Phiên bản giảng dạy dựa trên tập lệnh MIPS kinh điển.

#### 5. [Modern-Processor-Design-Fundamental-of-Superscalar-Processors.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Modern-Processor-Design-Fundamental-of-Superscalar-Processors.pdf)
- **Tên sách:** Modern Processor Design: Fundamentals of Superscalar Processors
- **Tác giả:** John Paul Shen & Mikko H. Lipasti | NXB: McGraw-Hill
- **Dung lượng / Số trang:** 9.48 MB | 658 trang
- **Từ khóa:** Superscalar, Dynamic Branch Prediction, Register Renaming, Out-of-Order (OoO) Issue, Reorder Buffer (ROB), Memory Disambiguation, Speculative Execution.
- **Giá trị thực chiến:** Giáo trình nền tảng số 1 về vi kiến trúc siêu bước (superscalar). Bắt buộc phải đọc khi muốn thiết kế bộ xử lý phát nhiều lệnh/chu kỳ (multi-issue OoO).

#### 6. [现代处理器设计——超标量处理器基础.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/现代处理器设计——超标量处理器基础.pdf)
- **Tên sách:** 现代处理器设计——超标量处理器基础 (Bản dịch tiếng Trung của cuốn Modern Processor Design)
- **Tác giả dịch:** 张承义, 邓宇, 王蕾 等译 | NXB: 电子工业出版社
- **Dung lượng / Số trang:** 51.02 MB | 312 trang
- **Ghi chú:** Bản dịch tiếng Trung đối chiếu tương ứng với tài liệu số 5.

#### 7. [超标量处理器设计.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/超标量处理器设计.pdf)
- **Tên sách:** 超标量处理器设计 (Superscalar RISC Processor Design)
- **Tác giả:** 姚永斌 (Yao Yongbin) | NXB: 清华大学出版社 (Tsinghua University Press)
- **Dung lượng / Số trang:** 87.24 MB | 386 trang
- **Từ khóa:** Branch Target Buffer (BTB), Return Address Stack (RAS), Gshare, Register Alias Table (RAT), Free List, Reservation Station, Issue Queue, ROB, Store Queue, Load Queue.
- **Giá trị thực chiến:** Tác phẩm cực kỳ hiếm hoi phân tích cực sâu chi tiết phần cứng ở mức mạch logic cho bộ vi xử lý Out-of-Order (OoO), giải thích từng tín hiệu bắt tay (handshake), giải quyết hazard trong Load/Store Unit và phục hồi trạng thái khi đoán sai nhánh.

#### 8. [基于RISC-V指令集的超标量处理器设计与实现.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/基于RISC-V指令集的超标量处理器设计与实现.pdf)
- **Tên sách:** 基于RISC-V指令集的超标量处理器设计与实现 (Design and Implementation of Superscalar Processor based on RISC-V)
- **Tác giả:** 刘权胜 (Liu Quansheng) | NXB: 上海科学技术文献出版社
- **Dung lượng / Số trang:** 88.05 MB | 302 trang
- **Từ khóa:** RISC-V RV64GC, Out-of-Order Core, Vivado FPGA, Chisel / Verilog RTL, Pipeline Stages, Memory Subsystem.
- **Giá trị thực chiến:** Hướng dẫn thực hành từng bước thiết kế một lõi vi xử lý RISC-V siêu bước hoàn chỉnh từ mô phỏng đến hiện thực hóa trên phần cứng FPGA.

#### 9. [Processor-Microarchitecture-An-Implementation-Perspective.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Processor-Microarchitecture-An-Implementation-Perspective.pdf)
- **Tên sách:** Processor Microarchitecture: An Implementation Perspective
- **Tác giả:** Antonio González, Fernando Latorre, Pedro López | Series: Synthesis Lectures on Computer Architecture
- **Dung lượng / Số trang:** 1.27 MB | 116 trang
- **Từ khóa:** Instruction Fetch, Decode, Execution Engine, Memory Hierarchy, Recovery Mechanism, Checkpointing.
- **Giá trị thực chiến:** Khảo sát cô đọng, hệ thống hóa toàn bộ các giải pháp kỹ thuật vi kiến trúc của Intel Core, IBM POWER, AMD x86.

#### 10. [RISC-V手册——一本开源指令集的指南.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/RISC-V手册——一本开源指令集的指南.pdf)
- **Tên sách:** The RISC-V Reader: An Open Architecture Atlas (Bản dịch tiếng Trung: RISC-V手册)
- **Tác giả:** David Patterson, Andrew Waterman | Dịch: Chen Guojian
- **Dung lượng / Số trang:** 8.85 MB | 164 trang
- **Từ khóa:** RV32I, RV64I, M Extension, A Extension, F/D Extension, C (Compressed) Extension, Privileged Architecture, CSRs.
- **Giá trị thực chiến:** Sổ tay tra cứu tập lệnh RISC-V tiện lợi nhất; tra mã opcode, định dạng lệnh R/I/S/B/U/J, cơ chế bẫy ngắt (traps/interrupts).

#### 11. [Digital-Design-and-Computer-Architecture-RISC-V-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Digital-Design-and-Computer-Architecture-RISC-V-Edition.pdf)
- **Tên sách:** Digital Design and Computer Architecture (RISC-V Edition)
- **Tác giả:** Sarah L. Harris & David Money Harris | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 23.33 MB | 733 trang
- **Từ khóa:** Logic Gates, CMOS, FSM, SystemVerilog/VHDL, RISC-V Microarchitecture, Memory, I/O systems.
- **Giá trị thực chiến:** Cầu nối hoàn hảo từ mạch số logic, cổng bán dẫn, FSM đến thiết kế CPU RISC-V bằng SystemVerilog.

#### 12. [In-Praise-of-Digital-Design-and-Computer-Architecture-ARM-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/In-Praise-of-Digital-Design-and-Computer-Architecture-ARM-Edition.pdf)
- **Tên sách:** Digital Design and Computer Architecture (ARM Edition)
- **Tác giả:** Sarah L. Harris & David Money Harris | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 34.55 MB | 711 trang
- **Từ khóa:** ARMv7 ISA, Condition Codes, Barrel Shifter, SystemVerilog, Microarchitecture.
- **Giá trị thực chiến:** Thiết kế phần cứng CPU theo tập lệnh chuẩn công nghiệp của ARM.

---

### NHÓM 2: HỆ THỐNG BỘ NHỚ, BỘ NHỚ ĐỆM & TÍNH NHẤT QUÁN (MEMORY SYSTEMS, CACHES & COHERENCE)
*Bộ sưu tập chuyên khảo hàng đầu thế giới về kiến trúc bộ nhớ, giải quyết bài toán nút thắt cổ chai (Memory Wall).*

#### 13. [Memory-Systems-Cache-DRAM-Disk.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Memory-Systems-Cache-DRAM-Disk.pdf)
- **Tên sách:** Memory Systems: Cache, DRAM, Disk
- **Tác giả:** Bruce Jacob, Spencer W. Ng, David T. Wang | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 23.11 MB | 1.017 trang
- **Từ khóa:** DRAM Architecture, DDR SDRAM, Row Buffer, Bank Conflict, Refresh Overhead, Memory Controller, Cache Hierarchy, Disk Subsystems.
- **Giá trị thực chiến:** Bách khoa toàn thư toàn diện nhất từng được viết về phần cứng DRAM và Memory Controller. Bắt buộc phải đọc khi thiết kế bộ điều khiển bộ nhớ hoặc tối ưu trễ truy xuất.

#### 14. [A-Primer-on-Memory-Consistency-and-Cache-Coherence-2nd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/A-Primer-on-Memory-Consistency-and-Cache-Coherence-2nd-Edition.pdf)
- **Tên sách:** A Primer on Memory Consistency and Cache Coherence (Second Edition, 2020)
- **Tác giả:** Vijay Nagarajan, Daniel J. Sorin, Mark D. Hill, David A. Wood | Series: Synthesis Lectures on Computer Architecture
- **Dung lượng / Số trang:** 4.67 MB | 298 trang
- **Từ khóa:** Sequential Consistency (SC), Total Store Order (x86-TSO), Relaxed Memory Models, Snooping Coherence, Directory Coherence, MOESI, MESIF Protocols.
- **Giá trị thực chiến:** Sách gối đầu giường về tính nhất quán bộ nhớ (Consistency) và gắn kết bộ nhớ đệm (Coherence) trong vi xử lý đa nhân (multi-core).

#### 15. [A-Primer-on-Memory-Consistency-and-Cache-Coherence-2nd-Edition-Springer.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/A-Primer-on-Memory-Consistency-and-Cache-Coherence-2nd-Edition-Springer.pdf)
- **Tên sách:** A Primer on Memory Consistency and Cache Coherence (Second Edition, Springer Release)
- **Tác giả:** Vijay Nagarajan, Daniel J. Sorin, Mark D. Hill, David A. Wood | NXB: Springer
- **Dung lượng / Số trang:** 5.40 MB | 289 trang
- **Ghi chú:** Bản in định dạng Springer chính thức (nội dung tương đương tài liệu số 14).

#### 16. [Memory-Consistency-Models-for-Shared-Memory-Multiprocessors.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Memory-Consistency-Models-for-Shared-Memory-Multiprocessors.pdf)
- **Tên sách:** Memory Consistency Models for Shared-Memory Multiprocessors
- **Tác giả:** Kourosh Gharachorloo | Báo cáo kỹ thuật CSL-TR-95-685 (Stanford University)
- **Dung lượng / Số trang:** 2.45 MB | 393 trang
- **Từ khóa:** Memory Ordering, Weak Ordering, Release Consistency (RC), Processor Consistency, Synchronization Operations.
- **Giá trị thực chiến:** Tài liệu nghiên cứu kinh điển đặt nền móng cho các mô hình bộ nhớ yếu trong các kiến trúc CPU hiện đại (ARM, POWER, RISC-V).

#### 17. [Multi-Core-Cache-Hierarchies.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Multi-Core-Cache-Hierarchies.pdf)
- **Tên sách:** Multi-Core Cache Hierarchies
- **Tác giả:** Daniel J. Sorin, Mark D. Hill, David A. Wood | Series: Synthesis Lectures on Computer Architecture
- **Dung lượng / Số trang:** 1.53 MB | 155 trang
- **Từ khóa:** Private Cache vs Shared Cache, Non-Uniform Cache Architecture (NUCA), Inclusive vs Exclusive, Power Optimization.
- **Giá trị thực chiến:** Thiết kế phân cấp bộ nhớ đệm nhiều tầng (L1, L2, L3/LLC) cho vi xử lý đa lõi.

#### 18. [Cache-Replacement-Policies.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Cache-Replacement-Policies.pdf)
- **Tên sách:** Cache Replacement Policies
- **Tác giả:** Akanksha Jain & Calvin Lin (UT Austin) | Series: Synthesis Lectures on Computer Architecture
- **Dung lượng / Số trang:** 2.34 MB | 82 trang
- **Từ khóa:** Belady's Optimal Algorithm (MIN), LRU, Re-Reference Interval Prediction (RRIP), SHiP, Hawkeye, Glider, Machine Learning in Cache Replacement.
- **Giá trị thực chiến:** Cẩm nang tối tân về các thuật toán thay thế dòng cache, từ các phương pháp cổ điển đến các giải pháp đạt giải nhất kỳ thi vô địch cache thế giới (JWAC).

#### 19. [A-Primer-on-Hardware-Prefetching.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/A-Primer-on-Hardware-Prefetching.pdf)
- **Tên sách:** A Primer on Hardware Prefetching
- **Tác giả:** Babak Falsafi & Thomas F. Wenisch | Series: Synthesis Lectures on Computer Architecture
- **Dung lượng / Số trang:** 1.03 MB | 69 trang
- **Từ khóa:** Stream Buffer, Stride Prefetcher, Spatial Memory Streaming (SMS), Pointer Prefetching, Correlation Prefetching, Accuracy vs Coverage vs Timeliness.
- **Giá trị thực chiến:** Hướng dẫn thiết kế bộ nạp trước dữ liệu phần cứng (hardware prefetcher) để che giấu độ trễ truy cập RAM.

#### 20. [Sector-Cache-Design-and-Performance.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Sector-Cache-Design-and-Performance.pdf)
- **Tên sách:** Sector Cache Design and Performance
- **Tác giả:** Jeffrey B. Rothman & Alan Jay Smith (UC Berkeley)
- **Dung lượng / Số trang:** 1.15 MB | 63 trang
- **Từ khóa:** Sector Cache, Sub-block Placement, Tag Overhead Reduction, Bus Utilization.
- **Giá trị thực chiến:** Kỹ thuật chia sector/sub-block trong cache nhằm giảm đáng kể diện tích silicon tiêu tốn cho bảng tag.

#### 21. [Innovations-in-the-Memory-System.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Innovations-in-the-Memory-System.pdf)
- **Tên sách:** Innovations in the Memory System
- **Tác giả:** Rajeev Balasubramonian (University of Utah) | Series: Synthesis Lectures on Computer Architecture
- **Dung lượng / Số trang:** 1.40 MB | 153 trang
- **Từ khóa:** Low Latency DRAM, Non-Volatile Memory (NVM / PCM), High Bandwidth Memory (HBM), Processing-in-Memory (PIM).
- **Giá trị thực chiến:** Các đột phá mới nhất về cấu trúc bộ nhớ tiên tiến, xếp chồng 3D (3D stacked DRAM) và bộ nhớ bất biến.

#### 22. [In-Near-Memory-Computing.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/In-Near-Memory-Computing.pdf)
- **Tên sách:** In-/Near-Memory Computing
- **Tác giả:** Daichi Fujiki, Xiaowei Wang, Arun Subramaniyan, Reetuparna Das | Series: Synthesis Lectures on Computer Architecture
- **Dung lượng / Số trang:** 3.58 MB | 142 trang
- **Từ khóa:** Processing-in-Memory (PIM), Processing-near-Memory (PNM), Memristor, 3D Integration, Energy-delay Product.
- **Giá trị thực chiến:** Kiến trúc tính toán trực tiếp bên trong bộ nhớ (PIM/PNM) để triệt tiêu năng lượng truyền dữ liệu trong các mô hình AI/LLM.

#### 23. [Shared-Memory-Synchronization.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Shared-Memory-Synchronization.pdf)
- **Tên sách:** Shared-Memory Synchronization
- **Tác giả:** Michael L. Scott (Tác giả MCS Lock) | Series: Synthesis Lectures on Computer Architecture
- **Dung lượng / Số trang:** 1.10 MB | 223 trang
- **Từ khóa:** Spinlocks, Ticket Locks, MCS Queue Locks, Non-blocking Synchronization (CAS, LL/SC), Barriers, Hardware Transactional Memory (HTM).
- **Giá trị thực chiến:** Hướng dẫn chi tiết triển khai cơ chế khóa và đồng bộ hóa phần cứng ở cấp độ vi kiến trúc và hệ thống.

#### 24. [浅谈Cache-Memory.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/浅谈Cache-Memory.pdf)
- **Tên sách:** 浅谈 Cache Memory (A Discussion on Cache Memory)
- **Tác giả:** Wang Qi, Yang Xi, Zhu Yuhao
- **Dung lượng / Số trang:** 4.10 MB | 111 trang
- **Từ khóa:** Direct-Mapped, Set-Associative, Write-Through vs Write-Back, Write Allocate, Non-blocking Cache, MSHR, Virtual vs Physical Cache (VIVT, VIPT, PIPT).
- **Giá trị thực chiến:** Tài liệu tiếng Trung cô đọng, dễ hiểu, minh họa trực quan các khái niệm phức tạp như VIPT và MSHR trong thiết kế cache thực tế.

---

### NHÓM 3: MẠNG TRÊN CHIP & KẾT NỐI NỘI BỘ (INTERCONNECTION NETWORKS & NOC)
*Tài liệu nền tảng cho việc kết nối hàng chục đến hàng nghìn core trên SoC hiện đại.*

#### 25. [Principles-and-Practices-of-Interconnection-Networks.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Principles-and-Practices-of-Interconnection-Networks.pdf)
- **Tên sách:** Principles and Practices of Interconnection Networks
- **Tác giả:** William James Dally & Brian Towles | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 5.79 MB | 581 trang
- **Từ khóa:** Topology (Mesh, Torus, Hypercube, Butterfly), Routing Algorithms (Dimension Order, Oblivious, Adaptive), Flow Control (Wormhole, Virtual Channels), Deadlock Avoidance, Router Microarchitecture.
- **Giá trị thực chiến:** Cuốn sách kinh điển nhất về mạng kết nối nội bộ. Không thể thiếu khi thiết kế router phần cứng và liên kết đa lõi.

#### 26. [On-Chip-Networks-2nd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/On-Chip-Networks-2nd-Edition.pdf)
- **Tên sách:** On-Chip Networks (Second Edition)
- **Tác giả:** Natalie Enright Jerger, Tushar Krishna, Li-Shiuan Peh | Series: Synthesis Lectures on Computer Architecture
- **Dung lượng / Số trang:** 4.25 MB | 210 trang
- **Từ khóa:** Network-on-Chip (NoC), Virtual Channel Allocation, Switch Arbitration, Bufferless NoC, Power-efficient Interconnect.
- **Giá trị thực chiến:** Hướng dẫn chi tiết thiết kế NoC cho chip đa nhân (Many-core SoC) và chip GPU.

---

### NHÓM 4: TÍNH TOÁN SONG SONG, GPU & GIA TỐC PHẦN CỨNG (PARALLEL COMPUTING, GPU, CUDA & OPENCL)
*Bộ tài liệu toàn diện từ mức vi kiến trúc phần cứng GPU đến lập trình tối ưu hóa nhân tính toán (kernel).*

#### 27. [General-Purpose-Graphics-Processor-Architecture.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/General-Purpose-Graphics-Processor-Architecture.pdf)
- **Tên sách:** General-Purpose Graphics Processor Architecture
- **Tác giả:** Tor M. Aamodt, Wilson Wai Lun Fung, Timothy G. Rogers | Series: Synthesis Lectures on Computer Architecture
- **Dung lượng / Số trang:** 1.37 MB | 142 trang
- **Từ khóa:** SIMT Architecture, Warp Scheduling, Branch Divergence, Stack-based Reconvergence, Scoreboard, Register File Banking, Coalesced Memory Access, Tensor Core.
- **Giá trị thực chiến:** Chuyên khảo xuất sắc nhất phân tích bên trong phần cứng GPU (NVIDIA Streaming Multiprocessor - SM). Đọc cuốn này để hiểu tường tận tại sao kernel chạy nhanh hoặc chậm.

#### 28. [Programming-Massively-Parallel-Processors-A-Hands-on-Approach-3rd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Programming-Massively-Parallel-Processors-A-Hands-on-Approach-3rd-Edition.pdf)
- **Tên sách:** Programming Massively Parallel Processors: A Hands-on Approach (3rd Edition, 2016)
- **Tác giả:** David B. Kirk (cựu Chief Scientist NVIDIA) & Wen-mei W. Hwu (UIUC) | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 24.66 MB | 552 trang
- **Từ khóa:** CUDA C, Grids, Blocks, Threads, Shared Memory Tiling, Matrix Multiplication, Parallel Scan, Histogram, Convolution, Thrust, Dynamic Parallelism.
- **Giá trị thực chiến:** Giáo trình lập trình tính toán song song số 1 thế giới. Hướng dẫn thiết kế các thuật toán song song quy mô lớn tối ưu cho phần cứng GPU.

#### 29. [Programming-Massively-Parallel-Processors-A-Hands-on-Approach-2nd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Programming-Massively-Parallel-Processors-A-Hands-on-Approach-2nd-Edition.pdf)
- **Tên sách:** Programming Massively Parallel Processors: A Hands-on Approach (2nd Edition, 2013)
- **Tác giả:** David B. Kirk & Wen-mei W. Hwu | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 21.40 MB | 519 trang
- **Ghi chú:** Bản 2nd edition để tham khảo đối chiếu.

#### 30. [Professional-CUDA-C-Programming.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Professional-CUDA-C-Programming.pdf)
- **Tên sách:** Professional CUDA C Programming
- **Tác giả:** John Cheng, Max Grossman, Ty McKercher | NXB: Wrox / Wiley
- **Dung lượng / Số trang:** 46.80 MB | 527 trang
- **Từ khóa:** Warp Divergence Reduction, Global Memory Coalescing, Shared Memory Bank Conflicts, Streams, Concurrency, Unified Memory, Profiling (nvprof, Nsight).
- **Giá trị thực chiến:** Cuốn sách thực hành tốt nhất về tối ưu hóa hiệu năng CUDA ở cấp độ production. Từng dòng code mẫu đều được benchmark chi tiết.

#### 31. [CUDA-by-Example.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/CUDA-by-Example.pdf)
- **Tên sách:** CUDA by Example: An Introduction to General-Purpose GPU Programming
- **Tác giả:** Jason Sanders & Edward Kandrot | NXB: Addison-Wesley
- **Dung lượng / Số trang:** 3.40 MB | 311 trang
- **Từ khóa:** Julia Set, Ray Tracing, Shared Memory, Constant Memory, Events, Atoms, Zero-Copy.
- **Giá trị thực chiến:** Dành cho người mới bắt đầu học CUDA một cách trực quan, sinh động thông qua các bài toán đồ họa và xử lý mảng.

#### 32. [Programming-in-Parallel-with-CUDA-A-Practical-Guide.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Programming-in-Parallel-with-CUDA-A-Practical-Guide.pdf)
- **Tên sách:** Programming in Parallel with CUDA: A Practical Guide (2022)
- **Tác giả:** Richard Ansorge | NXB: Cambridge University Press
- **Dung lượng / Số trang:** 12.75 MB | 477 trang
- **Từ khóa:** Modern CUDA, Numerical Methods, Monte Carlo Simulation, FFT, Linear Solvers, Multi-GPU.
- **Giá trị thực chiến:** Ứng dụng CUDA trong giải quyết các bài toán tính toán khoa học kỹ thuật hiện đại.

#### 33. [Performance-Analysis-and-Tuning-for-General-Purpose-Graphics-Processing-Units.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Performance-Analysis-and-Tuning-for-General-Purpose-Graphics-Processing-Units.pdf)
- **Tên sách:** Performance Analysis and Tuning for General-Purpose Graphics Processing Units
- **Tác giả:** Hyesoon Kim, Richard Vuduc, Sara Baghsorkhi, Jee Choi, Sunpyo Hong | Series: Synthesis Lectures on Computer Architecture
- **Dung lượng / Số trang:** 13.77 MB | 98 trang
- **Từ khóa:** Roofline Model for GPUs, Analytical Modeling, Memory-bound vs Compute-bound, Warp Occupancy, Instruction Level Parallelism on GPU.
- **Giá trị thực chiến:** Phương pháp luận phân tích thắt cổ chai hiệu năng trên GPU dựa trên mô hình định lượng.

#### 34. [Introduction-to-Parallel-Computing-2nd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Introduction-to-Parallel-Computing-2nd-Edition.pdf)
- **Tên sách:** Introduction to Parallel Computing (Second Edition)
- **Tác giả:** Ananth Grama, Anshul Gupta, George Karypis, Vipin Kumar | NXB: Addison-Wesley
- **Dung lượng / Số trang:** 7.22 MB | 612 trang
- **Từ khóa:** MPI (Message Passing Interface), Pthreads, OpenMP, Speedup, Amdahl's Law, Gustafson's Law, Parallel Sorting, Dense Matrix Algorithms, Graph Algorithms.
- **Giá trị thực chiến:** Giáo trình chuẩn mực về lý thuyết tính toán song song, phân chia bài toán và lập trình đa tiến trình trên cụm siêu máy tính HPC.

#### 35. [Parallel-Computer-Organization-and-Design.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Parallel-Computer-Organization-and-Design.pdf)
- **Tên sách:** Parallel Computer Organization and Design
- **Tác giả:** Michel Dubois, Murali Annavaram, Per Stenström | NXB: Cambridge University Press
- **Dung lượng / Số trang:** 7.02 MB | 562 trang
- **Từ khóa:** Shared Memory Multiprocessors, Interconnection Networks, Cache Coherence, Memory Consistency, Multi-threaded Architectures.
- **Giá trị thực chiến:** Kiến trúc hệ thống máy tính song song từ góc nhìn thiết kế phần cứng vi mạch.

#### 36. [OpenCL-Programming-Guide.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/OpenCL-Programming-Guide.pdf)
- **Tên sách:** OpenCL Programming Guide
- **Tác giả:** Aaftab Munshi, Benedict R. Gaster, Timothy G. Mattson, James Fung, Dan Ginsburg | NXB: Addison-Wesley
- **Dung lượng / Số trang:** 5.51 MB | 648 trang
- **Từ khóa:** OpenCL Architecture, Platform Layer, Runtime, Kernel Language, Buffers, Images, Events, OpenCL/OpenGL Interoperability.
- **Giá trị thực chiến:** Tài liệu chính thống toàn diện về chuẩn lập trình tính toán song song không đồng nhất (Heterogeneous Computing) trên CPU, GPU, DSP.

#### 37. [OpenCL编程指南.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/OpenCL编程指南.pdf)
- **Tên sách:** OpenCL 编程指南 (Bản dịch tiếng Trung của OpenCL Programming Guide)
- **Tác giả dịch:** 蒙施 等著 | NXB: 机械工业出版社
- **Dung lượng / Số trang:** 42.79 MB | 427 trang
- **Ghi chú:** Bản dịch tiếng Trung của tài liệu số 36.

#### 38. [Heterogeneous-Computing-with-OpenCL.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Heterogeneous-Computing-with-OpenCL.pdf)
- **Tên sách:** Heterogeneous Computing with OpenCL
- **Tác giả:** Benedict R. Gaster, Lee Howes, David R. Kaeli, Perhaad Mistry, Dana Schaa | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 5.21 MB | 295 trang
- **Từ khóa:** Heterogeneous Architectures, OpenCL Memory Model, Work-groups, Work-items, Optimization Patterns.
- **Giá trị thực chiến:** Hướng dẫn tối ưu hóa ứng dụng đa nền tảng kết hợp CPU + GPU.

#### 39. [OpenCL异构计算.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/OpenCL异构计算.pdf)
- **Tên sách:** OpenCL 异构计算 (Bản dịch tiếng Trung của Heterogeneous Computing with OpenCL)
- **Tác giả dịch:** 贾斯特 等著 | NXB: 电子工业出版社
- **Dung lượng / Số trang:** 22.42 MB | 287 trang
- **Ghi chú:** Bản dịch tiếng Trung của tài liệu số 38.

#### 40. [昇腾AI处理器架构与编程——深入理解CANN技术原理及应用.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/昇腾AI处理器架构与编程——深入理解CANN技术原理及应用.pdf)
- **Tên sách:** 昇腾AI处理器架构与编程——深入理解CANN技术原理及应用 (Ascend AI Processor Architecture and Programming)
- **Tác giả:** 梁晓峣 (Liang Xiaoyao - Đại học Giao thông Thượng Hải) | NXB: 清华大学出版社
- **Dung lượng / Số trang:** 27.68 MB | 384 trang
- **Từ khóa:** Huawei Ascend DaVinci Architecture, NPU, AI Core, Cube Unit, Vector Unit, Scalar Unit, CANN Architecture, TBE (Tensor Boost Engine), Ascend C.
- **Giá trị thực chiến:** Tài liệu quý giá và hiếm có về thiết kế vi kiến trúc bộ tăng tốc AI nội địa (Huawei Ascend) và ngăn xếp phần mềm CANN tương đương CUDA của Huawei.

---

### NHÓM 5: HỆ ĐIỀU HÀNH & TẦNG THẤP HỆ THỐNG (OPERATING SYSTEMS & LOW-LEVEL SYSTEMS)
*Tài liệu từ nguyên lý hệ điều hành đến hiện thực hóa mã nguồn kernel.*

#### 41. [Operating-Systems-Three-Easy-Pieces.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Operating-Systems-Three-Easy-Pieces.pdf)
- **Tên sách:** Operating Systems: Three Easy Pieces (OSTEP)
- **Tác giả:** Remzi H. Arpaci-Dusseau & Andrea C. Arpaci-Dusseau (University of Wisconsin-Madison)
- **Dung lượng / Số trang:** 4.61 MB | 713 trang
- **Từ khóa:** Virtualization (CPU, Memory, Paging, TLB), Concurrency (Threads, Locks, Condition Variables, Semaphores), Persistence (I/O, Disks, RAID, File Systems, Fast File System, LFS).
- **Giá trị thực chiến:** Giáo trình hệ điều hành hiện đại và dễ hiểu nhất hiện nay, cung cấp bài tập code C thực tế và phân tích sâu cơ chế phân trang.

#### 42. [Architectural-and-Operating-System-Support-for-Virtual-Memory.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Architectural-and-Operating-System-Support-for-Virtual-Memory.pdf)
- **Tên sách:** Architectural and Operating System Support for Virtual Memory
- **Tác giả:** Abhishek Bhattacharjee & Daniel Lustig | Series: Synthesis Lectures on Computer Architecture
- **Dung lượng / Số trang:** 1.86 MB | 177 trang
- **Từ khóa:** Translation Lookaside Buffer (TLB), Page Table Walking (Hardware vs Software), Virtualized Environments (EPT/NPT), Huge Pages, Heterogeneous Systems Virtual Memory (IOMMU).
- **Giá trị thực chiến:** Chuyên khảo sâu sắc nhất kết nối chặt chẽ giữa phần cứng MMU/TLB của CPU và hệ điều hành quản lý bộ nhớ ảo.

#### 43. [XV6-A-Simple-Unix-Like-Teaching-Operating-System.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/XV6-A-Simple-Unix-Like-Teaching-Operating-System.pdf)
- **Tên sách:** xv6: a simple, Unix-like teaching operating system
- **Tác giả:** Russ Cox, Frans Kaashoek, Robert Morris (MIT CSAIL)
- **Dung lượng / Số trang:** 0.51 MB | 110 trang
- **Từ khóa:** Unix v6, Kernel Init, System Calls, Trap Handlers, Page Tables in RISC-V/x86, Processes, Scheduling, Locks, File System Inodes & Logging.
- **Giá trị thực chiến:** Sách phân tích từng dòng code C của hệ điều hành mẫu nổi tiếng của MIT (MIT 6.S081 / 6.828). Cơ sở tuyệt đối để tự viết OS kernel từ con số 0.

#### 44. [Computer-Systems-A-Programmers-Perspective-2nd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Systems-A-Programmers-Perspective-2nd-Edition.pdf)
- **Tên sách:** Computer Systems: A Programmer's Perspective (CS:APP, 2nd Edition)
- **Tác giả:** Randal E. Bryant & David R. O'Hallaron (Carnegie Mellon University) | NXB: Prentice Hall
- **Dung lượng / Số trang:** 6.75 MB | 1.078 trang
- **Từ khóa:** Information Representation, Machine-Level Programming (x86-64), Processor Architecture (Y86), Program Performance Optimization, Memory Hierarchy, Linking, Exceptional Control Flow, Virtual Memory, System-Level I/O, Network Programming.
- **Giá trị thực chiến:** Tác phẩm vĩ đại kết nối phần mềm lập trình viên với phần cứng hệ thống. Giúp lập trình viên C/C++ thấu hiểu hành vi của CPU và OS.

---

### NHÓM 6: TRÌNH BIÊN DỊCH & CÔNG CỤ NẠP LIÊN KẾT (COMPILERS, LLVM & LINKERS)
*Tài liệu từ phân tích cú pháp, tối ưu hóa trung gian đến sinh mã máy và liên kết binary ELF.*

#### 45. [Compilers-Principles-Techniques-and-Tools-2nd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Compilers-Principles-Techniques-and-Tools-2nd-Edition.pdf)
- **Tên sách:** Compilers: Principles, Techniques, and Tools (Second Edition - Dragon Book)
- **Tác giả:** Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffrey D. Ullman | NXB: Pearson / Addison-Wesley
- **Dung lượng / Số trang:** 5.78 MB | 1.035 trang
- **Từ khóa:** Lexical Analysis (Lex/Flex), Syntax Analysis (Yacc/Bison, LL, LR, LALR), Syntax-Directed Translation, Intermediate Code Generation (Three-Address Code), Runtime Environments, Code Generation, Machine-Independent Optimizations, Data Flow Analysis, Instruction Scheduling, Register Allocation.
- **Giá trị thực chiến:** Cuốn "Kinh thánh của ngành biên dịch". Bắt buộc cho việc xây dựng ngôn ngữ lập trình, bộ phân tích cú pháp và tối ưu hóa mã nguồn.

#### 46. [Getting-Started-with-LLVM-Core-Libraries.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Getting-Started-with-LLVM-Core-Libraries.pdf)
- **Tên sách:** Getting Started with LLVM Core Libraries
- **Tác giả:** Bruno Cardoso Lopes & Rafael Auler | NXB: Packt Publishing
- **Dung lượng / Số trang:** 3.26 MB | 314 trang
- **Từ khóa:** LLVM Architecture, Clang Frontend, LLVM Intermediate Representation (IR), LLVM Passes, Target-Independent Code Generator, Instruction Selection (SelectionDAG), TableGen, JIT Engine.
- **Giá trị thực chiến:** Cẩm nang thực hành phát triển backend LLVM cho vi xử lý mới hoặc viết các Pass tối ưu hóa/phân tích mã tĩnh tùy biến.

#### 47. [Linkers-and-Loaders.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Linkers-and-Loaders.pdf)
- **Tên sách:** Linkers and Loaders
- **Tác giả:** John R. Levine | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 3.52 MB | 299 trang
- **Từ khóa:** Object Files, Relocation, Symbol Resolution, Section Merging, Shared Libraries (DLL, .so), Dynamic Linking, Position-Independent Code (PIC), Global Offset Table (GOT), Procedure Linkage Table (PLT), ELF, Mach-O, PE.
- **Giá trị thực chiến:** Tác phẩm độc nhất vô nhị mổ xẻ cơ chế hoạt động của trình liên kết (ld) và nạp tệp thực thi. Tối quan trọng cho lập trình viên nhúng và bảo mật nhị phân.

#### 48. [链接器和加载器.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/链接器和加载器.pdf)
- **Tên sách:** 链接器和加载器 (Bản dịch tiếng Trung của Linkers and Loaders)
- **Tác giả dịch:** 钟秀玉 等译 | NXB: 北京航空航天大学出版社
- **Dung lượng / Số trang:** 5.22 MB | 185 trang
- **Ghi chú:** Bản dịch tiếng Trung của tài liệu số 47.

---

### NHÓM 7: SỐ HỌC KỸ THUẬT SỐ & THIẾT KẾ MẠCH SỐ (DIGITAL ARITHMETIC & DIGITAL HARDWARE)
*Tài liệu chuyên biệt về các thuật toán số học phần cứng cho ALU, FPU và bộ nhân DSP.*

#### 49. [Computer-Arithmetic-Algorithms-and-Hardware-Designs-2nd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Arithmetic-Algorithms-and-Hardware-Designs-2nd-Edition.pdf)
- **Tên sách:** Computer Arithmetic: Algorithms and Hardware Designs (2nd Edition, 2010)
- **Tác giả:** Behrooz Parhami (UC Santa Barbara) | NXB: Oxford University Press
- **Dung lượng / Số trang:** 2.97 MB | 642 trang
- **Từ khóa:** Redundant Number Systems, Carry-Lookahead Adders, Carry-Save Adders, Tree Adders (Kogge-Stone, Brent-Kung), Wallace Tree Multipliers, Booth Encoding, Array Multipliers, Non-Restoring & Restoring Dividers, SRT Division, Square Rooting, Floating-Point Arithmetic (IEEE 754).
- **Giá trị thực chiến:** Giáo trình thiết kế mạch số học phần cứng chuẩn mực. Dùng để triển khai RTL Verilog/VHDL cho bộ cộng tốc độ cao, bộ nhân và bộ chia dấu phẩy động trong CPU.

#### 50. [Computer-Arithmetic-Algorithms-and-Hardware-Designs.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Arithmetic-Algorithms-and-Hardware-Designs.pdf)
- **Tên sách:** Computer Arithmetic: Algorithms and Hardware Designs (1st Edition, 2000)
- **Tác giả:** Behrooz Parhami | NXB: Oxford University Press
- **Dung lượng / Số trang:** 26.13 MB | 510 trang
- **Ghi chú:** Bản in đầu tiên của giáo trình Behrooz Parhami.

#### 51. [Digital-Arithmetic.djvu](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Digital-Arithmetic.djvu)
- **Tên sách:** Digital Arithmetic
- **Tác giả:** Miloš D. Ercegovac (UCLA) & Tomás Lang (UC Irvine) | NXB: Morgan Kaufmann
- **Dung lượng / Số trang:** 7.00 MB | Định dạng DJVU
- **Từ khóa:** Floating-Point Unit (FPU), Online Arithmetic, CORDIC Algorithms, Elementary Functions (Log, Exp, Trigonometric in Hardware), Low-power Arithmetic.
- **Giá trị thực chiến:** Đỉnh cao học thuật toàn cầu về thiết kế mạch số học phần cứng cho DSP và chip chuyên dụng.

#### 52. [Digital-Arithmetic-Slides.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Digital-Arithmetic-Slides.pdf)
- **Tên tài liệu:** Digital Arithmetic Lecture Slides
- **Tác giả:** Miloš D. Ercegovac (UCLA)
- **Dung lượng / Số trang:** 2.00 MB | 555 trang slide bài giảng
- **Giá trị thực chiến:** Slide tổng hợp trực quan công thức, sơ đồ mạch và thuật toán từ cuốn sách Digital Arithmetic của Ercegovac.

---

### NHÓM 8: PHƯƠNG PHÁP HÌNH THỨC, KIỂM CHỨNG & NGÔN NGỮ ĐẶC TẢ (FORMAL METHODS & VERIFICATION)
*Tài liệu kiểm chứng tính đúng đắn của phần cứng và hệ thống phân tán, ngăn ngừa lỗi thiết kế.*

#### 53. [Handbook-of-Satisfiability-2nd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Handbook-of-Satisfiability-2nd-Edition.pdf)
- **Tên sách:** Handbook of Satisfiability (Second Edition, 2021)
- **Biên soạn:** Armin Biere, Marijn Heule, Hans van Maaren, Toby Walsh | NXB: IOS Press
- **Dung lượng / Số trang:** 10.40 MB | 1.486 trang
- **Từ khóa:** SAT Solvers, Conflict-Driven Clause Learning (CDCL), Boolean Satisfiability, SMT (Satisfiability Modulo Theories), QBF, Model Counting, MaxSAT, Formal Verification, Bounded Model Checking (BMC).
- **Giá trị thực chiến:** Công trình bách khoa toàn thư đồ sộ nhất về các thuật toán giải bài toán SAT/SMT – trái tim của các công cụ EDA kiểm chứng chip và tổng hợp logic hiện đại.

#### 54. [Handbook-of-Satisfiability.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Handbook-of-Satisfiability.pdf)
- **Tên sách:** Handbook of Satisfiability (First Edition, 2009)
- **Biên soạn:** Armin Biere et al. | NXB: IOS Press
- **Dung lượng / Số trang:** 8.35 MB | 981 trang
- **Ghi chú:** Phiên bản đầu tiên của bộ cẩm nang SAT.

#### 55. [Specifying-Systems-The-TLA+Language-and-Tools-for-Hardware-and-Software-Engineers.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Specifying-Systems-The-TLA+Language-and-Tools-for-Hardware-and-Software-Engineers.pdf)
- **Tên sách:** Specifying Systems: The TLA+ Language and Tools for Hardware and Software Engineers
- **Tác giả:** Leslie Lamport (Tác giả LaTeX, Giải thưởng Turing) | NXB: Addison-Wesley
- **Dung lượng / Số trang:** 1.77 MB | 382 trang
- **Từ khóa:** TLA+ (Temporal Logic of Actions), PlusCal, TLC Model Checker, Concurrency Verification, State Machine, Safety & Liveness Properties.
- **Giá trị thực chiến:** Bắt buộc phải đọc khi thiết kế giao thức phức tạp (Cache Coherence Protocols, Distributed Consensus như Paxos/Raft) để chứng minh tính đúng đắn trước khi code.

#### 56. [Software-Abstractions-Logic-Language-and-Analysis-Revised-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Software-Abstractions-Logic-Language-and-Analysis-Revised-Edition.pdf)
- **Tên sách:** Software Abstractions: Logic, Language, and Analysis (Revised Edition)
- **Tác giả:** Daniel Jackson (MIT) | NXB: MIT Press
- **Dung lượng / Số trang:** 2.06 MB | 373 trang
- **Từ khóa:** Alloy Language, Relational Logic, SAT-based Bounded Model Finding, Alloy Analyzer, Declarative Modeling.
- **Giá trị thực chiến:** Hướng dẫn mô hình hóa cấu trúc dữ liệu và kiến trúc phần mềm bằng ngôn ngữ Alloy để tự động phát hiện lỗi thiết kế.

#### 57. [Software-Abstractions-Logic-Language-and-Analysis.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Software-Abstractions-Logic-Language-and-Analysis.pdf)
- **Tên sách:** Software Abstractions: Logic, Language, and Analysis (First Edition, 2006)
- **Tác giả:** Daniel Jackson | NXB: MIT Press
- **Dung lượng / Số trang:** 4.94 MB | 369 trang
- **Ghi chú:** Bản xuất bản đầu tiên của giáo trình Alloy.

#### 58. [Software-Abstractions-Logic-Language-and-Analysis-Revised-Part.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Software-Abstractions-Logic-Language-and-Analysis-Revised-Part.pdf)
- **Tên tài liệu:** Software Abstractions Excerpt (Bản trích đoạn)
- **Dung lượng / Số trang:** 0.62 MB | 53 trang
- **Ghi chú:** Tệp trích yếu một số chương trọng tâm của cuốn Software Abstractions.

#### 59. [System-Verilog-Assertions应用指南.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/System-Verilog-Assertions应用指南.pdf)
- **Tên sách:** SystemVerilog Assertions 应用指南 (A Practical Guide for SystemVerilog Assertions)
- **Tác giả:** Srikanth Vijayaraghavan & Meyyappan Ramanathan | NXB: 电子工业出版社
- **Dung lượng / Số trang:** 10.59 MB | 330 trang
- **Từ khóa:** SystemVerilog Assertions (SVA), Immediate vs Concurrent Assertions, Sequences, Properties, Formal Verification, Coverage, Simulation Debug.
- **Giá trị thực chiến:** Hướng dẫn kiểm chứng phần cứng số bằng assertions; cực kỳ cần thiết cho kỹ sư xác minh thiết kế chip (ASIC/FPGA Design Verification Engineer).

#### 60. [Programming-in-Scala-5th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Programming-in-Scala-5th-Edition.pdf)
- **Tên sách:** Programming in Scala (Fifth Edition - Covers Scala 3)
- **Tác giả:** Martin Odersky (Tác giả Scala), Lex Spoon, Bill Venners, Frank Sommers
- **Dung lượng / Số trang:** 15.28 MB | 651 trang
- **Từ khóa:** Functional Programming, Object-Oriented, Implicits / Givens, Pattern Matching, Type System, Metaprogramming.
- **Giá trị thực chiến:** Nền tảng thiết yếu để lập trình Chisel (Constructing Hardware in a Scala Embedded Language) – công cụ tạo lõi RISC-V thế hệ mới của UC Berkeley.

---

### NHÓM 9: HỆ THỐNG DỮ LIỆU, MẠNG MÁY TÍNH & PHÂN TÁN (NETWORKING & DISTRIBUTED DATA SYSTEMS)
*Tài liệu cho thiết kế hệ thống mạng diện rộng và lưu trữ dữ liệu quy mô lớn.*

#### 61. [Computer-Networking-A-Top-Down-Approach-8th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Networking-A-Top-Down-Approach-8th-Edition.pdf)
- **Tên sách:** Computer Networking: A Top-Down Approach (8th Global Edition, 2021)
- **Tác giả:** James F. Kurose & Keith W. Ross | NXB: Pearson
- **Dung lượng / Số trang:** 58.94 MB | 797 trang
- **Từ khóa:** Application Layer (HTTP/2, HTTP/3, DNS), Transport (TCP, UDP, Congestion Control, QUIC), Network (IP, BGP, OSPF, SDN Control Plane), Link (Ethernet, Wi-Fi), Cellular 4G/5G, Network Security.
- **Giá trị thực chiến:** Bản cập nhật mới nhất của giáo trình mạng số 1 thế giới. Thêm các nội dung thời sự quan trọng: QUIC protocol, HTTP/3, mạng di động 5G và kiến trúc phần mềm điều khiển mạng SDN.

#### 62. [Computer-Networking-A-Top-Down-Approach-7th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Networking-A-Top-Down-Approach-7th-Edition.pdf)
- **Tên sách:** Computer Networking: A Top-Down Approach (7th Edition, 2016)
- **Tác giả:** James F. Kurose & Keith W. Ross | NXB: Pearson
- **Dung lượng / Số trang:** 17.46 MB | 856 trang
- **Ghi chú:** Bản 7th edition chuẩn cho môi trường đại học.

#### 63. [Designing-Data-Intensive-Applications.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Designing-Data-Intensive-Applications.pdf)
- **Tên sách:** Designing Data-Intensive Applications (DDIA)
- **Tác giả:** Martin Kleppmann (University of Cambridge) | NXB: O'Reilly Media
- **Dung lượng / Số trang:** 23.82 MB | 613 trang
- **Từ khóa:** Data Models (Relational, Document, Graph), Storage Engines (SSTables, LSM-Trees, B-Trees), Replication (Single/Multi-Leader, Leaderless), Partitioning, Transactions (ACID, Serializability, 2PL, SSI), Distributed Systems Troubles (Unreliable Clocks, Byzantine Faults), Consistency & Consensus (2PC, Raft, Paxos), Stream Processing.
- **Giá trị thực chiến:** Cuốn sách kinh điển nhất hiện đại về kiến trúc hệ thống dữ liệu lớn, backend phân tán có độ tin cậy và khả năng mở rộng cao.

---

### NHÓM 10: THUẬT TOÁN & TOÁN HỌC NỀN TẢNG (ALGORITHMS & MATHEMATICS)
*Nền móng toán học và cấu trúc dữ liệu cho mọi kỹ sư khoa học máy tính.*

#### 64. [Introduction-to-Algorithms-3rd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Introduction-to-Algorithms-3rd-Edition.pdf)
- **Tên sách:** Introduction to Algorithms (Third Edition - CLRS)
- **Tác giả:** Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein | NXB: MIT Press
- **Dung lượng / Số trang:** 5.37 MB | 1.313 trang
- **Từ khóa:** Divide-and-Conquer, Dynamic Programming, Greedy Algorithms, Red-Black Trees, B-Trees, Graph Algorithms (Dijkstra, Bellman-Ford, Floyd-Warshall), Maximum Flow, NP-Completeness.
- **Giá trị thực chiến:** Bộ bách khoa toàn thư thuật toán chuẩn mực quốc tế.

#### 65. [Discrete-Mathematics-and-Its-Applications-8th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Discrete-Mathematics-and-Its-Applications-8th-Edition.pdf)
- **Tên sách:** Discrete Mathematics and Its Applications (8th Edition, 2019)
- **Tác giả:** Kenneth H. Rosen | NXB: McGraw-Hill
- **Dung lượng / Số trang:** 9.92 MB | 1.118 trang
- **Từ khóa:** Propositional & Predicate Logic, Sets, Functions, Number Theory & Cryptography, Mathematical Induction, Counting & Combinatorics, Graph Theory, Trees, Boolean Algebra.
- **Giá trị thực chiến:** Nền tảng toán rời rạc không thể thiếu cho mật mã học, phân tích thuật toán và thiết kế mạch logic.

---

### NHÓM 11: ĐỒ HỌA MÁY TÍNH & XỬ LÝ ẢNH (GRAPHICS & IMAGE PROCESSING)
*Tài liệu toán học và thuật toán đồ họa 3D, ray tracing và thị giác máy tính.*

#### 66. [Fundamentals-of-Computer-Graphics-4th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Fundamentals-of-Computer-Graphics-4th-Edition.pdf)
- **Tên sách:** Fundamentals of Computer Graphics (4th Edition)
- **Tác giả:** Steve Marschner & Peter Shirley | NXB: CRC Press
- **Dung lượng / Số trang:** 17.17 MB | 737 trang
- **Từ khóa:** Ray Tracing, Rasterization, Linear Algebra, Transformations, Viewing, Shading, Texture Mapping, Color Theory, Curves & Surfaces.
- **Giá trị thực chiến:** Giáo trình toán đồ họa nhập môn đến nâng cao, hướng dẫn xây dựng ray tracer và pipeline đồ họa.

#### 67. [Real-Time-Rendering-3rd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Real-Time-Rendering-3rd-Edition.pdf)
- **Tên sách:** Real-Time Rendering (Third Edition)
- **Tác giả:** Tomas Akenine-Möller, Eric Haines, Naty Hoffman | NXB: A K Peters / CRC Press
- **Dung lượng / Số trang:** 16.66 MB | 1.045 trang
- **Từ khóa:** Graphics Processing Unit (GPU) Pipeline, Shaders, Visual Appearance, Lighting & Shadows, Global Illumination, Spatial Data Structures (BVH, Octree), Collision Detection.
- **Giá trị thực chiến:** "Kinh thánh" của ngành công nghiệp đồ họa game và mô phỏng 3D thời gian thực.

#### 68. [Digital-Image-Processing-4th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Digital-Image-Processing-4th-Edition.pdf)
- **Tên sách:** Digital Image Processing (4th Edition, 2018)
- **Tác giả:** Rafael C. Gonzalez & Richard E. Woods | NXB: Pearson
- **Dung lượng / Số trang:** 37.24 MB | 1.022 trang
- **Từ khóa:** Spatial Filtering, Frequency Domain Filtering, Image Restoration, Color Image Processing, Wavelets, Image Compression, Morphological Processing, Image Segmentation, Feature Extraction.
- **Giá trị thực chiến:** Giáo trình xử lý ảnh kinh điển nhất; nền móng cho các thuật toán thị giác máy tính và xử lý camera trên GPU.

---

## 4. MA TRẬN PHÂN LOẠI BẢN DỊCH VÀ CÁC PHIÊN BẢN (TRANSLATIONS & EDITIONS CROSS-CHECK)

Để tối ưu hóa việc đọc và chọn lựa tài liệu, bảng dưới đây làm rõ các phiên bản trùng khớp hoặc dịch thuật:

| Nhóm sách | Bản tiếng Anh (Khuyến nghị sử dụng chính) | Bản tiếng Trung (Đối chiếu nhanh) | Điểm khác biệt nội dung |
| :--- | :--- | :--- | :--- |
| **Out-of-Order CPU** | [Modern-Processor-Design...pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Modern-Processor-Design-Fundamental-of-Superscalar-Processors.pdf) | [现代处理器设计——超标量处理器基础.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/现代处理器设计——超标量处理器基础.pdf) | Bản dịch chính xác của sách giáo trình Shen & Lipasti |
| **Linker & Loader** | [Linkers-and-Loaders.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Linkers-and-Loaders.pdf) | [链接器和加载器.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/链接器和加载器.pdf) | Bản dịch đầy đủ của sách John R. Levine |
| **OpenCL Programming** | [OpenCL-Programming-Guide.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/OpenCL-Programming-Guide.pdf) | [OpenCL编程指南.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/OpenCL编程指南.pdf) | Bản dịch tương ứng của sách Aaftab Munshi |
| **Heterogeneous OpenCL**| [Heterogeneous-Computing-with-OpenCL.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Heterogeneous-Computing-with-OpenCL.pdf) | [OpenCL异构计算.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/OpenCL异构计算.pdf) | Bản dịch tương ứng của sách Benedict Gaster |
| **Sách chuyên khảo Trung Quốc**| *(Không có bản dịch tiếng Anh tương đương)* | [超标量处理器设计.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/超标量处理器设计.pdf)<br>[基于RISC-V...pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/基于RISC-V指令集的超标量处理器设计与实现.pdf)<br>[昇腾AI处理器...pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/昇腾AI处理器架构与编程——深入理解CANN技术原理及应用.pdf) | Sách nguyên bản tiếng Trung cực kỳ giá trị về thực hành RTL CPU OoO và NPU Huawei Ascend CANN |
| **Phiên bản Hennessy** | [Computer-Architecture...6th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Architecture-A-Quantitative-Approach-6th-Edition.pdf) | [Computer-Architecture...5th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Architecture-A-Quantitative-Approach-5th-Edition.pdf) | Bản 6th bổ sung toàn diện về Domain-Specific Architecture (DSA / TPU / GPU Tensor Core) |
| **Phiên bản Kurose Ross** | [Computer-Networking...8th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Networking-A-Top-Down-Approach-8th-Edition.pdf) | [Computer-Networking...7th-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Computer-Networking-A-Top-Down-Approach-7th-Edition.pdf) | Bản 8th bổ sung HTTP/3, QUIC protocol, công nghệ 5G và kiến trúc SDN |
| **Phiên bản PMPP GPU** | [Programming-Massively...3rd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Programming-Massively-Parallel-Processors-A-Hands-on-Approach-3rd-Edition.pdf) | [Programming-Massively...2nd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Programming-Massively-Parallel-Processors-A-Hands-on-Approach-2nd-Edition.pdf) | Bản 3rd cập nhật kiến trúc Pascal / Volta, Dynamic Parallelism và Unified Memory |
| **Phiên bản SAT Solvers** | [Handbook-of-Satisfiability-2nd-Edition.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Handbook-of-Satisfiability-2nd-Edition.pdf) | [Handbook-of-Satisfiability.pdf](file:///d:/Computer_Science_Parallel_Computing_Textbooks/Handbook-of-Satisfiability.pdf) | Bản 2nd mở rộng từ 981 lên 1.486 trang với các tiến bộ SAT/SMT mới nhất thập kỷ qua |

---

## 5. ĐÁNH GIÁ ĐIỂM MẠNH VÀ VÙNG KHUYẾT THIẾU (GAP ANALYSIS)

### Điểm mạnh áp đảo (World-Class Strengths)
1. **Kiến trúc phần cứng và Vi xử lý:** Đạt tiêu chuẩn đào tạo tiến sĩ của các trường đại học hàng đầu (Stanford, UC Berkeley, MIT). Toàn diện từ vi lệnh, pipeline, out-of-order, branch prediction đến RTL RISC-V.
2. **Bộ nhớ & Cache Coherence:** Đầy đủ chuyên khảo chuyên sâu hiếm có (Synthesis Lectures của Morgan & Claypool) bao quát từ vật lý DRAM đến mô hình nhất quán bộ nhớ x86/ARM/RISC-V.
3. **Lập trình tính toán song song & GPU:** Sở hữu đầy đủ các cuốn sách kinh điển của các cha đẻ công nghệ (NVIDIA Chief Scientist David Kirk, các chuyên gia OpenCL và chuẩn CUDA).

### Các vùng khuyết thiếu nếu làm dự án mở rộng (Areas to Supplement if Needed)
- **Hệ điều hành thời gian thực (RTOS) & Vi điều khiển nhúng:** Chưa có tài liệu riêng về FreeRTOS, Zephyr, hoặc ARM Cortex-M architecture.
- **Mật mã học ứng dụng nâng cao (Applied Cryptography):** Dù có Discrete Mathematics và kiến trúc phần cứng, chưa có sách chuyên khảo riêng về RSA/ECC hardware acceleration hoặc Post-Quantum Cryptography.
- **Hệ thống Web & Cloud Native:** Hoàn toàn không chứa tài liệu về Web Frameworks, Kubernetes, Microservices (ngoại trừ nguyên lý phân tán trong DDIA).
- **Mã nguồn Framework Deep Learning:** Có tài liệu kiến trúc NPU CANN và GPU CUDA, nhưng chưa có tài liệu về kiến trúc bên trong của PyTorch C++ Core engine.

---

## 6. HƯỚNG DẪN SỬ DỤNG FILE NÀY TRONG DỰ ÁN MỚI
Khi bắt đầu một dự án mới, hãy đính kèm tệp markdown này vào câu lệnh định hướng (prompt) kèm theo yêu cầu:
> *"Hãy kiểm tra tệp `TAI_LIEU_THAM_KHAO.md` để đối chiếu xem với bài toán [Tên bài toán của bạn], tôi có những tài liệu chuyên khảo nào khả dụng trong thư mục. Hãy chỉ ra chính xác các chương hoặc cuốn sách cốt lõi nhất để giải quyết vấn đề."*

Trợ lý AI sẽ lập tức định vị chính xác đầu sách, giúp bạn tiết kiệm hàng chục giờ tìm kiếm tài liệu bên ngoài và tận dụng tối đa kho tri thức sẵn có trên máy tính của bạn.
