# ==============================================================================
# FPGA Flash Script for Sipeed Tang Nano 9K (GW1NR-9C)
# Target: Onboard BL702 USB-JTAG programmer
# ==============================================================================

param (
    [Parameter(Position = 0)]
    [ValidateSet("sram", "flash", IgnoreCase = $true)]
    [string]$Mem = "sram",

    [string]$CadRoot = "D:\oss-cad-suite",
    [switch]$Flash,
    [switch]$Sram
)

# Switch override
if ($Flash) { $Mem = "flash" }
if ($Sram)  { $Mem = "sram" }

# Load oss-cad-suite environment
if (Test-Path "$CadRoot\environment.ps1") {
    . "$CadRoot\environment.ps1"
} else {
    Write-Error "oss-cad-suite not found at $CadRoot!"
    exit 1
}

$bitstream = "fpga/build/pack.fs"

if (!(Test-Path $bitstream)) {
    Write-Error "Bitstream not found at $bitstream! Run .\fpga\build_fpga.ps1 first."
    exit 1
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Target Board:  Sipeed Tang Nano 9K (GW1NR-9C)" -ForegroundColor Cyan
Write-Host " Target Memory: $($Mem.ToUpper())" -ForegroundColor Cyan
Write-Host " Bitstream:     $bitstream" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

if ($Mem.ToLower() -eq "flash") {
    Write-Host "==> Programming onboard SPI Flash (Non-volatile, persists after reboot)..." -ForegroundColor Yellow
    openFPGALoader -b tangnano9k -f $bitstream
} else {
    Write-Host "==> Programming FPGA SRAM (Volatile, fast test)..." -ForegroundColor Green
    openFPGALoader -b tangnano9k $bitstream
}

if ($LASTEXITCODE -eq 0) {
    Write-Host "==========================================================" -ForegroundColor Green
    Write-Host " [SUCCESS] Programmed $($Mem.ToUpper()) successfully!" -ForegroundColor Green
    Write-Host "==========================================================" -ForegroundColor Green
} else {
    Write-Host "[ERROR] openFPGALoader failed with exit code $LASTEXITCODE" -ForegroundColor Red
}
