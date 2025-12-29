@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
cd /d "%~dp0"

:: --- YONETICI KONTROLU ---
net session >nul 2>&1
if errorlevel 1 (
    echo [!] Lutfen YONETICI olarak calistirin.
    pause
    exit /b
)

:: --- AYARLAR ---
set "VERSION=7.0"

color 0A
title Professional IT Support & USB Suite v%VERSION%
mode con: cols=110 lines=52

:MENU
cls
echo.
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
echo  [12] Kullanici Hesaplarini Listele        [27] IP Yapilandirmasi (All/Renew)
echo  [13] Depolama Alani Durumu                [28] Ping Testi Yap
echo  [14] Son Format Tarihini Goster           [29] Tracert (Yol Izleme)
echo  [15] Windows Surum Bilgisi (Winver)       [30] Netstat (Baglanti Durumu)
echo.                                           [31] ARP / [32] Route / [33] Nbtstat
echo  --- PRO TEKNISYEN ARACLARI (YENI) ---     [34] WI-FI SIFRESINI GOSTER
echo  [36] Windows Update Servislerini SIFIRLA  [35] CIKIS
echo  [37] Tum Suruculeri (Drivers) YEDEKLE     ----------------------------------------------
echo  [38] Guc Plani: NIHAI PERFORMANS          [41] Gorev Cubugu ve Explorer ONAR
echo  [39] Hosts Dosyasini SIFIRLA              [42] Detayli BIOS / Anakart Bilgisi
echo  [40] Yazici Kuyrugunu (Spooler) TEMIZLE   [43] Pil Saglik Raporu (Laptop)
echo.                                           [44] Windows Telemetriyi KAPAT
echo  ##########################################################################################
set /p choice="Islem seciniz [1-44]: "

if "%choice%"=="35" goto EXIT_APP

:: (DIGER GOTO’LAR SENIN KODUNDA OLDUGU GIBI DEVAM EDER)

goto MENU

:EXIT_APP
cls
echo Programdan cikiliyor...
timeout /t 1 >nul
exit /b
