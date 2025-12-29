@echo off
setlocal enabledelayedexpansion
:: Kodlama sayfasini Turkce karakterler icin ayarla (Cogu sistemde 857 veya 65001 gerekir)
chcp 65001 >nul

:: --- SISTEM VE YONETICI KONTROLU ---
cd /d "%~dp0"
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 4F
    echo.
    echo [HATA] YONETICI IZNI GEREKLI!
    echo Lutfen bu dosyaya SAG TIKLAYIP "Yonetici Olarak Calistir" secenegini secin.
    echo.
    pause
    exit
)

:: --- ARAYUZ AYARLARI ---
color 0B
title Professional IT Support & USB Suite v8.5 [STABLE] - Code Emre Bilgin
mode con: cols=125 lines=62

:MENU
cls
echo.
echo  =========================================================================================================================
echo  =                                  USB YONETIM, SISTEM BAKIM VE ONARIM KONSOLU (V8.5)                                   =
echo  -----------------------------------                                                --------------------------------------
echo  =                                         •••• CODE EMRE BILGIN - FINAL ••••                                            =
echo  -----------------------------------------                                    --------------------------------------------
echo  =                                           •••• CMD CONTROLLER 2026 © ••••                                             =
echo  =========================================================================================================================
echo.
echo.
echo.
echo  •••• USB VE DISK ISLEMLERI ••••             •••• SISTEM ONARIM (DISM/SFC) ••••          •••• AG VE INTERNET ••••
echo  [1]  Diskleri Listele                     [26] SFC (Sistem Dosya Taramasi)          [51] DNS Onbellegini Temizle
echo  [2]  Akilli Format (NTFS/FAT32/exFAT)     [27] CHKDSK (Disk Hata Denetimi)          [52] IP Yenile (Renew/Release)
echo  [3]  Yazma Korumasini ETKINLESTIR         [28] DISM CheckHealth (Hizli)             [53] Ping Testi (Google DNS)
echo  [4]  Yazma Korumasini KALDIR              [29] DISM ScanHealth (Detayli)            [54] Tracert (Site Takibi)
echo  [5]  Disk Detaylarini Gor                 [30] DISM RestoreHealth (Onarim)          [55] Netstat (Aktif Baglantilar)
echo  [6]  FAT32'yi NTFS'ye Cevir (Verisiz)     [31] Windows Update Onar (Reset)          [56] Kayitli Wi-Fi Sifreleri
echo  [7]  Surucu Harfi Degistir                [32] Suruculeri (Drivers) Yedekle         [57] TCP/IP ve Winsock SIFIRLA
echo  [8]  Disk Yonetimini Ac                   [33] Yazici Kuyrugunu (Spooler) Sil       [58] MAC Adresini Goster
echo  [9]  USB Baglanti Gecmisini Temizle       [34] Icon Bellegini (Cache) Sifirla       [59] ARP Tablosunu Listele
echo                                            [35] Explorer.exe Yeniden Baslat          [60] Internet Baglanti Kontrolu
echo  •••• DONANIM VE SISTEM BILGISI ••••
echo  [10] Seri No, Marka ve Model              •••• PERFORMANS VE TEMIZLIK ••••            •••• HIZLI ERISIM ARACLARI ••••
echo  [11] IP Adresini Goruntule                [36] Temp/Gecici Dosyalari Sil            [61] Aygit Yoneticisi
echo  [12] Windows Lisans Durumu                [37] RAM Optimizasyonu Yap                [62] Denetim Masasi
echo  [13] Detayli Sistem Bilgisi               [38] Disk Temizleme (Cleanmgr)            [63] Gorev Yoneticisi
echo  [14] CPU (Islemci) Bilgisi                [39] Windows.old Klasorunu Sil            [64] Hizmetler (Services)
echo  [15] RAM (Bellek) Detaylari               [40] Pano (Clipboard) Temizle             [65] Kayit Defteri (Regedit)
echo  [16] Anakart ve BIOS Bilgisi              [41] Olay Gunluklerini (Logs) Sil         [66] Sistem Yapilandirma (Msconfig)
echo  [17] Ekran Karti (GPU) Bilgisi            [42] Windows Magaza Uyg. Guncelle         [67] DirectX Tanilama (DxDiag)
echo  [18] Ses Suruculeri Bilgisi               [43] Tum Programlari Guncelle (Winget)    [68] Ekran Klavyesi (OSK)
echo  [19] Pil Saglik Raporu (Laptop)           [44] Hosts Dosyasini Sifirla
echo  [20] Son Format Tarihi                    [45] Telemetriyi Kapat                    •••• GUVENLIK VE GUC ••••
echo  [21] Baslangic Uygulamalari               [46] Nihai Performans Modu                [69] Administrator Hesabini AC
echo  [22] Kullanici Hesaplari                  [47] Hazirda Bekletmeyi (Hibernate) KAPAT [70] Administrator Hesabini KAPAT
echo  [23] Depolama Alanlari                    [48] Dosya Uzantilarini Goster/Gizle      [71] Guvenlik Duvarini AC/KAPAT
echo  [24] Windows Surum (Winver)               [49] Gizli Dosyalari Goster/Gizle         [72] Bilgisayari Kilitle
echo  [25] Monitor Yenileme Hizi                [50] Grup Politikalarini Guncelle         [73] Otomatik Kapat (1 Saat Sonra)
echo                                                                                      [74] Kapatma Iptal
echo  ################################################################################    [75] CIKIS
echo.

