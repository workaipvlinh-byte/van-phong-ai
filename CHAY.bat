@echo off
chcp 65001 >nul
title Van Phong AI - dong cua so nay la van phong nghi
cd /d "%~dp0"
start "" http://localhost:8080
:loop
python van_phong.py
echo Van phong vua tat, 10 giay nua tu mo lai...
timeout /t 10 /nobreak >nul
goto loop
