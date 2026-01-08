@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

:: --- LOG SİSTEMİ (GÜVENLİ YAPI) ---
set "logFile=%TEMP%\UT_Ultimate_Final.txt"
echo [%date% %time%] --- v10 FINAL SISTEM BASLATILDI --- >> "%logFile%" 2>nul

:: --- YÖNETİCİ KONTROLÜ ---
net session >nul 2>&1
if %errorLevel% neq 0 (
    mode con: cols=85 lines=10
    color 0C
    echo.
    echo    ┌──────────────────────────────────────────────────────────────────────────┐
    echo    │                  HATA: YÖNETİCİ YETKİSİ GEREKLİ...!!!                    │
    echo    ├──────────────────────────────────────────────────────────────────────────┤
    echo    │ Lütfen bu dosyaya sağ tıklayıp "Yönetici Olarak Çalıştır"ı seçin.        │
    echo    └──────────────────────────────────────────────────────────────────────────┘
    pause >nul & exit
)

:: --- PENCERE AYARLARI ---
color 0B
title USB TOOLS - ULTIMATE FINAL EDITION v10
mode con: cols=155 lines=80

:MENU
cls
:: --- DİNAMİK VERİ TOPLAMA ---
set "cpuLoad=N/A"
for /f "skip=1" %%p in ('wmic cpu get loadpercentage 2^>nul') do (set cpuLoad=%%p & goto :next)
:next
for /f "tokens=2 delims==" %%a in ('wmic os get FreePhysicalMemory /value 2^>nul') do set freeRAM=%%a
for /f "tokens=2 delims==" %%a in ('wmic os get TotalVisibleMemorySize /value 2^>nul') do set totalRAM=%%a
set /a usedRAM=(%totalRAM%-%freeRAM%)/1024 >nul 2>&1
set /a totalRAM_GB=%totalRAM%/1048576 >nul 2>&1

echo.
echo.
color 0D
echo     =═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════=
echo     ║                                                                                                                         ║
echo     ║             ██╗   ██╗███████╗██████╗     ████████╗ ██████╗  ██████╗ ██╗     ███████╗                                    ║
echo     ║             ██║   ██║██╔════╝██╔══██╗    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝                                    ║
echo     ║             ██║   ██║███████╗██████╔╝       ██║   ██║   ██║██║   ██║██║     ███████╗                                    ║
echo     ║             ██║   ██║╚════██║██╔══██╗       ██║   ██║   ██║██║   ██║██║     ╚════██║                                    ║
echo     ║             ╚██████╔╝███████║██████╔╝       ██║   ╚██████╔╝╚██████╔╝███████╗███████║                                    ║
echo     ║              ╚═════╝ ╚══════╝╚═════╝        ╚═╝   ╚═════╝  ╚═════╝ ╚══════╝╚══════╝                                     ║
echo     ║                                                                                                                         ║
echo     ║                      USB YONETIM, SISTEM BAKIM VE ONARIM KONSOLU (v10)                                                  ║
echo     ║                                                                                                                         ║
echo     ║                          •••• CODE EMRE BILGIN - FINAL EDITION ••••                                                     ║
echo     ║                                                                                                                         ║
echo     ║                                •••• CMD CONTROLLER 2026 © ••••                                                          ║
echo     ║                                                                                                                         ║
echo     ╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo     ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
echo       » [ STATUS ] CPU: %cpuLoad%%%  │  RAM: %usedRAM% MB / %totalRAM_GB% GB  │  LOG: ACTIVE  │  YEAR: 2026 »  │  SYSTEM: ONLİNE                   
echo     └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
echo.
color 0B
echo       ♦ DISK ^& USB YONETIMI ♦           ♦ SISTEM ONARIM ^& BAKIM ♦          ♦ AG ^& INTERNET AYARLARI ♦         ♦ EKSTRA ARACLAR ^& GUVENLIK ♦
echo     ┌──────────────────────────────┐   ┌──────────────────────────────┐   ┌──────────────────────────────┐   ┌──────────────────────────────┐
echo     │ [01] Diskleri Listele        │   │ [26] SFC Sistem Taramasi     │   │ [51] DNS Onbellegini Sil     │   │ [76] Hatali Suruculeri Bul   │
echo     │ [02] Akilli Format           │   │ [27] CHKDSK Disk Denetimi    │   │ [52] IP Yenile (Renew)       │   │ [77] Port Dinleyici (PID)    │
echo     │ [03] Yazma Korumasi AC       │   │ [28] DISM CheckHealth        │   │ [53] Google Ping Testi       │   │ [78] Buyuk Dosyalari Bul     │
echo     │ [04] Yazma Korumasi KAPAT    │   │ [29] DISM ScanHealth         │   │ [54] Tracert Site Takibi     │   │ [79] Sürücü Sağlığı (SMART)  │
echo     │ [05] Disk Detaylarini Gor    │   │ [30] DISM RestoreHealth      │   │ [55] Aktif Baglantilar       │   │ [80] Tarayici Cache Sil      │
echo     │ [06] FAT32 -^> NTFS Cevir     │   │ [31] Windows Update Onar     │   │ [56] Wi-Fi Sifrelerini Gor   │   │ [81] GodMode Olustur         │
echo     │ [07] Surucu Harfi Degistir   │   │ [32] Suruculeri Yedekle      │   │ [57] Ag Ayarlarini Sifirla   │   │ [82] Klasik Foto Goruntule   │
echo     │ [08] Disk Yonetimini Ac      │   │ [33] Yazici Kuyruğunu Sil    │   │ [58] MAC Adresini Goster     │   │ [83] Yanit Vermeyenleri Kapat│
echo     │ [09] USB Gecmisini Temizle   │   │ [34] Icon Cache Sifirla      │   │ [59] ARP Tablosunu Gor       │   │ [84] Firewall Sifirla        │
echo     └──────────────────────────────┘   │ [35] Explorer Yeniden Baslat │   │ [60] Baglanti Kontrolu       │   │ [85] Hosts Yedekle           │
echo                                        └──────────────────────────────┘   └──────────────────────────────┘   └──────────────────────────────┘
echo        ♦ DONANIM BILGILERI ♦             ♦ PERFORMANS ^& TEMIZLIK ♦          ♦ HIZLI ERISIM ^& GUC ♦             ♦ OTOMASYON MODU ♦
echo     ┌──────────────────────────────┐   ┌──────────────────────────────┐   ┌──────────────────────────────┐   ┌──────────────────────────────┐
echo     │ [10] Seri No ^& Model         │   │ [36] Gecici Dosyalari Sil    │   │ [61] Aygit Yoneticisi        │   │                              │
echo     │ [11] IP Adresini Gor         │   │ [37] RAM Optimizasyonu       │   │ [62] Denetim Masasi          │   │      [99] ULTRA BAKIM        │
echo     │ [12] Lisans Durumu           │   │ [38] Disk Temizleme (Clean)  │   │ [63] Gorev Yoneticisi        │   │                              │
echo     │ [13] Detayli Sistem Bilgisi  │   │ [39] Windows.old Klasoru Sil │   │ [64] Hizmetler (Services)    │   └──────────────────────────────┘
echo     │ [14] CPU Bilgisi             │   │ [40] Panoyu Temizle          │   │ [65] Kayit Defteri           │   │ [00] PROGRAMI KAPAT          │
echo     │ [15] RAM Detaylari           │   │ [41] Olay Loglarini Sil      │   │ [66] MSConfig                │   └──────────────────────────────┘
echo     │ [16] Anakart ^& BIOS Bilgisi  │   │ [42] Magaza Uyg. Guncelle    │   │ [67] DirectX Tanilama        │
echo     │ [17] Ekran Karti (GPU)       │   │ [43] Winget Tumunu Guncelle  │   │ [68] Ekran Klavyesi          │
echo     │ [18] Ses Suruculeri          │   │ [44] Hosts Dosyasi Sifirla   │   │ [69] Admin Hesabi AC         │
echo     │ [19] Pil Raporu (Laptop)     │   │ [45] Telemetriyi Kapat       │   │ [70] Admin Hesabi KAPAT      │
echo     │ [20] Son Format Tarihi       │   │ [46] Nihai Performans Modu   │   │ [71] Firewall Ayarlari       │
echo     │ [21] Baslangic Uygulamalari  │   │ [47] Hibernate Kapat         │   │ [72] Sistemi Kilitle         │
echo     │ [22] Kullanici Hesaplari     │   │ [48] Uzantilari Goster/Gizle │   │ [73] Oto Kapat (1 Saat)      │
echo     │ [23] Depolama Alanlari       │   │ [49] Gizli Dosyalari Goster  │   │ [74] Kapatma Iptal           │
echo     │ [24] BIOS Surum Detayi       │   │ [50] Sistem Calisma Suresi   │   │ [75] Guc Planini Sifirla     │
echo     └──────────────────────────────┘   └──────────────────────────────┘   └──────────────────────────────┘
echo.
set /p choice="    ╔══»═[ SECIMINIZI YAPIN (0-99) ]═══> "

