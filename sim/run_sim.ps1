# Run Simulation with ModelSim
Write-Host "==> Compiling RTL and Testbench..." -ForegroundColor Cyan
vlog -sv -lint -f sim/rtl.f sim/tb.sv

if ($LASTEXITCODE -ne 0) {
    Write-Host "Verilog compilation failed!" -ForegroundColor Red
    exit 1
}

Write-Host "==> Running Simulation..." -ForegroundColor Cyan
vsim -c tb -do "run -all; quit"

Write-Host "==> Simulation completed! Waveform dumped to sim/wave.vcd" -ForegroundColor Green
