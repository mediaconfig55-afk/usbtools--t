@echo off
setlocal enabledelayedexpansion
:: Çalışma dizinini sabitle (EXE dönüşüm hatasını önler)
cd /d "%~dp0"

:: Yönetici izni kontrolü
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [HATA] Lutfen bu dosyayi SAG TIKLAYIP "Yonetici Olarak Calistir" deyin.
    pause
    exit
)

:: Renk ve Pencere Ayarları
color 0B
title Professional IT Support & USB Suite V7.9 - Code Emre Bilgin
mode con: cols=110 lines=50


set "VERSION=7.9"

:MENU
cls
echo.
echo  ##########################################################################################
echo  #                 USB YONETIM VE SISTEM BAKIM KONSOLU (V7.9 ULTIMATE)                    #
echo  #                            ==== CODE EMRE BILGIN ====                                  #
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
echo  [36] Windows Update Servislerini SIFIRLA  [35] CIKIS.
echo  [37] Tum Suruculeri (Drivers) YEDEKLE     ----------------------------------------------
echo  [38] Guc Plani: NIHAI PERFORMANS          [41] Gorev Cubugu ve Explorer ONAR
echo  [39] Hosts Dosyasini SIFIRLA              [42] Detayli BIOS / Anakart Bilgisi
echo  [40] Yazici Kuyrugunu (Spooler) TEMIZLE   [43] Pil Saglik Raporu (Laptop)
echo.                                           [44] Windows Telemetriyi KAPAT
echo  ##########################################################################################
set /p choice="Islem seciniz [1-44]: "

:: Yonlendirmeler
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
if "%choice%"=="12" goto USERS
if "%choice%"=="13" goto STORAGE
if "%choice%"=="14" goto LAST_FORMAT_DATE
if "%choice%"=="15" goto WINVER
if "%choice%"=="16" goto SFC
if "%choice%"=="17" goto CHKDSK
if "%choice%"=="18" goto CLEANUP
if "%choice%"=="19" goto GPUPDATE
if "%choice%"=="20" goto WINDOWSUPDATE
if "%choice%"=="21" goto UPDATE_PROGRAMS
if "%choice%"=="22" goto UPDATE_STORE_APPS
if "%choice%"=="23" goto CLEAN_TEMP_FILES
if "%choice%"=="24" goto OPTIMIZE_RAM
if "%choice%"=="25" goto FIREWALL_MENU
if "%choice%"=="26" goto CLEAR_DNS
if "%choice%"=="27" goto IP_MENU
if "%choice%"=="28" goto PING_TEST
if "%choice%"=="29" goto TRACERT_TEST
if "%choice%"=="30" goto NETSTAT_TEST
if "%choice%"=="31" goto ARP_TEST
if "%choice%"=="32" goto ROUTE_TEST
if "%choice%"=="33" goto NBTSTAT_TEST
if "%choice%"=="34" goto WIFI_PASSWORD
if "%choice%"=="35" exit

:: Yeni Eklenen Fonksiyonlar
if "%choice%"=="36" goto RESET_UPDATE
if "%choice%"=="37" goto BACKUP_DRIVERS
if "%choice%"=="38" goto ULTRA_PERFORMANCE
if "%choice%"=="39" goto RESET_HOSTS
if "%choice%"=="40" goto CLEAR_SPOOLER
if "%choice%"=="41" goto RESTART_EXPLORER
if "%choice%"=="42" goto BIOS_INFO
if "%choice%"=="43" goto BATTERY_REPORT
if "%choice%"=="44" goto DISABLE_TELEMETRY
goto MENU

:: --- FONKSIYONLAR ---

:LIST
cls
echo list disk > ds.txt
diskpart /s ds.txt & del ds.txt
pause
goto MENU

:FORMAT_SELECTION
cls
echo list disk > ds.txt
diskpart /s ds.txt & del ds.txt
set /p diskID="Formatlanacak Disk No: "
echo [1] NTFS [2] FAT32 [3] exFAT
set /p fs_choice="Secim: "
if "%fs_choice%"=="1" set "fs_type=ntfs"
if "%fs_choice%"=="2" set "fs_type=fat32"
if "%fs_choice%"=="3" set "fs_type=exfat"
set /p confirm="Disk %diskID% silinecek. Onay (E/H)? "
if /i "%confirm%" NEQ "E" goto MENU
(echo select disk %diskID% & echo clean & echo create partition primary & echo format fs=%fs_type% quick & echo assign) > ds.txt
diskpart /s ds.txt & del ds.txt
echo [TAMAM] Islem bitti.
pause
goto MENU

:PROTECT
cls
set /p diskID="Disk No: "
(echo select disk %diskID% & echo attributes disk set readonly) > ds.txt
diskpart /s ds.txt & del ds.txt
echo [BILGI] Koruma Aktif.
pause
goto MENU

:UNPROTECT
cls
set /p diskID="Disk No: "
(echo select disk %diskID% & echo attributes disk clear readonly) > ds.txt
diskpart /s ds.txt & del ds.txt
echo [BILGI] Koruma Kaldirildi.
pause
goto MENU

