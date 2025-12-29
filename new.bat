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
    exit /b
)

:: ======================================================
:: SABIT AYARLAR
:: ======================================================
set "VERSION=7.4"

title Professional IT Support & USB Suite v%VERSION% - Code Emre Bilgin
mode con: cols=120 lines=55
color 0B

:: Ilk acilista otomatik calisma engeli
echo.
echo Devam etmek icin bir tusa basin...
pause >nul

:: ======================================================
:: ANA MENU
:: ======================================================
:MENU
cls
echo ==========================================================================================
echo        USB TOOLS & SISTEM YONETIM KONSOLU   -   V%VERSION%
echo                         CODE EMRE BILGIN
echo ==========================================================================================
echo.
echo  --- USB / DISK ISLEMLERI ---
echo  [1]  Diskleri Listele
echo  [2]  Disk Detaylari
echo  [3]  Disk Yazma Korumasi AKTIF
echo  [4]  Disk Yazma Korumasi KALDIR
echo  [5]  Akilli Format (NTFS / FAT32 / exFAT)
echo.
echo  --- SISTEM BILGILERI ---
echo  [10] Bilgisayar Bilgileri
echo  [11] IP Adresi
echo  [12] CPU Bilgisi
echo  [13] RAM Bilgisi
echo  [14] Detayli Sistem Bilgisi
echo.
echo  --- SISTEM BAKIM ---
echo  [20] Sistem Dosya Onarimi (SFC)
echo  [21] Disk Tarama (CHKDSK)
echo  [22] Disk Temizligi
echo  [23] Grup Politikalari Guncelle
echo  [24] Windows Guncelleme Durumu
echo.
echo  --- NETWORK ---
echo  [30] DNS Temizle
echo  [31] IP Yenile
echo  [32] Ping Test
echo  [33] Tracert
echo  [34] Netstat
echo.
echo  --- PROFESYONEL ---
echo  [40] Wi-Fi Sifresi Goster
echo.
echo  [99] CIKIS
echo.
set /p secim="Islem seciniz: "

if "%secim%"=="1"  goto DISK_LIST
if "%secim%"=="2"  goto DISK_DETAIL
if "%secim%"=="3"  goto DISK_PROTECT
if "%secim%"=="4"  goto DISK_UNPROTECT
if "%secim%"=="5"  goto DISK_FORMAT

if "%secim%"=="10" goto PC_INFO
if "%secim%"=="11" goto IP_INFO
if "%secim%"=="12" goto CPU_INFO
if "%secim%"=="13" goto RAM_INFO
if "%secim%"=="14" goto SYS_INFO

if "%secim%"=="20" goto SFC_SCAN
if "%secim%"=="21" goto CHKDSK_SCAN
if "%secim%"=="22" goto CLEANMGR_RUN
if "%secim%"=="23" goto GPUPDATE_RUN
if "%secim%"=="24" goto WIN_UPDATE

if "%secim%"=="30" goto DNS_CLEAR
if "%secim%"=="31" goto IP_RENEW
if "%secim%"=="32" goto PING_TEST
if "%secim%"=="33" goto TRACERT_TEST
if "%secim%"=="34" goto NETSTAT_TEST

if "%secim%"=="40" goto WIFI_PASS
if "%secim%"=="99" goto EXIT_APP

goto MENU

:: ======================================================
:: FONKSIYONLAR
:: ======================================================

:DISK_LIST
cls
echo list disk > %temp%\ds.txt
diskpart /s %temp%\ds.txt
del %temp%\ds.txt
pause
goto MENU

:DISK_DETAIL
cls
set /p dno="Disk No: "
(
echo select disk %dno%
echo detail disk
)>%temp%\ds.txt
diskpart /s %temp%\ds.txt
del %temp%\ds.txt
pause
goto MENU

:DISK_PROTECT
cls
set /p dno="Disk No: "
(echo select disk %dno% & echo attributes disk set readonly)>%temp%\ds.txt
diskpart /s %temp%\ds.txt
del %temp%\ds.txt
pause
goto MENU

:DISK_UNPROTECT
cls
set /p dno="Disk No: "
(echo select disk %dno% & echo attributes disk clear readonly)>%temp%\ds.txt
diskpart /s %temp%\ds.txt
del %temp%\ds.txt
pause
goto MENU

:DISK_FORMAT
cls
echo list disk > %temp%\ds.txt
diskpart /s %temp%\ds.txt
del %temp%\ds.txt
set /p dno="Disk No: "
echo [1] NTFS  [2] FAT32  [3] exFAT
set /p fs="Secim: "
if "%fs%"=="1" set fss=ntfs
if "%fs%"=="2" set fss=fat32
if "%fs%"=="3" set fss=exfat
set /p onay="Tum veriler silinecek (E/H): "
if /I not "%onay%"=="E" goto MENU
(
echo select disk %dno%
echo clean
echo create partition primary
echo format fs=%fss% quick
echo assign
)>%temp%\ds.txt
diskpart /s %temp%\ds.txt
del %temp%\ds.txt
pause
goto MENU

:PC_INFO
cls
hostname
wmic computersystem get manufacturer,model
pause
goto MENU

:IP_INFO
cls
ipconfig | findstr /i "IPv4"
pause
goto MENU

:CPU_INFO
cls
wmic cpu get name
pause
goto MENU

:RAM_INFO
cls
wmic memorychip get capacity,speed
pause
goto MENU

:SYS_INFO
cls
systeminfo
pause
goto MENU

:SFC_SCAN
cls
sfc /scannow
pause
goto MENU

:CHKDSK_SCAN
cls
set /p drv="Surucu harfi: "
chkdsk %drv%: /f /r
pause
goto MENU

:CLEANMGR_RUN
cleanmgr
pause
goto MENU

:GPUPDATE_RUN
gpupdate /force
pause
goto MENU

:WIN_UPDATE
wmic qfe list brief /format:table
pause
goto MENU

:DNS_CLEAR
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

:WIFI_PASS
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