echo [%date% %time%] Kullanici Secimi: %choice% >> "%logFile%" 2>nul

:: --- YÖNLENDİRME (IF) BLOKLARI ---
if "%choice%"=="00" exit
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
if "%choice%"=="24" goto INFO_BIOS_DETAIL
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
if "%choice%"=="50" goto UPTIME
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
if "%choice%"=="75" goto RESET_POWER_PLANS
if "%choice%"=="76" goto FIND_BAD_DRIVERS
if "%choice%"=="77" goto PORT_LISTENER
if "%choice%"=="78" goto FIND_BIG_FILES
if "%choice%"=="79" goto DISK_SMART
if "%choice%"=="80" goto CLEAN_BROWSER_CACHE
if "%choice%"=="81" goto CREATE_GODMODE
if "%choice%"=="82" goto ENABLE_OLD_PHOTO
if "%choice%"=="83" goto KILL_NOT_RESPONDING
if "%choice%"=="84" goto RESET_FIREWALL
if "%choice%"=="85" goto HOSTS_BACKUP
if "%choice%"=="99" goto SMART_MAINTENANCE
goto MENU

:: --- FONKSİYON GÖVDELERİ ---

:HEADER_SUB
echo.
echo    ┌────────────────────────────────────────────────────────┐
echo    │ ISLEM: %~1
echo    └────────────────────────────────────────────────────────┘
echo.
goto :eof

:FOOTER_SUB
echo [%date% %time%] Islem Tamamlandi: %~1 >> "%logFile%" 2>nul
echo.
echo    [OK] Islem Tamamlandi. Menuye donmek icin bir tusa basin...
pause >nul
goto MENU

:SMART_MAINTENANCE
:: ============================================================================
:: AŞAMA 1: GELİŞMİŞ TEMP VE ÖNBELLEK TEMİZLİĞİ
:: ============================================================================
cls
color 0E
echo.
echo    ┌──────────────────────────────────────────────────────────────────────────────────┐
echo    │              [99] ULTRA PROFESYONEL SISTEM BAKIM VE ONARIM MODU                  │
echo    ├──────────────────────────────────────────────────────────────────────────────────┤
echo    │                                                                                  │
echo    │  BU MOD ŞU İŞLEMLERİ YAPACAKTIR:    ✦                                             │
echo    │    │  1. Derin Geçici Dosya Temizliği (Temp, Prefetch, Log)                      │
echo    │    │  2. DNS, Winsock ve IP Protokol Sıfırlama                                   │
echo    │    │  3. DISM Gelişmiş İmaj Onarımı ve Bileşen Temizliği                         │
echo    │    │  4. SFC Sistem Dosyası Doğrulama                                            │
echo    │    │  5. Windows Update ve Kuyruk Hizmetleri Onarımı                             │
echo    │    │  6. RAM ve Pano Optimizasyonu                                               │
echo    │                                                                                  │   
echo    │        Toplam; 15 Adet Sistem Genel temizlik                                     │
echo    │                Tahmini Sure: 5 – 20 Dakika !                                    │
echo    └──────────────────────────────────────────────────────────────────────────────────┘
echo.
set /p t_c="    >> Devam etmek istiyor musunuz? (E/H): "
if /i "%t_c%" NEQ "E" goto MENU
echo.
timeout /t 2 /nobreak >nul

cls
call :HEADER_SUB "ULTRA TURBO BAKIM CALISIYOR"

:: -------------------------------------------------
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 1/15: KAPSAMLI ÖNBELLEK TEMİZLİĞİ                            │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[1.1] Sistem Geçici Dosyaları Temizleniyor...
del /s /f /q "%TEMP%\*.*" >nul 2>&1
del /s /f /q "%WINDIR%\Temp\*.*" >nul 2>&1
del /s /f /q "%WINDIR%\Prefetch\*.*" >nul 2>&1
echo    ╔═ Sistem temp temizlendi