set /p choice="Lütfen Islem numarasini giriniz [1-75]: "

:: --- YONLENDIRME BLOGU ---
if "%choice%"=="1" goto LIST_DISK
if "%choice%"=="2" goto SMART_FORMAT
if "%choice%"=="3" goto PROTECT_DISK
if "%choice%"=="4" goto UNPROTECT_DISK
if "%choice%"=="5" goto DETAIL_DISK
if "%choice%"=="6" goto CONVERT_NTFS
if "%choice%"=="7" goto CHANGE_LETTER
if "%choice%"=="8" goto OPEN_DISKMGMT
if "%choice%"=="9" goto CLEAN_USB_REG
if "%choice%"=="10" goto INFO_BASIC
if "%choice%"=="11" goto INFO_IP
if "%choice%"=="12" goto INFO_LICENSE
if "%choice%"=="13" goto INFO_FULL
if "%choice%"=="14" goto INFO_CPU
if "%choice%"=="15" goto INFO_RAM
if "%choice%"=="16" goto INFO_BIOS
if "%choice%"=="17" goto INFO_GPU
if "%choice%"=="18" goto INFO_AUDIO
if "%choice%"=="19" goto REPORT_BATTERY
if "%choice%"=="20" goto INFO_FORMATDATE
if "%choice%"=="21" goto INFO_STARTUP
if "%choice%"=="22" goto INFO_USERS
if "%choice%"=="23" goto INFO_STORAGE
if "%choice%"=="24" goto WINVER
if "%choice%"=="25" goto INFO_REFRESHRATE
if "%choice%"=="26" goto REPAIR_SFC
if "%choice%"=="27" goto REPAIR_CHKDSK
if "%choice%"=="28" goto DISM_CHECK
if "%choice%"=="29" goto DISM_SCAN
if "%choice%"=="30" goto DISM_RESTORE
if "%choice%"=="31" goto RESET_UPDATE
if "%choice%"=="32" goto BACKUP_DRIVERS
if "%choice%"=="33" goto CLEAR_SPOOLER
if "%choice%"=="34" goto RESET_ICON_CACHE
if "%choice%"=="35" goto RESTART_EXPLORER
if "%choice%"=="36" goto CLEAN_TEMP
if "%choice%"=="37" goto OPTIMIZE_RAM
if "%choice%"=="38" goto DISK_CLEANUP_TOOL
if "%choice%"=="39" goto DEL_WIN_OLD
if "%choice%"=="40" goto CLEAR_CLIPBOARD
if "%choice%"=="41" goto CLEAR_EVENTLOGS
if "%choice%"=="42" goto UPDATE_STORE
if "%choice%"=="43" goto UPDATE_WINGET
if "%choice%"=="44" goto RESET_HOSTS
if "%choice%"=="45" goto DISABLE_TELEMETRY
if "%choice%"=="46" goto ULTRA_PERFORMANCE
if "%choice%"=="47" goto DISABLE_HIBERNATE
if "%choice%"=="48" goto TOGGLE_EXT
if "%choice%"=="49" goto TOGGLE_HIDDEN
if "%choice%"=="50" goto GPUPDATE
if "%choice%"=="51" goto NET_FLUSHDNS
if "%choice%"=="52" goto NET_IP_RENEW
if "%choice%"=="53" goto NET_PING
if "%choice%"=="54" goto NET_TRACERT
if "%choice%"=="55" goto NET_NETSTAT
if "%choice%"=="56" goto NET_WIFI_PASS
if "%choice%"=="57" goto NET_RESET_STACK
if "%choice%"=="58" goto NET_MAC
if "%choice%"=="59" goto NET_ARP
if "%choice%"=="60" goto NET_CHECK_CONN
if "%choice%"=="61" goto TOOL_DEV
if "%choice%"=="62" goto TOOL_CONTROL
if "%choice%"=="63" goto TOOL_TASK
if "%choice%"=="64" goto TOOL_SERVICE
if "%choice%"=="65" goto TOOL_REG
if "%choice%"=="66" goto TOOL_MSCONFIG
if "%choice%"=="67" goto TOOL_DXDIAG
if "%choice%"=="68" goto TOOL_OSK
if "%choice%"=="69" goto SEC_ADMIN_ON
if "%choice%"=="70" goto SEC_ADMIN_OFF
if "%choice%"=="71" goto SEC_FIREWALL
if "%choice%"=="72" goto SEC_LOCK
if "%choice%"=="73" goto POWER_SHUTDOWN_TIMER
if "%choice%"=="74" goto POWER_ABORT
if "%choice%"=="75" exit

