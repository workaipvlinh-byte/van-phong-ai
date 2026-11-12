@echo off
chcp 65001 >nul
title Cai dat Van Phong AI
cd /d "%~dp0"
echo.
echo  ===== CAI DAT VAN PHONG AI =====
echo.
where python >nul 2>nul
if errorlevel 1 (
  echo  [!] Chua co Python. Trang tai Python se mo ra.
  echo      Cai ban moi nhat, NHO TICK o "Add python.exe to PATH", roi bam dup lai file nay.
  start https://www.python.org/downloads/
  pause
  exit /b
)
python -c "import sys; sys.exit(0 if sys.version_info >= (3, 10) else 1)"
if errorlevel 1 (
  echo  [!] Python qua cu. Can ban 3.10 tro len.
  start https://www.python.org/downloads/
  pause
  exit /b
)
echo  [ok] Python
set "CLAUDE_BIN=%USERPROFILE%\.local\bin"
if exist "%CLAUDE_BIN%\claude.exe" set "PATH=%CLAUDE_BIN%;%PATH%"
where claude >nul 2>nul
if not errorlevel 1 goto co_claude
echo  [!] Chua co Claude Code.
choice /c CK /n /m " Cai Claude Code tu dong bang bo cai chinh thuc cua Anthropic? Bam C (co) hoac K (khong): "
if errorlevel 2 (
  echo      Tu cai theo trang huong dan: https://code.claude.com/docs/en/setup
  start https://code.claude.com/docs/en/setup
  pause
  exit /b
)
echo  Dang tai va cai Claude Code, mat 1-2 phut, cua so co the dung im mot luc...
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://claude.ai/install.ps1 | iex"
if exist "%CLAUDE_BIN%\claude.exe" set "PATH=%CLAUDE_BIN%;%PATH%"
where claude >nul 2>nul
if errorlevel 1 (
  echo  [!] Cai chua duoc. Kiem tra mang roi bam dup lai file nay.
  echo      Van loi thi chup man hinh cua so nay gui vao nhom de duoc chi.
  pause
  exit /b
)
:co_claude
echo  [ok] Claude Code
set "CLAUDE_CFG=%USERPROFILE%\.claude"
if defined CLAUDE_CONFIG_DIR set "CLAUDE_CFG=%CLAUDE_CONFIG_DIR%"
:kiem_dang_nhap
if exist "%CLAUDE_CFG%\.credentials.json" goto da_dang_nhap
echo.
echo  [!] Claude Code chua dang nhap. Mot cua so moi se mo ra:
echo      1. Hoi gi ve giao dien, mau sac thi cu bam Enter.
echo      2. Hoi cach dang nhap thi chon tai khoan Claude (Claude account with subscription), bam Enter.
echo      3. Trinh duyet mo trang claude.ai: dang nhap tai khoan Pro tro len, bam Authorize.
echo      4. Thay "Login successful" la xong. Go /exit roi Enter de dong cua so do.
echo.
pause
start "Dang nhap Claude Code" /wait /d "%USERPROFILE%" cmd /c claude
if exist "%CLAUDE_CFG%\.credentials.json" goto da_dang_nhap
echo.
echo  [!] Van chua thay dang nhap.
choice /c TB /n /m " Bam T de thu dang nhap lai, B de bo qua (lam sau): "
if errorlevel 2 goto bo_dang_nhap
goto kiem_dang_nhap
:bo_dang_nhap
echo  [..] Bo qua. Nho dang nhap sau: mo cmd, go claude, lam theo huong dan.
goto sau_dang_nhap
:da_dang_nhap
echo  [ok] Da dang nhap Claude
:sau_dang_nhap
if not exist .env copy .env.example .env >nul
echo  [ok] File cau hinh .env
echo.
choice /c CK /n /m " Cho van phong tu chay moi khi bat may? Bam C (co) hoac K (khong): "
if errorlevel 2 goto xong
powershell -NoProfile -Command "$s=(New-Object -ComObject WScript.Shell).CreateShortcut([Environment]::GetFolderPath('Startup')+'\Van Phong AI.lnk');$s.TargetPath='%~dp0CHAY.bat';$s.WorkingDirectory='%~dp0';$s.WindowStyle=7;$s.Save()"
echo  [ok] Da them vao Startup
:xong
echo.
echo  Xong! Van phong dang mo, trinh duyet se hien bang dieu khien.
start "" CHAY.bat
timeout /t 3 >nul