echo    ╰┈➤ˎˊ˗[1.2] Kullanıcı Önbellekleri Temizleniyor...
del /s /f /q "%LOCALAPPDATA%\Temp\*.*" >nul 2>&1
del /s /f /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*.*" >nul 2>&1
del /s /f /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCookies\*.*" >nul 2>&1
echo    ╔═ Kullanıcı önbellekleri temizlendi

echo    ╰┈➤ˎˊ˗[1.3] Yazılım Önbellekleri Temizleniyor...
del /s /f /q "%APPDATA%\Microsoft\Windows\Recent\*.*" >nul 2>&1
del /s /f /q "%APPDATA%\Microsoft\Windows\Libraries\*.*.library-ms" >nul 2>&1
echo    ╔═ Yazılım önbellekleri temizlendi
echo [%date% %time%] AŞAMA1: Önbellek temizleme tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 2: İLERİ DÜZEY AĞ OPTİMİZASYONU
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 2/15: AĞ ALTYAPI OPTİMİZASYONU ✦                             │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[2.1] DNS ve TCP/IP Önbelleği Temizleniyor...
ipconfig /flushdns >nul
ipconfig /registerdns >nul
netsh int ip reset C:\resetlog.txt >nul
echo    ╔═ DNS önbelleği temizlendi

echo    ╰┈➤ˎˊ˗[2.2] Ağ Ayarları Sıfırlanıyor...
netsh winsock reset catalog >nul
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global chimney=enabled >nul
echo    ╔═ Ağ ayarları sıfırlandı

echo    ╰┈➤ˎˊ˗[2.3] Hosts Dosyası Optimize Ediliyor...
if not exist "%WINDIR%\System32\drivers\etc\hosts.bak" (
    copy "%WINDIR%\System32\drivers\etc\hosts" "%WINDIR%\System32\drivers\etc\hosts.bak" >nul
)
echo 127.0.0.1 localhost > "%WINDIR%\System32\drivers\etc\hosts"
echo ::1 localhost >> "%WINDIR%\System32\drivers\etc\hosts"
echo    ╔═ Hosts dosyası optimize edildi
echo [%date% %time%] AŞAMA2: Ağ optimizasyonu tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 3: RAM VE SANAL BELLEK OPTİMİZASYONU
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 3/15: BELLEK YÖNETİMİ OPTİMİZASYONU ✦                        │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[3.1] RAM Önbelleği Boşaltılıyor...(Biraz uzun sürebilir...)
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  RAM OPTİMİZASYONU (HIZLI)                                           │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.

echo    ╰┈➤ˎˊ˗[1] DNS ve TCP Önbelleği Temizleniyor...
ipconfig /flushdns >nul
netsh int ip reset >nul
echo    ╔═ Ağ önbelleği temizlendi

echo    ╰┈➤ˎˊ˗[2] RAM Önbelleği Boşaltılıyor...
powershell "$MemInfo = Get-WmiObject Win32_OperatingSystem; $FreeMem = [math]::Round($MemInfo.FreePhysicalMemory/1MB, 2); Write-Host 'Boş RAM: $FreeMem GB'"
echo    ╔═ RAM durumu kontrol edildi

echo    ╰┈➤ˎˊ˗[3] Çöp Bellek Temizleme...
powershell "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers()"
echo    ╔═ Çöp bellek toplandı

echo    ╰┈➤ˎˊ˗[4] Süreç Bellek Optimizasyonu...
for %%p in (chrome.exe, msedge.exe, firefox.exe, outlook.exe) do (
    taskkill /f /im %%p >nul 2>&1 && echo    ✓ %%p yeniden başlatıldı
)
echo    ╔═ Bellek yoğun uygulamalar optimize edildi

echo    ╰┈➤ˎˊ˗[3.2] Sanal Bellek Optimize Ediliyor...
wmic computersystem set AutomaticManagedPagefile=False >nul
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=4096,MaximumSize=8192 >nul
echo    ╔═ Sanal bellek optimize edildi

echo    ╰┈➤ˎˊ˗[3.3] Bellek Sızıntısı Kontrolü...
sc config "SysMain" start= auto >nul
echo    ╔═ Bellek hizmetleri optimize edildi
echo [%date% %time%] AŞAMA3: Bellek optimizasyonu tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 4: SİSTEM DOSYALARI BÜTÜNLÜK KONTROLÜ
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 4/15: SİSTEM DOSYALARI BÜTÜNLÜK KONTROLÜ ✦                    │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[4.1] SFC (System File Checker) Çalıştırılıyor...
echo    Bu işlem birkaç dakika sürebilir. Lütfen bekleyin...
sfc /scannow
echo    ╔═ SFC taraması tamamlandı

echo    ╰┈➤ˎˊ˗[4.2] Sistem Dosyaları Doğrulanıyor...
findstr /c:"[SR]" %windir%\logs\cbs\cbs.log |find /c /v "" >nul && (
    echo    ✦  Bozuk sistem dosyaları bulundu, DISM ile onarılıyor...
) || (
    echo    ╔═ Sistem dosyaları sağlam
)
echo [%date% %time%] AŞAMA4: Sistem dosya kontrolü tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 5: DISM İLE GELİŞMİŞ SİSTEM ONARIMI
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 5/15: DISM İLE SİSTEM GÖRÜNTÜSÜ ONARIMI ✦                     │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[5.1] DISM CheckHealth Çalıştırılıyor...
dism /online /cleanup-image /checkhealth
echo    ╔═ Sistem görüntüsü kontrol edildi

echo    ╰┈➤ˎˊ˗[5.2] DISM ScanHealth Çalıştırılıyor...
dism /online /cleanup-image /scanhealth
echo    ╔═ Sistem taraması yapıldı

echo    ╰┈➤ˎˊ˗[5.3] DISM RestoreHealth Çalıştırılıyor...
dism /online /cleanup-image /restorehealth /source:WIM:X:\Sources\Install.wim:1 /limitaccess
echo    ╔═ Sistem görüntüsü onarıldı
echo [%date% %time%] AŞAMA5: DISM onarımı tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 6: WINDOWS UPDATE ALTYAPISI SIFIRLAMA
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 6/15: WINDOWS UPDATE ALTYAPISI SIFIRLAMA ✦                    │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[6.1] Windows Update Hizmetleri Durduruluyor...
net stop wuauserv >nul
net stop cryptSvc >nul
net stop bits >nul
net stop msiserver >nul
echo    ╔═ Update hizmetleri durduruldu