:: Yanlis giris olursa menuye don
goto MENU

:: ----------------------- FONKSIYONLAR -----------------------

:LIST_DISK
cls
echo list disk > ds.txt
diskpart /s ds.txt
del ds.txt
pause
goto MENU

:SMART_FORMAT
cls
echo list disk > ds.txt
diskpart /s ds.txt
del ds.txt
echo.
echo [DIKKAT] Formatlama islemi verileri geri getirilemez sekilde siler!
set /p diskID="Formatlanacak Disk Numarasi (Ornek: 1): "
echo [1] NTFS (Windows) [2] FAT32 (USB/TV) [3] exFAT (Mac/Win)
set /p fs_choice="Dosya Sistemi Secin: "
if "%fs_choice%"=="1" set "fs_type=ntfs"
if "%fs_choice%"=="2" set "fs_type=fat32"
if "%fs_choice%"=="3" set "fs_type=exfat"
set /p confirm="Disk %diskID% silinecek. Emin misiniz? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" goto MENU
(echo select disk %diskID% & echo clean & echo create partition primary & echo format fs=%fs_type% quick & echo assign) > ds.txt
diskpart /s ds.txt
del ds.txt
echo [TAMAM] Formatlama ve harf atama tamamlandi.
pause
goto MENU

:PROTECT_DISK
cls
set /p diskID="Disk No giriniz: "
(echo select disk %diskID% & echo attributes disk set readonly) > ds.txt
diskpart /s ds.txt
del ds.txt
echo [BILGI] Disk artik Salt Okunur (Yazma Korumali).
pause
goto MENU

:UNPROTECT_DISK
cls
set /p diskID="Disk No giriniz: "
(echo select disk %diskID% & echo attributes disk clear readonly) > ds.txt
diskpart /s ds.txt
del ds.txt
echo [BILGI] Yazma korumasi kaldirildi.
pause
goto MENU

:DETAIL_DISK
cls
set /p diskID="Disk No giriniz: "
(echo select disk %diskID% & echo detail disk) > ds.txt
diskpart /s ds.txt
del ds.txt
pause
goto MENU

:CONVERT_NTFS
cls
echo [DIKKAT] Bu islem verileri silmez ama islem sirasinda elektrik kesilmemeli.
set /p vol="Surucu Harfi Girin (Ornek: E): "
echo %vol% surucusu donusturuluyor...
convert %vol%: /fs:ntfs
pause
goto MENU

