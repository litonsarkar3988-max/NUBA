# nuba.ps1 — PowerShell launcher for Nuba on Windows
# Place in a directory on $env:PATH

$ErrorActionPreference = "Stop"

# ── Find Python ──────────────────────────────────────────────────────────
$python = $null
foreach ($cmd in @("python3","python","py")) {
    if (Get-Command $cmd -ErrorAction SilentlyContinue) {
        $python = $cmd
        break
    }
}
if (-not $python) {
    Write-Error "nuba: Python 3 not found. Install from https://python.org"
    exit 127
}

# ── Minimum version check ────────────────────────────────────────────────
$ver = & $python -c "import sys; print(sys.version_info.major, sys.version_info.minor)"
$major, $minor = $ver -split ' '
if ([int]$major -lt 3 -or ([int]$major -eq 3 -and [int]$minor -lt 8)) {
    Write-Error "nuba: Python 3.8+ required. Found: $major.$minor"
    exit 1
}

# ── Run Nuba ─────────────────────────────────────────────────────────────
$nubaMain = Join-Path $PSScriptRoot "nuba_main.py"
& $python $nubaMain @args
exit $LASTEXITCODE