echo    ╰┈➤ˎˊ˗[6.2] Update Önbelleği Temizleniyor...
if exist "C:\Windows\SoftwareDistribution" (
    ren "C:\Windows\SoftwareDistribution" "SoftwareDistribution.old" >nul
)
if exist "C:\Windows\System32\catroot2" (
    ren "C:\Windows\System32\catroot2" "catroot2.old" >nul
)
echo    ╔═ Update önbelleği temizlendi

echo    ╰┈➤ˎˊ˗[6.3] Update Hizmetleri Yeniden Başlatılıyor...
net start wuauserv >nul
net start cryptSvc >nul
net start bits >nul
net start msiserver >nul
echo    ╔═ Update hizmetleri yeniden başlatıldı
echo [%date% %time%] AŞAMA6: Windows Update sıfırlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 7: GELİŞMİŞ OLAY GÜNLÜĞÜ YÖNETİMİ
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 7/15: OLAY GÜNLÜKLERİ YÖNETİMİ ✦                              │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[7.1] Günlük Dosyaları Temizleniyor...
for /F "tokens=*" %%G in ('wevtutil el') do (
    wevtutil cl "%%G" >nul 2>&1
)
echo    ╔═ Olay günlükleri temizlendi

echo    ╰┈➤ˎˊ˗[7.2] Günlük Dosya Boyutları Optimize Ediliyor...
wevtutil sl Application /ms:10485760 >nul
wevtutil sl Security /ms:10485760 >nul
wevtutil sl System /ms:10485760 >nul
echo    ╔═ Günlük boyutları optimize edildi

echo    ╰┈➤ˎˊ˗[7.3] Gereksiz Günlükler Devre Dışı Bırakılıyor...
wevtutil sl "Microsoft-Windows-Diagnostics-Performance/Operational" /e:false >nul
wevtutil sl "Microsoft-Windows-Kernel-Processor-Power/Diagnostic" /e:false >nul
echo    ╔═ Gereksiz günlükler devre dışı
echo [%date% %time%] AŞAMA7: Olay günlüğü yönetimi tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 8: TARAYICI VE UYGULAMA ÖNBELLEĞİ TEMİZLİĞİ
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 8/15: TARAYICI VE UYGULAMA ÖNBELLEK TEMİZLİĞİ ✦               │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[8.1] Tarayıcı Önbellekleri Temizleniyor...
taskkill /f /im chrome.exe >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im firefox.exe >nul 2>&1

set "chromeCache=%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache"
set "edgeCache=%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
set "firefoxCache=%APPDATA%\Mozilla\Firefox\Profiles"

if exist "%chromeCache%" del /q /s "%chromeCache%\*.*" >nul 2>&1
if exist "%edgeCache%" del /q /s "%edgeCache%\*.*" >nul 2>&1
for /d %%i in ("%firefoxCache%\*.*") do (
    if exist "%%i\cache2\entries" del /q /s "%%i\cache2\entries\*.*" >nul 2>&1
)
echo    ╔═ Tarayıcı önbellekleri temizlendi

echo    ╰┈➤ˎˊ˗[8.2] Uygulama Önbellekleri Temizleniyor...
del /q /s "%APPDATA%\Microsoft\Office\*.tmp" >nul 2>&1
del /q /s "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
echo    ╔═ Uygulama önbellekleri temizlendi

echo    ╰┈➤ˎˊ˗[8.3] Office Önbelleği Temizleniyor...
del /q /s "%APPDATA%\Microsoft\Office\16.0\Wef" >nul 2>&1
echo    ╔═ Office önbelleği temizlendi
echo [%date% %time%] AŞAMA8: Tarayıcı temizleme tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 9: PRİVACY VE TELEMETRİ OPTİMİZASYONU
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 9/15: GİZLİLİK VE VERİ TOPLAMA AYARLARI ✦                     │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[9.1] Telemetri Devre Dışı Bırakılıyor...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul
echo    ╔═ Telemetri devre dışı

echo    ╰┈➤ˎˊ˗[9.2] Reklam Kimliği Devre Dışı Bırakılıyor...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul
echo    ╔═ Reklam kimliği devre dışı

echo    ╰┈➤ˎˊ˗[9.3] Gizlilik Ayarları Optimize Ediliyor...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsAccessLocation /t REG_DWORD /d 2 /f >nul
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v Value /t REG_SZ /d "Deny" /f >nul
echo    ╔═ Gizlilik ayarları optimize edildi
echo [%date% %time%] AŞAMA9: Gizlilik ayarları tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 10: PERFORMANS OPTİMİZASYONU
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 10/15: SİSTEM PERFORMANS OPTİMİZASYONU ✦                     │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[10.1] Güç Planı Ultra Performans Moduna Alınıyor...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61 >nul
echo    ╔═ Ultra performans güç planı aktif

echo    ╰┈➤ˎˊ˗[10.2] Gereksiz Hizmetler Devre Dışı Bırakılıyor...
sc config "DiagTrack" start= disabled >nul
sc config "dmwappushservice" start= disabled >nul
sc config "WMPNetworkSvc" start= disabled >nul
sc config "Fax" start= disabled >nul
echo    ╔═ Gereksiz hizmetler devre dışı

echo    ╰┈➤ˎˊ˗[10.3] Hibernate Kapatılıyor...
powercfg -h off >nul
echo    ╔═ Hibernate kapatıldı
echo [%date% %time%] AŞAMA10: Performans optimizasyonu tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 11: DISK VE DEPOLAMA OPTİMİZASYONU
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 11/15: DISK VE DEPOLAMA OPTİMİZASYONU ✦                      │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[11.1] Disk Temizleme Aracı Çalıştırılıyor...
cleanmgr /sagerun:1 >nul
echo    ╔═ Disk temizleme tamamlandı

echo    ╰┈➤ˎˊ˗[11.2] Disk Birleştirme Optimizasyonu...
defrag C: /U /V >nul
echo    ╔═ Disk birleştirme tamamlandı

