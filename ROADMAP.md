# RISC-V RV32I Processor - Development Roadmap

> Reference: **"Digital Design and Computer Architecture: RISC-V Edition"** (Sarah L. Harris & David Money Harris).  
> Development Strategy: **Problem-Driven Development** (Single-Cycle Core targeting FPGA and C execution).

---

## 🧭 I. Macro Roadmap

```
+-------------------------+       +-------------------------+       +-------------------------+
| PHASE 1:                |       | PHASE 2:                |       | PHASE 3:                |
| Single-Cycle RV32I Core | ----> | Basic SoC & FPGA        | ----> | Interrupts & CSR        |
| Full ISA, C Environment |       | MMIO, UART, GPIO        |       | Timers, Bare-metal OS   |
+-------------------------+       +-------------------------+       +-------------------------+
```

1. **Phase 1: Single-Cycle RV32I Core** - Complete RV32I ISA and run C programs (CPI = 1).
2. **Phase 2: Basic SoC & FPGA** - Memory map, UART, GPIO, and on-board FPGA deployment.
3. **Phase 3: Interrupts & CSR** - Timers, CSR registers, and real-time bare-metal support.

---

## 🛠️ II. Detailed Milestones

### 📌 Phase 1: Complete RV32I Single-Cycle Core

#### Completed:
- [x] Memory access: `lw`, `sw`
- [x] R-type arithmetic & logic: `add`, `sub`, `and`, `or`, `slt`
- [x] Immediate arithmetic: `addi`
- [x] Conditional branches (B-type): `beq`, `bne`, `blt`, `bge`, `bltu`, `bgeu` (signed and unsigned)
- [x] Unconditional jumps: `jal`, `jalr`
- [x] Upper immediate instructions: `lui`, `auipc`
- [x] Toolchain workflow: C -> ASM (`test.s`) -> ELF -> Hex (`mem.h`) -> Simulation

#### In Progress / Next Goals:
- [ ] Shift operations: `sll`, `srl`, `sra`, `slli`, `srli`, `srai`
- [ ] Sub-word memory access: `lb`, `lbu`, `lh`, `lhu`, `sb`, `sh` (8-bit and 16-bit)
- [ ] Stack initialization (`startup.s`): Set `sp` to RAM top and call `main()`
- [ ] C Software verification: Run benchmarks (Fibonacci, Bubble Sort, Factorial)

---

### 📌 Phase 2: Basic SoC Integration & FPGA Implementation

- [ ] Address decoder & memory map: ROM, RAM, and MMIO space
- [ ] UART Transmitter module: 115200 baud serial console
- [ ] GPIO module: Pushbuttons and LEDs
- [ ] FPGA synthesis & bitstream: Pin constraints and hardware test ("Hello World!")

---

### 📌 Phase 3: CSR & Interrupts (Privileged Architecture)

- [ ] Control & Status Registers (CSR): `mstatus`, `mie`, `mip`, `mtvec`, `mepc`, `mcause`
- [ ] Hardware Timer: `mtime` and `mtimecmp` for periodic interrupts
- [ ] Privileged instructions: `mret` and `ecall`

---

## 📚 References
- *Digital Design and Computer Architecture: RISC-V Edition* - Harris & Harris.
- *The RISC-V Instruction Set Manual, Volume I: Unprivileged ISA (RV32I)*.
- *The RISC-V Instruction Set Manual, Volume II: Privileged Architecture*.