:CHANGE_LETTER
cls
echo Disk Yonetimi aciliyor...
start diskmgmt.msc
pause
goto MENU

:OPEN_DISKMGMT
start diskmgmt.msc
goto MENU

:CLEAN_USB_REG
cls
echo [BILGI] USB Kayit defteri temizligi icin 'USBDeview' aracini indirip
echo yonetici olarak calistirmaniz ve eski kayitlari silmeniz onerilir.
echo Bu islem manuel yapilmalidir.
pause
goto MENU

:: --- SISTEM BILGILERI ---
:INFO_BASIC
cls
echo SERI NO:
wmic bios get serialnumber
echo PC ADI:
hostname
echo MARKA/MODEL:
wmic computersystem get manufacturer, model
pause
goto MENU

:INFO_IP
cls
ipconfig | findstr /i "IPv4"
pause
goto MENU

:INFO_LICENSE
cls
echo Lisans Suresi:
slmgr /xpr
echo.
echo Gomulu Lisans Anahtari (BIOS):
wmic path softwarelicensingservice get OA3xOriginalProductKey
pause
goto MENU

:INFO_FULL
cls
systeminfo
pause
goto MENU

:INFO_CPU
cls
wmic cpu get name, maxclockspeed, numberofcores, caption
pause
goto MENU

:INFO_RAM
cls
wmic memorychip get capacity, speed, manufacturer, partnumber
pause
goto MENU

:INFO_BIOS
cls
echo BIOS Bilgisi:
wmic bios get name, version, releaseDate
echo Anakart Bilgisi:
wmic baseboard get product, manufacturer, version
pause
goto MENU

:INFO_GPU
cls
wmic path win32_VideoController get name, adapterram, driverversion
pause
goto MENU

:INFO_AUDIO
cls
wmic sounddev get caption, status
pause
goto MENU

:REPORT_BATTERY
cls
echo Pil raporu hazirlaniyor...
powercfg /batteryreport /output "%USERPROFILE%\Desktop\Pil_Raporu.html"
echo Rapor Masaustune 'Pil_Raporu.html' olarak kaydedildi.
pause
goto MENU

:INFO_FORMATDATE
cls
echo Isletim Sistemi Kurulum Tarihi:
wmic os get installdate
pause
goto MENU

:INFO_STARTUP
cls
wmic startup get caption, command
pause
goto MENU

:INFO_USERS
cls
net user
pause
goto MENU

:INFO_STORAGE
cls
wmic logicaldisk get caption, freespace, size
pause
goto MENU

:WINVER
start winver
goto MENU

:INFO_REFRESHRATE
cls
wmic path Win32_VideoController get Name, CurrentRefreshRate, VideoModeDescription
pause
goto MENU

:: --- ONARIM ---
:REPAIR_SFC
cls
echo Sistem dosyalari taraniyor...
sfc /scannow
pause
goto MENU

:REPAIR_CHKDSK
cls
set /p drv="Hata denetimi yapilacak Surucu Harfi (C/D/E): "
echo [UYARI] C surucusu secilirse yeniden baslatma isteyebilir.
chkdsk %drv%: /f /r /x
pause
goto MENU

:DISM_CHECK
cls
dism /online /cleanup-image /checkhealth
pause
goto MENU

:DISM_SCAN
cls
dism /online /cleanup-image /scanhealth
pause
goto MENU

:DISM_RESTORE
cls
echo Bu islem internet baglantisi gerektirir ve zaman alabilir...
dism /online /cleanup-image /restorehealth
pause
goto MENU

:RESET_UPDATE
cls
echo Servisler durduruluyor...
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
echo Klasorler yenileniyor...
ren %systemroot%\SoftwareDistribution SoftwareDistribution.old
ren %systemroot%\System32\catroot2 catroot2.old
echo Servisler baslatiliyor...
net start wuauserv
net start cryptSvc
net start bits
net start msiserver
echo Windows Update veritabani sifirlandi.
pause
goto MENU