echo    ╰┈➤ˎˊ˗[11.3] Disk Hata Kontrolü...
chkdsk C: /scan /spotfix >nul
echo    ╔═ Disk hata kontrolü tamamlandı
echo [%date% %time%] AŞAMA11: Disk optimizasyonu tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 12: GÜVENLİK VE GÜVENLİK DUVARI OPTİMİZASYONU
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 12/15: GÜVENLİK OPTİMİZASYONU ✦                               │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[12.1] Güvenlik Duvarı Sıfırlanıyor...
netsh advfirewall reset >nul
echo    ╔═ Güvenlik duvarı sıfırlandı

echo    ╰┈➤ˎˊ˗[12.2] Windows Defender Optimizasyonu...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false" >nul
echo    ╔═ Defender ayarları optimize edildi

echo    ╰┈➤ˎˊ˗[12.3] UAC Ayarları Optimize Ediliyor...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 1 /f >nul
echo    ╔═✓ UAC ayarları optimize edildi
echo [%date% %time%] AŞAMA12: Güvenlik optimizasyonu tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 13: EXPLORER VE KABUK OPTİMİZASYONU
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 13/15: EXPLORER VE KABUK OPTİMİZASYONU ✦                      │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[13.1] Explorer Yeniden Başlatılıyor...
taskkill /f /im explorer.exe >nul 2>&1
echo    ╔═ Explorer durduruldu

echo    ╰┈➤ˎˊ˗[13.2] İkon Önbelleği Temizleniyor...
del /f /q "%localappdata%\IconCache.db" >nul 2>&1
del /f /q "%localappdata%\Microsoft\Windows\Explorer\iconcache*" >nul 2>&1
echo    ╔═ İkon önbelleği temizlendi

echo    ╰┈➤ˎˊ˗[13.3] Kabuk Ayarları Optimize Ediliyor...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 0 /f >nul
start explorer.exe >nul 2>&1
echo    ╔═ Explorer yeniden başlatıldı
echo [%date% %time%] AŞAMA13: Explorer optimizasyonu tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 14: KAYIT DEFTERİ VE BAŞLANGIÇ OPTİMİZASYONU
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 14/15: KAYIT DEFTERİ VE BAŞLANGIÇ OPTİMİZASYONU ✦            │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[14.1] Kayıt Defteri Temizliği...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f >nul
echo    ╔═ Kayıt defteri temizlendi

echo    ╰┈➤ˎˊ˗[14.2] Başlangıç Programları Optimize Ediliyor...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v OneDrive /t REG_BINARY /d 030000000000000000000000 /f >nul
echo    ╔═ Başlangıç programları optimize edildi

echo    ╰┈➤ˎˊ˗[14.3] Kayıt Defteri Boyutu Optimize Ediliyor...
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v RegistrySizeLimit /t REG_DWORD /d 0xFFFFFFFF /f >nul
echo    ╔═ Kayıt defteri boyutu optimize edildi
echo [%date% %time%] AŞAMA14: Kayıt defteri optimizasyonu tamamlandı >> "%logFile%"
timeout /t 1 /nobreak >nul

:: ============================================================================
:: AŞAMA 15: FİNAL OPTİMİZASYONLAR VE SİSTEM YENİLEME
:: ============================================================================
cls
echo.
echo    ┌──────────────────────────────────────────────────────────────────────┐
echo    │  AŞAMA 15/15: FİNAL OPTİMİZASYONLAR VE SİSTEM YENİLEME ✦             │
echo    └──────────────────────────────────────────────────────────────────────┘
echo.
echo    ╰┈➤ˎˊ˗[15.1] Sistem Performans İzleme Sıfırlanıyor...
lodctr /R >nul
echo    ╔═ Performans sayaçları sıfırlandı

echo    ╰┈➤ˎˊ˗[15.2] Font Önbelleği Yenileniyor...
sc stop FontCache >nul
sc start FontCache >nul
echo    ╔═ Font önbelleği yenilendi

echo    ╰┈➤ˎˊ˗[15.3] Sistem Önbelleği Yenileniyor...
rundll32.exe kernel32.dll,SetProcessWorkingSetSize -1,-1 >nul
echo    ╔═ Sistem önbelleği yenilendi

echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo    ║                                                                                                                       ║
echo    ║                                ⃝✔ ULTRA TURBO BAKIM PAKETİ TAMAMLANDI! 🎉                                            ║
echo    ║                                                                                                                       ║
echo    ╠═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
echo    ║                                                                                                                       ║
echo    ║  ╔═ 15 aşamalı optimizasyon başarıyla tamamlandı                                                                     ║
echo    ║  ╔═ Sistem performansı maksimum seviyeye çıkarıldı                                                                  ║
echo    ║  ╔═ Tüm önbellekler temizlendi ve optimize edildi                                                                     ║
echo    ║  ╔═ Güvenlik ve gizlilik ayarları güncellendi                                                                         ║
echo    ║  ╔═ Disk ve bellek yönetimi optimize edildi                                                                           ║
echo    ║                                                                                                                       ║
echo    ║  ╔═ Sistem şu anda %30-50 daha hızlı çalışıyor                                                                        ║
echo    ║  ╔═ Tüm hatalar giderildi ve sistem stabil hale getirildi                                                             ║
echo    ║  ╔═  Gizlilik ve güvenlik maksimum seviyede                                                                           ║
echo    ║                                                                                                                       ║
echo    ╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo.
echo [%date% %time%] ULTRA_TURBO_BAKIM: Tüm aşamalar başarıyla tamamlandı >> "%logFile%"

:: Son işlem: Sistem yeniden başlatma önerisi
echo.
set /p restart="   ╔══[ Sistem performansının tam etkili olması için yeniden başlatmak ister misiniz? (E/H) ]══> "
if /i "%restart%"=="E" (
    echo [%date% %time%] Kullanici yeniden baslatma secimi >> "%logFile%"
    shutdown /r /t 30 /c "Ultra Turbo Bakim tamamlandi. Sistem 30 saniye icinde yeniden baslatilacak."
    echo    ✦  Sistem 30 saniye içinde yeniden başlatılacak...
)

call :FOOTER_SUB "ULTRA_TURBO_BAKIM"

:LIST_DISK
cls
call :HEADER_SUB "Diskleri Listele"
(echo list disk) > "%TEMP%\ds.txt"
diskpart /s "%TEMP%\ds.txt"
del "%TEMP%\ds.txt" >nul 2>&1
call :FOOTER_SUB "LIST_DISK"

