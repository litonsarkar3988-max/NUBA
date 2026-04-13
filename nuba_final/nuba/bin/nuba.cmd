@echo off
:: nuba.cmd  —  Windows launcher for the Nuba programming language
:: Place this file in a directory on your PATH (e.g., C:\nuba\bin\)

setlocal

:: ── Locate Python ─────────────────────────────────────────────────────────
set PYTHON=
for %%P in (python3 python py) do (
    where %%P >nul 2>&1
    if !errorlevel! == 0 (
        set PYTHON=%%P
        goto :found_python
    )
)
echo nuba: error: Python 3 not found. Please install Python 3.8+ from https://python.org
exit /b 127
:found_python

:: ── Locate nuba launcher ──────────────────────────────────────────────────
set "NUBA_HOME=%~dp0.."
set "NUBA_BIN=%~dp0nuba_main.py"

:: Check version
for /f "tokens=*" %%V in ('%PYTHON% -c "import sys; print(sys.version_info[:2])"') do set PYVER=%%V

:: ── Run ───────────────────────────────────────────────────────────────────
%PYTHON% "%NUBA_BIN%" %*
exit /b %errorlevel%