:RESET_UPDATE
cls
echo Windows Update servisleri sifirlaniyor...
net stop wuauserv & net stop cryptSvc & net stop bits & net stop msiserver
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
ren C:\Windows\System32\catroot2 catroot2.old
net start wuauserv & net start cryptSvc & net start bits & net start msiserver
echo [TAMAM] Update onarildi.
pause
goto MENU

:BACKUP_DRIVERS
cls
echo Suruculer masaustune yedekleniyor...
mkdir "%USERPROFILE%\Desktop\Driver_Yedek"
dism /online /export-driver /destination:"%USERPROFILE%\Desktop\Driver_Yedek"
echo [TAMAM] Yedekleme bitti.
pause
goto MENU

:ULTRA_PERFORMANCE
cls
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo [BILGI] Nihai Performans modu aktif edildi. Guc ayarlarindan secin.
pause
goto MENU

:RESET_HOSTS
cls
echo Hosts dosyasi orijinal haline donduruluyor...
set "hosts=%windir%\system32\drivers\etc\hosts"
attrib -r -s -h %hosts%
echo 127.0.0.1 localhost > %hosts%
echo ::1 localhost >> %hosts%
echo [TAMAM] Hosts sifirlandi.
pause
goto MENU

:CLEAR_SPOOLER
cls
net stop spooler
del /Q /F /S "%systemroot%\System32\Spool\Printers\*.*"
net start spooler
echo [TAMAM] Yazici kuyrugu temizlendi.
pause
goto MENU

:RESTART_EXPLORER
taskkill /f /im explorer.exe & start explorer.exe
goto MENU

:BIOS_INFO
cls
wmic baseboard get product,Manufacturer,version,serialnumber
pause
goto MENU

:BATTERY_REPORT
cls
powercfg /batteryreport /output "%USERPROFILE%\Desktop\Pil_Raporu.html"
echo [TAMAM] Rapor masaustune kaydedildi.
start "" "%USERPROFILE%\Desktop\Pil_Raporu.html"
pause
goto MENU

:DISABLE_TELEMETRY
cls
echo Telemetri ve Veri Toplama kapatiliyor...
sc delete DiagTrack
sc delete dmwappushservice
echo "" > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
echo [TAMAM] Islem bitti.
pause
goto MENU

:: Diger v6 fonksiyonlari (SFC, CHKDSK, IP vb.) buraya ayni sekilde eklenmistir.
:COMPUTER_INFO
cls
wmic bios get serialnumber & hostname & wmic computersystem get manufacturer, model
pause
goto MENU

:IP
cls
ipconfig | findstr /i "IPv4"
pause
goto MENU

:LICENSE
cls
slmgr /xpr & wmic path softwarelicensingservice get OA3xOriginalProductKey
pause
goto MENU

:SYSINFO
cls
systeminfo
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
chkdsk %drv%: /f /r /x
pause
goto MENU

:CLEAN_TEMP_FILES
cls
del /q /f /s %TEMP%\* & del /q /f /s %WINDIR%\Temp\*
pause
goto MENU

:WIFI_PASSWORD
cls
set /p wifi="Ag Adi: "
netsh wlan show profile name="%wifi%" key=clear | findstr /i "Key Content"
pause
goto MENU

:CLEAR_DNS
ipconfig /flushdns
pause
goto MENU

:UPDATE_PROGRAMS
winget upgrade --all
pause
goto MENU

:UPDATE_STORE_APPS
powershell -Command "Get-AppxPackage | Foreach {Add-AppxPackage -Path $_.InstallLocation} "
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

:IP_MENU
cls
echo [1] All [2] Renew [3] Release
set /p ipc="Secim: "
if "%ipc%"=="1" ipconfig /all
if "%ipc%"=="2" ipconfig /renew
if "%ipc%"=="3" ipconfig /release
pause
goto MENU

:FIREWALL_MENU
cls
echo [1] AC [2] KAPAT
set /p fw="Secim: "
if "%fw%"=="1" netsh advfirewall set allprofiles state on
if "%fw%"=="2" netsh advfirewall set allprofiles state off
pause
goto MENU

:DETAIL
cls
set /p diskID="Disk No: "
(echo select disk %diskID% & echo detail disk) > ds.txt
diskpart /s ds.txt & del ds.txt
pause
goto MENU

:CPUINFO
cls
wmic cpu get caption, name
pause
goto MENU

:MEMORY
cls
wmic memorychip get capacity, speed
pause
goto MENU

:USERS
cls
net user
pause
goto MENU

:STORAGE
cls
wmic logicaldisk get caption, freespace, size
pause
goto MENU

:WINVER
start winver
goto MENU

:LAST_FORMAT_DATE
cls
wmic os get installdate
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

:ARP_TEST
arp -a
pause
goto MENU

:ROUTE_TEST
route print
pause
goto MENU

:NBTSTAT_TEST
nbtstat -n
pause
goto MENU