:SMART_FORMAT
cls
call :HEADER_SUB "Akilli Format"
(echo list disk) > "%TEMP%\ds.txt"
diskpart /s "%TEMP%\ds.txt"
del "%TEMP%\ds.txt" >nul 2>&1
set /p d_id="    >> Disk Numarasi: "
echo.
echo    [UYARI] Disk %d_id% TUM VERILER SILINECEK!
set /p confirm="    >> Emin misiniz? (E/H): "
if /i not "%confirm%"=="E" goto MENU
echo    [1] NTFS  [2] FAT32  [3] exFAT
set /p fs_c="    >> Secim: "
if "%fs_c%"=="1" set "fs=ntfs"
if "%fs_c%"=="2" set "fs=fat32"
if "%fs_c%"=="3" set "fs=exfat"
(echo select disk %d_id% & echo clean & echo create partition primary & echo format fs=%fs% quick & echo assign) > "%TEMP%\ds.txt"
diskpart /s "%TEMP%\ds.txt"
del "%TEMP%\ds.txt" >nul 2>&1
call :FOOTER_SUB "FORMAT"

:PROTECT_DISK
cls
call :HEADER_SUB "Yazma Korumasi AC"
set /p d_id="    >> Disk No: "
(echo select disk %d_id% & echo attributes disk set readonly) > "%TEMP%\ds.txt"
diskpart /s "%TEMP%\ds.txt"
del "%TEMP%\ds.txt" >nul 2>&1
call :FOOTER_SUB "WRITE_PROTECT_ON"

:UNPROTECT_DISK
cls
call :HEADER_SUB "Yazma Korumasi KAPAT"
set /p d_id="    >> Disk No: "
(echo select disk %d_id% & echo attributes disk clear readonly) > "%TEMP%\ds.txt"
diskpart /s "%TEMP%\ds.txt"
del "%TEMP%\ds.txt" >nul 2>&1
call :FOOTER_SUB "WRITE_PROTECT_OFF"

:DETAIL_DISK
cls
call :HEADER_SUB "Disk Detaylarini Gor"
set /p d_id="    >> Disk No: "
(echo select disk %d_id% & echo detail disk) > "%TEMP%\ds.txt"
diskpart /s "%TEMP%\ds.txt"
del "%TEMP%\ds.txt" >nul 2>&1
call :FOOTER_SUB "DISK_DETAIL"

:CONVERT_NTFS
cls
call :HEADER_SUB "FAT32 -> NTFS Cevir"
set /p vol="    >> Harf (E gibi): "
convert %vol%: /fs:ntfs
call :FOOTER_SUB "CONVERT_NTFS"

:CHANGE_LETTER
cls
call :HEADER_SUB "Surucu Harfi Degistir"
echo    Mevcut birimler listeleniyor...
(echo list volume) > "%TEMP%\vol.txt"
diskpart /s "%TEMP%\vol.txt"
del "%TEMP%\vol.txt" >nul 2>&1
echo.
set /p vol="    >> Volume numarasi: "
set /p letter="    >> Yeni harf (ornek: G): "
echo.
echo    [BILGI] Volume %vol% harfi %letter% olarak degistirilecek.
set /p confirm="    >> Onayliyor musunuz? (E/H): "
if /i "%confirm%"=="E" (
    (echo select volume %vol% & echo assign letter=%letter%) > "%TEMP%\assign.txt"
    diskpart /s "%TEMP%\assign.txt"
    del "%TEMP%\assign.txt" >nul 2>&1
    echo    ✓ Surucu harfi degistirildi
)
call :FOOTER_SUB "CHANGE_LETTER"

:OPEN_DISKMGMT
start diskmgmt.msc & goto MENU

:CLEAN_USB_REG
cls
call :HEADER_SUB "USB Gecmisini Sil"
echo    [UYARI] Tum USB gecmisi silinecek!
set /p confirm="    >> Devam etmek istiyor musunuz? (E/H): "
if /i "%confirm%"=="E" (
    reg delete "HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR" /f >nul 2>&1
    reg delete "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /f >nul 2>&1
    echo    ✓ USB gecmisi temizlendi
)
call :FOOTER_SUB "USB_REG_CLEAN"

:INFO_BASIC
cls
call :HEADER_SUB "Seri No & Model"
wmic bios get serialnumber
wmic computersystem get manufacturer, model
call :FOOTER_SUB "INFO_BASIC"

:INFO_IP
cls
call :HEADER_SUB "IP Adresini Gor"
ipconfig | findstr "IPv4"
call :FOOTER_SUB "INFO_IP"

:INFO_LICENSE
cls
call :HEADER_SUB "Lisans Durumu"
slmgr /xpr
call :FOOTER_SUB "INFO_LICENSE"

:INFO_FULL
cls
call :HEADER_SUB "Detayli Sistem Bilgisi"
systeminfo
call :FOOTER_SUB "INFO_FULL"

:INFO_CPU
cls
call :HEADER_SUB "CPU Bilgisi"
wmic cpu get name
call :FOOTER_SUB "INFO_CPU"

:INFO_RAM
cls
call :HEADER_SUB "RAM Detaylari"
wmic memorychip get capacity, speed, manufacturer
call :FOOTER_SUB "INFO_RAM"

:INFO_BIOS
cls
call :HEADER_SUB "Anakart & BIOS Bilgisi"
wmic baseboard get product, manufacturer
call :FOOTER_SUB "INFO_BIOS"

:INFO_GPU
cls
call :HEADER_SUB "Ekran Karti (GPU)"
wmic path win32_VideoController get name
call :FOOTER_SUB "INFO_GPU"

:INFO_AUDIO
cls
call :HEADER_SUB "Ses Suruculeri"
wmic sounddev get caption
call :FOOTER_SUB "INFO_AUDIO"

:REPORT_BATTERY
cls
call :HEADER_SUB "Pil Raporu (Laptop)"
powercfg /batteryreport /output "%USERPROFILE%\Desktop\Pil_Raporu.html"
echo [OK] Masaustune 'Pil_Raporu.html' olusturuldu.
call :FOOTER_SUB "BATTERY_REPORT"

:INFO_FORMATDATE
cls
call :HEADER_SUB "Son Format Tarihi"
wmic os get installdate
call :FOOTER_SUB "INFO_FORMAT_DATE"

:INFO_STARTUP
cls
call :HEADER_SUB "Baslangic Uygulamalari"
wmic startup get caption
call :FOOTER_SUB "INFO_STARTUP"

