@echo off
setlocal EnableExtensions EnableDelayedExpansion
chcp 65001 >nul
cd /d "%~dp0"

:: ===============================
:: USBTOOLS – STABLE CORE
:: ===============================

:: --- ADMIN KONTROL ---
net session >nul 2>&1
if errorlevel 1 (
    echo [!] Lutfen bu dosyayi SAG TIKLAYIP "Yonetici Olarak Calistir" secin.
    pause
    exit /b
)

color 0A
title USBTOOLS v7.0
mode con: cols=90 lines=30

:MENU
cls
echo.
echo  ===============================
echo   USBTOOLS v7.0 (STABLE)
echo  ===============================
echo.
echo  [1] Test Mesaji
echo  [2] IP Adresini Goster
echo  [3] Cikis
echo.
set /p secim=Seciminiz: 

if "%secim%"=="1" goto TEST
if "%secim%"=="2" goto IP
if "%secim%"=="3" exit
goto MENU

:TEST
cls
echo USBTOOLS GITHUB GUNCEL SURUM CALISIYOR
pause
goto MENU

:IP
cls
ipconfig | findstr IPv4
pause
goto MENU
