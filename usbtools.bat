@echo off
echo USBTOOLS TEST BASLADI
pause

setlocal EnableExtensions EnableDelayedExpansion
chcp 65001 >nul
cd /d "%~dp0"

:: ==========================================
:: USBTOOLS – Professional IT Support Console
:: Version 7.0
:: Code: Emre Bilgin
:: ==========================================

:: --- YONETICI KONTROLU ---
net session >nul 2>&1
if errorlevel 1 (
    echo [!] Lutfen bu dosyayi SAG TIKLAYIP "Yonetici Olarak Calistir" secin.
    pause
    exit /b
)