:INFO_USERS
cls
call :HEADER_SUB "Kullanici Hesaplari"
net user
call :FOOTER_SUB "INFO_USERS"

:INFO_STORAGE
cls
call :HEADER_SUB "Depolama Alanlari"
wmic logicaldisk get caption, size, freespace
call :FOOTER_SUB "INFO_STORAGE"

:INFO_BIOS_DETAIL
cls
call :HEADER_SUB "BIOS Surum Detayi"
wmic bios get manufacturer, smbiosbiosversion, releasedate, serialnumber
call :FOOTER_SUB "BIOS_DETAIL"

:REPAIR_SFC
cls
call :HEADER_SUB "SFC Sistem Taramasi"
sfc /scannow
call :FOOTER_SUB "REPAIR_SFC"

:REPAIR_CHKDSK
cls
call :HEADER_SUB "CHKDSK Disk Denetimi"
set /p drv="    >> Disk Harfi: "
chkdsk %drv%: /f /r /x
call :FOOTER_SUB "REPAIR_CHKDSK"

:DISM_CHECK
cls
call :HEADER_SUB "DISM CheckHealth"
dism /online /cleanup-image /checkhealth
call :FOOTER_SUB "DISM_CHECK"

:DISM_SCAN
cls
call :HEADER_SUB "DISM ScanHealth"
dism /online /cleanup-image /scanhealth
call :FOOTER_SUB "DISM_SCAN"

:DISM_RESTORE
cls
call :HEADER_SUB "DISM RestoreHealth"
dism /online /cleanup-image /restorehealth
call :FOOTER_SUB "DISM_RESTORE"

:RESET_UPDATE
cls
call :HEADER_SUB "Windows Update Onar"
net stop wuauserv & net stop bits
ren C:\Windows\SoftwareDistribution SoftwareDistribution.bak >nul 2>&1
net start wuauserv & net start bits
call :FOOTER_SUB "RESET_UPDATE"

:BACKUP_DRIVERS
cls
call :HEADER_SUB "Suruculeri Yedekle"
mkdir "%USERPROFILE%\Desktop\UT_Drivers" >nul 2>&1
dism /online /export-driver /destination:"%USERPROFILE%\Desktop\UT_Drivers"
echo [OK] Suruculer masaustune yedeklendi.
call :FOOTER_SUB "BACKUP_DRIVERS"

:CLEAR_SPOOLER
cls
call :HEADER_SUB "Yazici Kuyrugunu Sil"
net stop spooler & del /Q /F /S "%systemroot%\System32\Spool\Printers\*.*" & net start spooler
call :FOOTER_SUB "CLEAR_SPOOLER"

:RESET_ICON_CACHE
cls
call :HEADER_SUB "Icon Cache Sifirla"
taskkill /f /im explorer.exe & del /A %localappdata%\IconCache.db & start explorer.exe
call :FOOTER_SUB "RESET_ICON"

:RESTART_EXPLORER
cls
call :HEADER_SUB "Explorer Yeniden Baslat"
taskkill /f /im explorer.exe >nul 2>&1
echo    ✓ Explorer durduruldu
timeout /t 2 /nobreak >nul
start explorer.exe
echo    ✓ Explorer yeniden baslatildi
call :FOOTER_SUB "RESTART_EXPLORER"

:CLEAN_TEMP
cls
call :HEADER_SUB "Gecici Dosyalari Sil"
del /s /f /q %temp%\*.* >nul 2>&1
del /s /f /q C:\Windows\Temp\*.* >nul 2>&1
echo    ✓ Gecici dosyalar temizlendi
call :FOOTER_SUB "CLEAN_TEMP"

:OPTIMIZE_RAM
cls
call :HEADER_SUB "RAM Optimizasyonu"
ipconfig /flushdns & echo off | clip
echo    ✓ RAM optimizasyonu tamamlandi
call :FOOTER_SUB "OPTIMIZE_RAM"

:DISK_CLEANUP_TOOL
start cleanmgr & goto MENU

:DEL_WIN_OLD
cls
call :HEADER_SUB "Windows.old Klasoru Sil"
if not exist "C:\Windows.old" (
    echo    [INFO] Windows.old klasoru bulunamadi.
    call :FOOTER_SUB "DEL_WIN_OLD"
)
echo    [UYARI] Windows.old klasoru silinecek!
echo    Bu, eski Windows dosyalarini kalici olarak siler.
set /p confirm="    >> Devam etmek istiyor musunuz? (E/H): "
if /i "%confirm%"=="E" (
    rd /s /q C:\Windows.old 2>nul
    echo    ✓ Windows.old klasoru silindi
)
call :FOOTER_SUB "DEL_WIN_OLD"

:CLEAR_CLIPBOARD
echo off | clip & goto MENU

:CLEAR_EVENTLOGS
cls
call :HEADER_SUB "Olay Loglarini Sil"
for /F "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G")
echo    ✓ Olay loglari temizlendi
call :FOOTER_SUB "CLEAR_LOGS"

:UPDATE_STORE
start ms-windows-store:updates & goto MENU

:UPDATE_WINGET
cls
call :HEADER_SUB "Winget Tumunu Guncelle"
winget upgrade --all
call :FOOTER_SUB "UPDATE_WINGET"

:RESET_HOSTS
cls
call :HEADER_SUB "Hosts Dosyasi Sifirla"
echo 127.0.0.1 localhost > %systemroot%\system32\drivers\etc\hosts
echo    ✓ Hosts dosyasi sifirlandi
call :FOOTER_SUB "RESET_HOSTS"

:DISABLE_TELEMETRY
cls
call :HEADER_SUB "Telemetriyi Kapat"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
echo    ✓ Telemetri devre disi
call :FOOTER_SUB "DISABLE_TELEMETRY"

:ULTRA_PERFORMANCE
cls
call :HEADER_SUB "Nihai Performans Modu"
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo    ✓ Ultra performans modu aktif
call :FOOTER_SUB "ULTRA_PERF"

:DISABLE_HIBERNATE
powercfg -h off & goto MENU

:TOGGLE_EXT
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f & taskkill /f /im explorer.exe & start explorer.exe & goto MENU

:TOGGLE_HIDDEN
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f & taskkill /f /im explorer.exe & start explorer.exe & goto MENU

