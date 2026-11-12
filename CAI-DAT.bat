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
where claude >nul 2>nul
if errorlevel 1 (
  echo  [!] Chua co Claude Code. Trang huong dan cai se mo ra.
  echo      Cai xong, mo cua so lenh go: claude   roi dang nhap tai khoan Claude cua ban.
  start https://docs.claude.com/en/docs/claude-code/setup
  pause
  exit /b
)
echo  [ok] Claude Code
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
