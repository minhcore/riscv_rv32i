# Compile Bare-metal C program for RV32I SoC
param (
    [string]$App = "sw/app/main.c"
)

Write-Host "==> Compiling: $App" -ForegroundColor Cyan

# 1. Compile C & Assembly to ELF using Linker script
riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -O2 `
    -Isw/bsp -T sw/bsp/link.ld `
    sw/bsp/startup.s $App `
    -o sw/build/main.elf

if ($LASTEXITCODE -ne 0) {
    Write-Host "Compilation failed!" -ForegroundColor Red
    exit 1
}

# 2. Convert ELF to Verilog Hex format (mem.h) with 32-bit word width
riscv32-unknown-elf-objcopy -O verilog --verilog-data-width 4 sw/build/main.elf sw/build/mem.h

# 3. Disassemble for verification
riscv32-unknown-elf-objdump -d sw/build/main.elf | Out-File -Encoding utf8 sw/build/main.dump

Write-Host "==> Generated sw/build/mem.h and sw/build/main.dump successfully!" -ForegroundColor Green
