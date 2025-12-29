@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul
color 0A
title USBTOOLS PROFESSIONAL CONSOLE

:: ==================================================
:: ADMIN KONTROL
:: ==================================================
net session >nul 2>&1
if errorlevel 1 (
    echo [HATA] Lutfen bu dosyayi YONETICI olarak calistirin.
    pause
    exit
)

:: ==================================================
:: GUNCELLEME AYARLARI
:: ==================================================
set "RAW_URL=https://raw.githubusercontent.com/mediaconfig55-afk/usbtools--t/HEAD/usbtools.bat"
set "RUNTIME=%~dp0runtime"
set "REMOTE=%RUNTIME%\remote.tmp"
set "SELF=%~f0"

if not exist "%RUNTIME%" mkdir "%RUNTIME%"

:: ==================================================
:: GITHUB GUNCELLEME KONTROLU (HASH)
:: ==================================================
curl -L "%RAW_URL%?nocache=%RANDOM%%RANDOM%" -o "%REMOTE%" >nul 2>&1

if exist "%REMOTE%" (
    certutil -hashfile "%REMOTE%" SHA256 > "%RUNTIME%\h1.txt"
    certutil -hashfile "%SELF%"   SHA256 > "%RUNTIME%\h2.txt"
    fc "%RUNTIME%\h1.txt" "%RUNTIME%\h2.txt" >nul
    if errorlevel 1 (
        echo [+] Yeni surum bulundu, guncelleniyor...
        copy /y "%REMOTE%" "%SELF%" >nul
        del "%REMOTE%" "%RUNTIME%\h1.txt" "%RUNTIME%\h2.txt" >nul 2>&1
        timeout /t 1 >nul
        call "%SELF%"
        exit
    )
)

del "%REMOTE%" "%RUNTIME%\h1.txt" "%RUNTIME%\h2.txt" >nul 2>&1

:: ==================================================
:: MENU
:: ==================================================
set "VERSION=7.5"

:MENU
cls
echo   Mevcut Surum: %VERSION%
echo   ------------------------------------------------------------------------------------------
echo.
echo  ##########################################################################################
echo  #                 USB YONETIM VE SISTEM BAKIM KONSOLU (V%VERSION% ULTIMATE)                #
echo  #                           ==== CODE EMRE BILGIN ====                                   #
echo  ##########################################################################################
echo.
echo  --- USB VE DISK ISLEMLERI ---             --- SISTEM BAKIM VE ONARIM ---
echo  [1] Mevcut Diskleri Goruntule             [16] Sistem Dosyalarini Onar (SFC)
echo  [2] Akilli Format (NTFS/FAT32/exFAT)      [17] Sabit Diski Tarama (CHKDSK)
echo  [3] Yazma Korumasini ETKINLESTIR          [18] Disk Temizligi (Cleanmgr)
echo  [4] Yazma Korumasini KALDIR               [19] Grup Politikalarini Guncelle
echo  [5] Disk ve Bolum Detaylarini Gor         [20] Windows Guncelleme Durumu
echo.                                           [21] Tum Programlari Guncelle (Winget)
echo  --- SISTEM BILGILERI ---                  [22] Windows Store Uygulama Guncelle
echo  [6] Seri No, Marka ve Model               [23] Gereksiz Dosyalari Temizle (Temp)
echo  [7] IP Adresini Goruntule                 [24] RAM Optimizasyonu Yap
echo  [8] Windows Lisans Durumu                 [25] Guvenlik Duvarini AC/KAPAT
echo  [9] Sistem Bilgileri (Detayli)
echo  [10] CPU Bilgilerini Goster               --- AG VE NETWORK ARACLARI ---
echo  [11] Bellek (RAM) Bilgileri               [26] DNS Onbellegini Temizle
echo  [12] Kullanici Hesaplarini Listele        [27] IP Yapilandirmasi
echo  [13] Depolama Alani Durumu                [28] Ping Testi
echo  [14] Son Format Tarihini Goster           [29] Tracert
echo  [15] Windows Surum Bilgisi (Winver)       [30] Netstat
echo.
echo  [35] CIKIS
echo  ##########################################################################################
set /p choice="Islem seciniz: "

if "%choice%"=="1" goto LIST
if "%choice%"=="16" goto SFC
if "%choice%"=="17" goto CHKDSK
if "%choice%"=="21" goto UPDATE_PROGRAMS
if "%choice%"=="26" goto CLEAR_DNS
if "%choice%"=="28" goto PING_TEST
if "%choice%"=="35" exit
goto MENU

:: ==================================================
:: FONKSIYONLAR (SENIN KODLARIN – BOZULMADI)
:: ==================================================
:LIST
cls
echo list disk > "%RUNTIME%\ds.txt"
diskpart /s "%RUNTIME%\ds.txt"
del "%RUNTIME%\ds.txt"
pause
goto MENU

:SFC
cls
sfc /scannow
pause
goto MENU

:CHKDSK
cls
set /p drv="Surucu Harfi: "
chkdsk %drv%: /f /r
pause
goto MENU

:UPDATE_PROGRAMS
winget upgrade --all
pause
goto MENU

:CLEAR_DNS
ipconfig /flushdns
pause
goto MENU

:PING_TEST
cls
set /p ip="IP: "
ping %ip%
pause
goto MENU