:BACKUP_DRIVERS
cls
if not exist "%USERPROFILE%\Desktop\Driver_Yedek" mkdir "%USERPROFILE%\Desktop\Driver_Yedek"
echo Suruculer masaustune yedekleniyor, bekleyin...
dism /online /export-driver /destination:"%USERPROFILE%\Desktop\Driver_Yedek"
echo Islem tamamlandi.
pause
goto MENU

:CLEAR_SPOOLER
net stop spooler
del /Q /F /S "%systemroot%\System32\Spool\Printers\*.*"
net start spooler
echo Yazici kuyrugu temizlendi.
pause
goto MENU

:RESET_ICON_CACHE
cls
echo Explorer kapatiiliyor...
taskkill /f /im explorer.exe
echo Onbellek siliniyor...
del /f /q "%localappdata%\IconCache.db"
echo Explorer baslatiliyor...
start explorer.exe
echo Islem tamam.
pause
goto MENU

:RESTART_EXPLORER
taskkill /f /im explorer.exe & start explorer.exe
goto MENU

:: --- PERFORMANS ---
:CLEAN_TEMP
cls
echo Temp klasorleri temizleniyor...
del /q /f /s %TEMP%\*
del /q /f /s %WINDIR%\Temp\*
echo Bazi dosyalar kullanimda oldugu icin silinemeyebilir, bu normaldir.
pause
goto MENU

:OPTIMIZE_RAM
cls
echo RAM bosaltma tetikleniyor...
echo FreeMem = Space(80000000) > "%TEMP%\CleanMem.vbs"
cscript //nologo "%TEMP%\CleanMem.vbs"
del "%TEMP%\CleanMem.vbs"
echo RAM onbellegi temizlendi.
pause
goto MENU

:DISK_CLEANUP_TOOL
cleanmgr
goto MENU

:DEL_WIN_OLD
cls
if exist C:\Windows.old (
    echo Windows.old klasoru siliniyor, bu islem uzun surebilir...
    rd /s /q C:\Windows.old
    echo Silindi.
) else (
    echo [BILGI] Windows.old klasoru zaten yok.
)
pause
goto MENU

:CLEAR_CLIPBOARD
echo off | clip
echo Kopyala/Yapistir panosu temizlendi.
pause
goto MENU

:CLEAR_EVENTLOGS
cls
echo Olay gunlukleri temizleniyor...
for /F "tokens=*" %%1 in ('wevtutil.exe el') DO wevtutil.exe cl "%%1"
echo Tum loglar silindi.
pause
goto MENU

:UPDATE_STORE
cls
echo Windows Store uygulamalari guncelleniyor (PowerShell)...
powershell -ExecutionPolicy Bypass -Command "Get-AppxPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register '$($_.InstallLocation)\AppXManifest.xml'}"
echo Islem tamam.
pause
goto MENU

:UPDATE_WINGET
cls
echo Guncellenebilir programlar kontrol ediliyor...
winget upgrade --all --include-unknown
pause
goto MENU

:RESET_HOSTS
cls
echo Hosts dosyasi yedeklenip sifirlaniyor...
attrib -r -s -h %windir%\system32\drivers\etc\hosts
ren %windir%\system32\drivers\etc\hosts hosts.bak
echo 127.0.0.1 localhost > %windir%\system32\drivers\etc\hosts
echo ::1 localhost >> %windir%\system32\drivers\etc\hosts
echo Islem tamam.
pause
goto MENU

:DISABLE_TELEMETRY
cls
echo Servisler siliniyor...
sc stop DiagTrack
sc stop dmwappushservice
sc delete DiagTrack
sc delete dmwappushservice
echo Kayit defteri ayarlaniyor...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
echo Telemetri devre disi birakildi.
pause
goto MENU

:ULTRA_PERFORMANCE
cls
echo Nihai Performans modu ekleniyor...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo Guc seceneklerinden 'Nihai Performans'i secin.
start powercfg.cpl
pause
goto MENU

:DISABLE_HIBERNATE
powercfg -h off
echo Hazirda beklet (Hibernate) kapatildi ve diskte yer acildi.
pause
goto MENU

