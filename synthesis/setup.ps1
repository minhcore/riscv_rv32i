$candidates = @()

$yosysCmd = Get-Command yosys.exe -ErrorAction SilentlyContinue
if ($yosysCmd) {
    $candidates += (Get-Item $yosysCmd.Source).Directory.Parent.FullName
}

$candidates += "C:\oss-cad-suite", "D:\oss-cad-suite", "E:\oss-cad-suite"

$cadRoot = $candidates | Where-Object { Test-Path "$_\environment.ps1" } | Select-Object -First 1

if ($cadRoot) {
    . "$cadRoot\environment.ps1"
    Write-Host "[INFO] Environment setup completed: $cadRoot" -ForegroundColor Green
} else {
    Write-Warning "[WARNING] oss-cad-suite not found. Please check your installation path."
}
