# ==============================================================================
# FPGA Build Script for Sipeed Tang Nano 9K (GW1NR-9C)
# Flow: Yosys Synthesis -> nextpnr-himbaechel PnR + STA -> gowin_pack Bitstream
# ==============================================================================

param (
    [string]$CadRoot = "D:\oss-cad-suite"
)

# Load oss-cad-suite environment
if (Test-Path "$CadRoot\environment.ps1") {
    . "$CadRoot\environment.ps1"
} else {
    Write-Error "oss-cad-suite not found at $CadRoot!"
    exit 1
}

New-Item -ItemType Directory -Force -Path fpga/build | Out-Null

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " [Step 1/3] Running Logic Synthesis with Yosys..." -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

$rtl_files = @(
    "rtl/core/alu.sv",
    "rtl/core/alu_decoder.sv",
    "rtl/core/main_decoder.sv",
    "rtl/core/control_unit.sv",
    "rtl/core/extend_imm.sv",
    "rtl/core/program_counter.sv",
    "rtl/core/register_file.sv",
    "rtl/core/data_path.sv",
    "rtl/core/cpu.sv",
    "rtl/mem/instruction_memory.sv",
    "rtl/mem/ram.sv",
    "rtl/periph/memory_controller.sv",
    "rtl/periph/cpu_apb_bridge.sv",
    "rtl/periph/gpio/gpio_apb.sv",
    "rtl/periph/uart/baud_generator.sv",
    "rtl/periph/uart/uart_tx.sv",
    "rtl/periph/uart/uart_rx.sv",
    "rtl/periph/uart/uart_apb.sv",
    "rtl/top.sv",
    "fpga/fpga_top.sv"
)

$read_cmd = "read_verilog -sv " + ($rtl_files -join " ")
yosys -p "$read_cmd; synth_gowin -top fpga_top -json fpga/build/netlist.json"

if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Synthesis failed!" -ForegroundColor Red
    exit 1
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " [Step 2/3] Running Place & Route (PnR) and STA..." -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

nextpnr-himbaechel `
    --device GW1NR-LV9QN88PC6/I5 `
    --vopt family=GW1N-9C `
    --vopt cst=fpga/constraints/pins.cst `
    --sdc fpga/constraints/timing.sdc `
    --json fpga/build/netlist.json `
    --write fpga/build/pnr.json

if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Place & Route failed!" -ForegroundColor Red
    exit 1
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " [Step 3/3] Generating Bitstream with gowin_pack..." -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

python -m apycula.gowin_pack -d GW1N-9C -o fpga/build/pack.fs fpga/build/pnr.json
if ($LASTEXITCODE -ne 0) {
    gowin_pack -d GW1N-9C -o fpga/build/pack.fs fpga/build/pnr.json
}

if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Bitstream packing failed!" -ForegroundColor Red
    exit 1
}

Write-Host "==========================================================" -ForegroundColor Green
Write-Host " [SUCCESS] Bitstream generated: fpga/build/pack.fs" -ForegroundColor Green
Write-Host " Connect Tang Nano 9K and run .\fpga\flash_fpga.ps1 to flash!" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green