:TOGGLE_EXT
cls
echo Dosya uzantilari gorunurlugu degistiriliyor...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
taskkill /f /im explorer.exe & start explorer.exe
echo Uzantilar artik gorunur (orn: dosya.txt).
pause
goto MENU

:TOGGLE_HIDDEN
cls
echo Gizli dosyalar gorunur yapiliyor...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
taskkill /f /im explorer.exe & start explorer.exe
pause
goto MENU

:GPUPDATE
cls
echo Grup politikalari guncelleniyor...
gpupdate /force
pause
goto MENU

:: --- AG ---
:NET_FLUSHDNS
ipconfig /flushdns
pause
goto MENU

:NET_IP_RENEW
ipconfig /release
ipconfig /renew
pause
goto MENU

:NET_PING
cls
echo Google DNS (8.8.8.8) sunucusuna ping atiliyor...
ping 8.8.8.8
pause
goto MENU

:NET_TRACERT
cls
set /p target="Hedef Adres (orn: google.com): "
tracert %target%
pause
goto MENU

:NET_NETSTAT
cls
echo Aktif baglantilar listeleniyor...
netstat -an | find "ESTABLISHED"
if %errorlevel% neq 0 echo [BILGI] Su an aktif kurulu baglanti bulunamadi veya listelenemedi.
pause
goto MENU

:NET_WIFI_PASS
cls
echo --- KAYITLI WI-FI AGLARI ---
netsh wlan show profiles
echo.
set /p wifiname="Sifresini gormek istediginiz Ag Adi (Yukaridan bakin): "
echo.
netsh wlan show profile name="%wifiname%" key=clear | findstr /i "Key Content"
echo (Key Content veya Anahtar Icerigi kisminda sifre yazar)
pause
goto MENU

:NET_RESET_STACK
cls
echo Ag ayarlari sifirlaniyor...
netsh int ip reset
netsh winsock reset
echo [ONEMLI] Degisikliklerin etkili olmasi icin BILGISAYARI YENIDEN BASLATIN.
pause
goto MENU

:NET_MAC
getmac /v
pause
goto MENU

:NET_ARP
arp -a
pause
goto MENU

:NET_CHECK_CONN
cls
echo Baglanti kontrol ediliyor...
ping -n 1 www.google.com >nul
if %errorlevel% == 0 ( 
    color 2F
    echo [BASARILI] Internet BAGLANTISI VAR.
) else ( 
    color 4F
    echo [HATA] Internet BAGLANTISI YOK.
)
pause
color 0B
goto MENU

:: --- ARACLAR ---
:TOOL_DEV
start devmgmt.msc
goto MENU
:TOOL_CONTROL
start control
goto MENU
:TOOL_TASK
start taskmgr
goto MENU
:TOOL_SERVICE
start services.msc
goto MENU
:TOOL_REG
start regedit
goto MENU
:TOOL_MSCONFIG
start msconfig
goto MENU
:TOOL_DXDIAG
start dxdiag
goto MENU
:TOOL_OSK
start osk
goto MENU

:: --- GUVENLIK VE GUC ---
:SEC_ADMIN_ON
net user administrator /active:yes
echo Gizli Administrator hesabi AKTIF edildi.
pause
goto MENU

:SEC_ADMIN_OFF
net user administrator /active:no
echo Gizli Administrator hesabi PASIF edildi.
pause
goto MENU

:SEC_FIREWALL
cls
echo [1] Guvenlik Duvarini AC
echo [2] Guvenlik Duvarini KAPAT
set /p fw="Secim: "
if "%fw%"=="1" netsh advfirewall set allprofiles state on
if "%fw%"=="2" netsh advfirewall set allprofiles state off
pause
goto MENU

:SEC_LOCK
rundll32.exe user32.dll,LockWorkStation
goto MENU

:POWER_SHUTDOWN_TIMER
cls
set /p time="Kac dakika sonra kapansin?: "
set /a sec=time*60
shutdown -s -t %sec%
echo Bilgisayar %time% dakika sonra kapanacak.
pause
goto MENU

:POWER_ABORT
shutdown -a
echo Kapatma zamanlayicisi iptal edildi.
pause
goto MENU
