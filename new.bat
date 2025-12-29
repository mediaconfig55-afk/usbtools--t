@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul
cd /d "%~dp0"

:: ======================================================
:: YONETICI KONTROLU
:: ======================================================
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo [HATA] Bu arac yonetici olarak calistirilmalidir.
    echo.
    pause
    goto :EOF
)

:: ======================================================
:: SABIT AYARLAR
:: ======================================================
set "VERSION=7.3"

title Professional IT Support & USB Suite v%VERSION% - Code Emre Bilgin
mode con: cols=110 lines=52
color 0B

:: MENUYE GIRMEDEN ONCE TEMIZLIK (OTOMATIK TETIKLENME ENGELI)
set choice=
echo.
echo Devam etmek icin bir tusa basin...
pause >nul

:: ======================================================
:: ANA MENU
:: ======================================================
:MENU
cls
set choice=
echo.
echo ##########################################################################################
echo #                 USB YONETIM VE SISTEM BAKIM KONSOLU (V%VERSION%)                       #
echo #                           ==== CODE EMRE BILGIN ====                                  #
echo ##########################################################################################
echo.
echo --- USB VE DISK ISLEMLERI ---             --- SISTEM BAKIM VE ONARIM ---
echo [1]  Mevcut Diskleri Goruntule            [16] Sistem Dosyalarini Onar (SFC)
echo [2]  Akilli Format (NTFS/FAT32/exFAT)     [17] Sabit Diski Tarama (CHKDSK)
echo [3]  Yazma Korumasini ETKINLESTIR          [18] Disk Temizligi
echo [4]  Yazma Korumasini KALDIR               [19] Grup Politikalari Guncelle
echo [5]  Disk ve Bolum Detaylari               [20] Windows Guncelleme Durumu
echo.
echo --- SISTEM BILGILERI ---                  --- AG VE NETWORK ---
echo [6]  Bilgisayar Bilgileri                 [26] DNS Temizle
echo [7]  IP Adresi                            [27] IP Yenile
echo [8]  Windows Lisans Durumu                [28] Ping Test
echo [9]  Detayli Sistem Bilgisi               [29] Tracert
echo [10] CPU Bilgisi                          [30] Netstat
echo [11] RAM Bilgisi
echo.
echo --- PRO TEKNISYEN ---
echo [34] Wi-Fi Sifresini Goster
echo [35] CIKIS
echo.
echo ##########################################################################################
set /p choice="Islem seciniz: "

if "%choice%"=="1" goto LIST
if "%choice%"=="2" goto FORMAT_SELECTION
if "%choice%"=="3" goto PROTECT
if "%choice%"=="4" goto UNPROTECT
if "%choice%"=="5" goto DETAIL
if "%choice%"=="6" goto COMPUTER_INFO
if "%choice%"=="7" goto IP
if "%choice%"=="8" goto LICENSE
if "%choice%"=="9" goto SYSINFO
if "%choice%"=="10" goto CPUINFO
if "%choice%"=="11" goto MEMORY
if "%choice%"=="16" goto SFC
if "%choice%"=="17" goto CHKDSK
if "%choice%"=="18" goto CLEANUP
if "%choice%"=="19" goto GPUPDATE
if "%choice%"=="20" goto WINDOWSUPDATE
if "%choice%"=="26" goto CLEAR_DNS
if "%choice%"=="27" goto IP_RENEW
if "%choice%"=="28" goto PING_TEST
if "%choice%"=="29" goto TRACERT_TEST
if "%choice%"=="30" goto NETSTAT_TEST
if "%choice%"=="34" goto WIFI_PASSWORD
if "%choice%"=="35" goto EXIT_APP

goto MENU

:: ======================================================
:: FONKSIYONLAR
:: ======================================================

:LIST
cls
echo list disk > ds.txt
diskpart /s ds.txt
del ds.txt
pause
goto MENU

:FORMAT_SELECTION
cls
echo list disk > ds.txt
diskpart /s ds.txt
del ds.txt
set /p diskID="Formatlanacak Disk No: "
echo [1] NTFS  [2] FAT32  [3] exFAT
set /p fs_choice="Secim: "
if "%fs_choice%"=="1" set fs=ntfs
if "%fs_choice%"=="2" set fs=fat32
if "%fs_choice%"=="3" set fs=exfat
set /p confirm="Disk silinecek. Onay (E/H): "
if /I not "%confirm%"=="E" goto MENU
(
echo select disk %diskID%
echo clean
echo create partition primary
echo format fs=%fs% quick
echo assign
)>ds.txt
diskpart /s ds.txt
del ds.txt
pause
goto MENU

:PROTECT
cls
set /p diskID="Disk No: "
(echo select disk %diskID% & echo attributes disk set readonly)>ds.txt
diskpart /s ds.txt
del ds.txt
pause
goto MENU

:UNPROTECT
cls
set /p diskID="Disk No: "
(echo select disk %diskID% & echo attributes disk clear readonly)>ds.txt
diskpart /s ds.txt
del ds.txt
pause
goto MENU

:DETAIL
cls
set /p diskID="Disk No: "
(echo select disk %diskID% & echo detail disk)>ds.txt
diskpart /s ds.txt
del ds.txt
pause
goto MENU

:COMPUTER_INFO
cls
hostname
wmic computersystem get manufacturer,model
pause
goto MENU

:IP
cls
ipconfig | findstr /i "IPv4"
pause
goto MENU

:LICENSE
cls
slmgr /xpr
pause
goto MENU

:SYSINFO
cls
systeminfo
pause
goto MENU

:CPUINFO
cls
wmic cpu get name
pause
goto MENU

:MEMORY
cls
wmic memorychip get capacity,speed
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

:CLEANUP
cleanmgr
pause
goto MENU

:GPUPDATE
gpupdate /force
pause
goto MENU

:WINDOWSUPDATE
wmic qfe list brief /format:table
pause
goto MENU

:CLEAR_DNS
ipconfig /flushdns
pause
goto MENU

:IP_RENEW
ipconfig /release
ipconfig /renew
pause
goto MENU

:PING_TEST
cls
set /p ip="IP: "
ping %ip%
pause
goto MENU

:TRACERT_TEST
cls
set /p ip="IP: "
tracert %ip%
pause
goto MENU

:NETSTAT_TEST
netstat -an
pause
goto MENU

:WIFI_PASSWORD
cls
set /p wifi="Ag Adi: "
netsh wlan show profile name="%wifi%" key=clear | findstr /i "Key Content"
pause
goto MENU

:EXIT_APP
cls
echo Program sonlandiriliyor...
timeout /t 1 >nul
exit