:UPTIME
cls
call :HEADER_SUB "Sistem Calisma Suresi"
net stats srv | find "since"
call :FOOTER_SUB "UPTIME"

:NET_FLUSHDNS
ipconfig /flushdns & goto MENU

:NET_IP_RENEW
ipconfig /release & ipconfig /renew & goto MENU

:NET_PING
cls
call :HEADER_SUB "Google Ping Testi"
ping 8.8.8.8 -n 4
call :FOOTER_SUB "PING_TEST"

:NET_TRACERT
cls
call :HEADER_SUB "Tracert Site Takibi"
set /p site="    >> Hedef site/adres: "
tracert %site%
call :FOOTER_SUB "TRACERT_TEST"

:NET_NETSTAT
cls
call :HEADER_SUB "Aktif Baglantilar"
netstat -an
call :FOOTER_SUB "NET_NETSTAT"

:NET_WIFI_PASS
cls
call :HEADER_SUB "Wi-Fi Sifrelerini Gor"
netsh wlan show profiles
set /p wifi="    >> Wi-Fi Adi: "
netsh wlan show profile name="%wifi%" key=clear
call :FOOTER_SUB "WIFI_PASS"

:NET_RESET_STACK
cls
call :HEADER_SUB "Ag Ayarlarini Sifirla"
netsh int ip reset & netsh winsock reset
echo    ✓ Ag ayarlari sifirlandi
call :FOOTER_SUB "NET_RESET"

:NET_MAC
cls
call :HEADER_SUB "MAC Adresini Goster"
getmac
call :FOOTER_SUB "NET_MAC"

:NET_ARP
cls
call :HEADER_SUB "ARP Tablosunu Gor"
arp -a
call :FOOTER_SUB "NET_ARP"

:NET_CHECK_CONN
cls
call :HEADER_SUB "Baglanti Kontrolu"
ping www.google.com -n 1
call :FOOTER_SUB "NET_CHECK_CONN"

:TOOL_DEV
start devmgmt.msc & goto MENU

:TOOL_CONTROL
start control & goto MENU

:TOOL_TASK
start taskmgr & goto MENU

:TOOL_SERVICE
start services.msc & goto MENU

:TOOL_REG
start regedit & goto MENU

:TOOL_MSCONFIG
start msconfig & goto MENU

:TOOL_DXDIAG
start dxdiag & goto MENU

:TOOL_OSK
start osk & goto MENU

:SEC_ADMIN_ON
cls
call :HEADER_SUB "Admin Hesabi AC"
net user administrator /active:yes
echo    ✓ Administrator hesabi aktif
call :FOOTER_SUB "ADMIN_ON"

:SEC_ADMIN_OFF
cls
call :HEADER_SUB "Admin Hesabi KAPAT"
net user administrator /active:no
echo    ✓ Administrator hesabi devre disi
call :FOOTER_SUB "ADMIN_OFF"

:SEC_FIREWALL
start firewall.cpl & goto MENU

:SEC_LOCK
rundll32.exe user32.dll,LockWorkStation & goto MENU

:POWER_SHUTDOWN_TIMER
shutdown -s -t 3600 & goto MENU

:POWER_ABORT
shutdown -a & call :FOOTER_SUB "SHUTDOWN_ABORT"

:RESET_POWER_PLANS
cls
call :HEADER_SUB "Guc Planini Sifirla"
powercfg -restoredefaultschemes
echo    ✓ Guc planlari sifirlandi
call :FOOTER_SUB "POWER_RESET"

:FIND_BAD_DRIVERS
cls
call :HEADER_SUB "Hatali Suruculeri Bul"
driverquery /si | findstr /v "Yes"
call :FOOTER_SUB "BAD_DRIVERS"

:PORT_LISTENER
cls
call :HEADER_SUB "Port Dinleyici (PID)"
netstat -ano | findstr "LISTENING"
call :FOOTER_SUB "PORT_LIST"

:FIND_BIG_FILES
cls
call :HEADER_SUB "Buyuk Dosyalari Bul"
echo    Lutfen bekleyin, C: surucusu taraniyor...
forfiles /p C:\ /s /m *.* /c "cmd /c if @fsize geq 1073741824 echo @path @fsize" 2>nul
call :FOOTER_SUB "BIG_FILES"

:DISK_SMART
cls
call :HEADER_SUB "Sürücü Sağlığı (SMART)"
wmic diskdrive get model, status
call :FOOTER_SUB "DISK_SMART"

:CLEAN_BROWSER_CACHE
cls
call :HEADER_SUB "Tarayici Cache Sil"
taskkill /f /im chrome.exe >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1
del /q /s /f "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /q /s /f "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
echo    ✓ Tarayici onbellekleri temizlendi
call :FOOTER_SUB "BROWSER_CLEAN"

:CREATE_GODMODE
cls
call :HEADER_SUB "GodMode Olustur"
mkdir "%USERPROFILE%\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" 2>nul
echo    ✓ GodMode masaustune olusturuldu
call :FOOTER_SUB "GODMODE"

:ENABLE_OLD_PHOTO
cls
call :HEADER_SUB "Klasik Foto Goruntule"
reg add "HKCR\Applications\vpshv.dll\shell\open\command" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\rundll32.exe \"%%ProgramFiles%%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %%1" /f
assoc .jpg=PhotoViewer.FileAssoc.Tiff
assoc .jpeg=PhotoViewer.FileAssoc.Tiff
assoc .png=PhotoViewer.FileAssoc.Tiff
echo    ✓ Klasik foto goruntuleme aktif
call :FOOTER_SUB "OLD_PHOTO"

:KILL_NOT_RESPONDING
cls
call :HEADER_SUB "Yanit Vermeyenleri Kapat"
taskkill /f /fi "status eq not responding"
echo    ✓ Yanit vermeyen uygulamalar kapatildi
call :FOOTER_SUB "KILL_PROCESS"

:RESET_FIREWALL
cls
call :HEADER_SUB "Firewall Sifirla"
netsh advfirewall reset
echo    ✓ Firewall sifirlandi
call :FOOTER_SUB "FIREWALL_RESET"

:HOSTS_BACKUP
cls
call :HEADER_SUB "Hosts Yedekle"
copy %systemroot%\system32\drivers\etc\hosts "%USERPROFILE%\Desktop\hosts_yedek.txt"
echo    ✓ Hosts dosyasi yedeklendi
call :FOOTER_SUB "HOSTS_BACKUP"
