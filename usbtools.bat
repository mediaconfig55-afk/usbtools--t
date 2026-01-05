@echo off
setlocal enabledelayedexpansion
:: Kodlama sayfasini Turkce karakterler icin ayarla
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
title Professional IT Support & USB Suite v8.6 [STABLE] - Code Emre Bilgin
mode con: cols=125 lines=62

:MENU
cls
echo.
echo  =========================================================================================================================
echo  =                                  USB YONETIM, SISTEM BAKIM VE ONARIM KONSOLU (V8.6)                                   =
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
echo =========================================================================================================================
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
echo  [19] Pil Saglik Raporu (Laptop)           [44] Hosts Dosyasini Sifirla              ====================================
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
echo.
echo [ACIKLAMA] Sisteminizdeki tum diskler listeleniyor...
echo [BILGI] Disk Numarasi, Durum, Boyut, Bos Alan ve Turu goruntulenecek.
echo [DIKKAT] Format islemi icin dogru Disk Numarasini (Ornek: 1) not alin.
echo.
echo list disk > ds.txt
diskpart /s ds.txt
del ds.txt
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:SMART_FORMAT
cls
echo.
echo ========================================================================
echo                      AKILLI USB/DISK FORMAT ARACI
echo ========================================================================
echo.
echo [UYARI] Bu islem secilen diskteki TUM verileri SILER!
echo [UYARI] Format oncesi onemli verilerinizi yedeklediginizden emin olun.
echo.
echo list disk > ds.txt
diskpart /s ds.txt
del ds.txt
echo.
echo ------------------------------------------------------------------------
echo [ADIM 1/5] Disk Numarasi Secimi
echo ------------------------------------------------------------------------
set /p diskID="Formatlanacak Disk Numarasini girin (Ornek: 1): "

echo.
echo ------------------------------------------------------------------------
echo [ADIM 2/5] Dosya Sistemi Secimi
echo ------------------------------------------------------------------------
echo [1] NTFS      - Windows icin ideal, 4GB uzeri dosyalari destekler
echo [2] FAT32     - USB Bellek, TV, Araba Stereo icin uygun (MAX 4GB dosya)
echo [3] exFAT     - Hem Windows hem Mac OS X icin, buyuk dosyalar icin
echo.
set /p fs_choice="Dosya Sistemini secin (1/2/3): "

if "%fs_choice%"=="1" set "fs_type=ntfs"
if "%fs_choice%"=="2" set "fs_type=fat32"
if "%fs_choice%"=="3" set "fs_type=exfat"

echo.
echo ------------------------------------------------------------------------
echo [ADIM 3/5] Islem Onayı
echo ------------------------------------------------------------------------
echo [UYARI] Disk %diskID% uzerindeki TUM VERILER SILINECEK!
echo [UYARI] Dosya Sistemi: %fs_type% olarak formatlanacak.
echo.
set /p confirm="Devam etmek istiyor musunuz? (E=Evet / H=Hayir): "

if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Format islemi iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)

echo.
echo ------------------------------------------------------------------------
echo [ADIM 4/5] Formatlama Islemi Baslatildi
echo ------------------------------------------------------------------------
echo [BILGI] Disk %diskID% seciliyor...
echo [BILGI] Tum bölümler temizleniyor...
echo [BILGI] Yeni bölüm olusturuluyor...
echo [BILGI] %fs_type% dosya sistemi ile formatlaniyor...
echo [BILGI] Surucu harfi ataniyor...
echo.
(echo select disk %diskID% & echo clean & echo create partition primary & echo format fs=%fs_type% quick & echo assign) > ds.txt
diskpart /s ds.txt
del ds.txt

echo.
echo ------------------------------------------------------------------------
echo [ADIM 5/5] Islem Tamamlandi
echo ------------------------------------------------------------------------
echo [BASARILI] Disk %diskID% basariyla formatlandi!
echo [BILGI] Dosya Sistemi: %fs_type%
echo [BILGI] Artik yeni birim kullanima hazir.
echo.
echo [NOT] USB belleği guvenli bir sekilde cikarmak icin:
echo       - Sistem tepsisindeki "Guvenli Donanim Kaldir" simgesini kullanin
echo       - Bellek isigi sonene kadar bekleyin ve sonra cikarin
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:PROTECT_DISK
cls
echo.
echo ========================================================================
echo                     YAZMA KORUMASI ETKINLESTIRME
echo ========================================================================
echo.
echo [ACIKLAMA] Bu islem secilen diski "Salt Okunur" (Read-Only) yapar.
echo [KULLANIM] USB belleginizin iceriginin silinmesini/korunmasini istiyorsaniz
echo           bu islemi uygulayin. Korumayi kaldirmak icin [4] numarali secenegi kullanin.
echo.
echo list disk > ds.txt
diskpart /s ds.txt
del ds.txt
echo.
set /p diskID="Yazma korumasi uygulanacak Disk Numarasini girin: "
echo.
echo [BILGI] Disk %diskID% seciliyor...
echo [BILGI] Yazma korumasi etkinlestiriliyor...
(echo select disk %diskID% & echo attributes disk set readonly) > ds.txt
diskpart /s ds.txt
del ds.txt
echo.
echo [BASARILI] Disk %diskID% artik Salt Okunur (Yazma Korumali).
echo [UYARI] Artik bu disk uzerine dosya yazamaz/kopylayamaz/silemezsiniz.
echo [UYARI] Korumayi kaldirmak icin [4] numarali secenegi kullanin.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:UNPROTECT_DISK
cls
echo.
echo ========================================================================
echo                        YAZMA KORUMASI KALDIRMA
echo ========================================================================
echo.
echo [ACIKLAMA] Bu islem secilen diskteki "Salt Okunur" (Read-Only) ozelligini kaldirir.
echo [KULLANIM] USB belleğinize tekrar dosya yazmak/kopyalamak istiyorsaniz
echo           bu islemi uygulayin.
echo.
echo list disk > ds.txt
diskpart /s ds.txt
del ds.txt
echo.
set /p diskID="Yazma korumasi kaldirilacak Disk Numarasini girin: "
echo.
echo [BILGI] Disk %diskID% seciliyor...
echo [BILGI] Yazma korumasi kaldiriliyor...
(echo select disk %diskID% & echo attributes disk clear readonly) > ds.txt
diskpart /s ds.txt
del ds.txt
echo.
echo [BASARILI] Disk %diskID% yazma korumasi kaldirildi.
echo [BILGI] Artik bu disk uzerine dosya yazabilir/kopyalayabilir/silebilirsiniz.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:DETAIL_DISK
cls
echo.
echo ========================================================================
echo                           DISK DETAYLARINI GOSTER
echo ========================================================================
echo.
echo [ACIKLAMA] Secilen diskin tum bolumleri ve ozellikleri goruntulenir.
echo [KULLANIM] Hangi bolumun ne kadar alana sahip oldugunu gormek icin kullanin.
echo.
echo list disk > ds.txt
diskpart /s ds.txt
del ds.txt
echo.
set /p diskID="Detaylari goruntulenecek Disk Numarasini girin: "
echo.
echo [BILGI] Disk %diskID% detaylari getiriliyor...
(echo select disk %diskID% & echo detail disk) > ds.txt
diskpart /s ds.txt
del ds.txt
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:CONVERT_NTFS
cls
echo.
echo ========================================================================
echo                     FAT32'DEN NTFS'YE DONUSTURME
echo ========================================================================
echo.
echo [ACIKLAMA] Bu islem FAT32 dosya sistemini NTFS'ye donusturur.
echo [AVANTAJ] - 4GB'tan buyuk dosyalari destekler
echo           - Daha iyi guvenlik ve izin yonetimi
echo           - Daha verimli disk kullanimi
echo [DIKKAT]   - Islem sirasinda elektrik kesilmemeli
echo           - Veriler korunur (silinmez)
echo           - Islem geri alinamaz
echo.
set /p vol="Donusturulecek Surucu Harfini girin (Ornek: E): "
echo.
echo [UYARI] %vol%: surucusu NTFS'ye donusturulecek.
echo [UYARI] Islem surerken bilgisayari kapatmayin veya yeniden baslatmayin.
echo.
set /p confirm="Devam etmek istiyor musunuz? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo [BILGI] %vol%: surucusu NTFS'ye donusturuluyor...
echo [BILGI] Bu islem birkaç dakika surebilir...
convert %vol%: /fs:ntfs
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:CHANGE_LETTER
cls
echo.
echo ========================================================================
echo                         SURUCU HARFI DEGISTIRME
echo ========================================================================
echo.
echo [ACIKLAMA] Disk Yonetimi aracı acilacaktir.
echo [KULLANIM] Degistirmek istediginiz surucuye sag tiklayip
echo           "Surucu Harfi ve Yollarini Degistir" secenegini secin.
echo [DIKKAT]   Sistem suruculerinin (C:) harfini degistirmeyin!
echo.
echo Disk Yonetimi aracı aciliyor...
start diskmgmt.msc
echo.
echo [BILGI] Disk Yonetimi penceresi acildi.
echo [BILGI] Isleminizi tamamladiktan sonra bu pencereye donun.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:OPEN_DISKMGMT
start diskmgmt.msc
goto MENU

:CLEAN_USB_REG
cls
echo.
echo ========================================================================
echo                     USB BAGLANTI GECMISI TEMIZLIGI
echo ========================================================================
echo.
echo [ACIKLAMA] Windows, baglanan tum USB aygitlarin kaydini tutar.
echo           Bu kayitlar bazen guvenlik veya gizlilik nedeniyle temizlenmek istenebilir.
echo.
echo [YONTEM 1] Manuel Temizlik (Tavsiye Edilen):
echo           1. USBDeview aracını indirin (NirSoft sitesinden)
echo           2. Yonetici olarak calistirin
echo           3. Silmek istediginiz USB kayitlarini secin
echo           4. Sag tiklayip "Delete Selected Devices" secin
echo.
echo [YONTEM 2] Komut Istemi ile:
echo           Asagidaki komutlari sirayla calistirin:
echo           reg delete "HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR" /f
echo           reg delete "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /f
echo           [UYARI] Bu tum USB gecmisini siler!
echo.
echo [DIKKAT] Bu islem kayit defterini etkiler, dikkatli olun!
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:: --- SISTEM BILGILERI ---
:INFO_BASIC
cls
echo.
echo ========================================================================
echo                       TEMEL SISTEM BILGISI
echo ========================================================================
echo.
echo [BILGI] Cihaz Seri Numarasi:
wmic bios get serialnumber
echo.
echo [BILGI] Bilgisayar Adi:
hostname
echo.
echo [BILGI] Uretici ve Model:
wmic computersystem get manufacturer, model
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:INFO_IP
cls
echo.
echo ========================================================================
echo                       AG VE IP BILGILERI
echo ========================================================================
echo.
echo [BILGI] IPv4 Adresleri (Aktif baglantilar):
ipconfig | findstr /i "IPv4"
echo.
echo [NOT] Eger IP adresi gorunmuyorsa:
echo       - Ag baglantinizi kontrol edin
echo       - Wi-Fi/Ethernet baglantisinin aktif oldugundan emin olun
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:INFO_LICENSE
cls
echo.
echo ========================================================================
echo                       WINDOWS LISANS DURUMU
echo ========================================================================
echo.
echo [BILGI] Lisans Suresi (Son Kullanma Tarihi):
slmgr /xpr
echo.
echo [BILGI] BIOS'ta Gömülü Lisans Anahtari (OEM Cihazlar icin):
wmic path softwarelicensingservice get OA3xOriginalProductKey
echo.
echo [NOT] Eger anahtar gorunmuyorsa:
echo       - Cihaziniz OEM degil (kendi toplama) olabilir
echo       - Lisans digital olarak Microsoft hesabina kayitli olabilir
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:INFO_FULL
cls
echo.
echo ========================================================================
echo                       DETAYLI SISTEM BILGISI
echo ========================================================================
echo.
echo [BILGI] Sistem bilgileri getiriliyor... Bu biraz surebilir.
systeminfo
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:INFO_CPU
cls
echo.
echo ========================================================================
echo                       ISLEMCİ (CPU) BILGISI
echo ========================================================================
echo.
echo [BILGI] Islemci Ozellikleri:
wmic cpu get name, maxclockspeed, numberofcores, caption
echo.
echo [ACIKLAMA]
echo - Name: Islemci modeli
echo - MaxClockSpeed: Maksimum calisma frekansi (MHz)
echo - NumberOfCores: Cekirdek sayisi
echo - Caption: Islemci ailesi
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:INFO_RAM
cls
echo.
echo ========================================================================
echo                       BELLEK (RAM) BILGISI
echo ========================================================================
echo.
echo [BILGI] RAM Modulleri ve Ozellikleri:
wmic memorychip get capacity, speed, manufacturer, partnumber
echo.
echo [ACIKLAMA]
echo - Capacity: Bellek kapasitesi (byte cinsinden)
echo - Speed: Bellek hizi (MHz)
echo - Manufacturer: Uretici firma
echo - PartNumber: Parca numarasi
echo.
echo [NOT] Kapasiteyi GB'ye cevirmek icin: Byte / 1073741824
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:INFO_BIOS
cls
echo.
echo ========================================================================
echo                       BIOS VE ANAKART BILGISI
echo ========================================================================
echo.
echo [BILGI] BIOS Bilgileri:
wmic bios get name, version, releaseDate
echo.
echo [BILGI] Anakart Bilgileri:
wmic baseboard get product, manufacturer, version
echo.
echo [ACIKLAMA]
echo - BIOS ReleaseDate: BIOS guncelleme tarihi
echo - BaseBoard Product: Anakart modeli
echo - Manufacturer: Anakart ureticisi
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:INFO_GPU
cls
echo.
echo ========================================================================
echo                       EKRAN KARTI (GPU) BILGISI
echo ========================================================================
echo.
echo [BILGI] Ekran Kartlari (Birden fazla olabilir):
wmic path win32_VideoController get name, adapterram, driverversion
echo.
echo [ACIKLAMA]
echo - Name: Ekran karti modeli
echo - AdapterRAM: Ekran karti bellegi (byte)
echo - DriverVersion: Surucu versiyonu
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:INFO_AUDIO
cls
echo.
echo ========================================================================
echo                       SES SURUCULERI BILGISI
echo ========================================================================
echo.
echo [BILGI] Ses Aygıtları ve Durumları:
wmic sounddev get caption, status
echo.
echo [ACIKLAMA]
echo - Caption: Ses aygiti adi
echo - Status: Durumu (OK: Calisiyor, Error: Hata var)
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:REPORT_BATTERY
cls
echo.
echo ========================================================================
echo                       PIL SAGLIK RAPORU (LAPTOP)
echo ========================================================================
echo.
echo [BILGI] Pil raporu hazirlaniyor...
echo [BILGI] Bu islem bir kac saniye surebilir...
powercfg /batteryreport /output "%USERPROFILE%\Desktop\Pil_Raporu.html"
echo.
echo [BASARILI] Pil raporu masaustune 'Pil_Raporu.html' olarak kaydedildi.
echo.
echo [ICERIK] Raporda asagidakiler bulunur:
echo          - Pil ureticisi ve modeli
echo          - Tasarim kapasitesi
echo          - Simdiki tam sarj kapasitesi
echo          - Pil omru ve yipranma orani
echo          - Son 3 gunun pil kullanim gecmisi
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:INFO_FORMATDATE
cls
echo.
echo ========================================================================
echo                ISLETIM SISTEMI KURULUM TARIHI
echo ========================================================================
echo.
echo [BILGI] Windows Kurulum Tarihi:
wmic os get installdate
echo.
echo [ACIKLAMA] Tarih formatı: YYYYMMDDHHMMSS.000000+XXX
echo            Ornek: 20231215083000.000000+180 (15 Aralik 2023, 08:30)
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:INFO_STARTUP
cls
echo.
echo ========================================================================
echo                    BASLANGIC UYGULAMALARI
echo ========================================================================
echo.
echo [BILGI] Windows baslangicinda calisan uygulamalar:
wmic startup get caption, command
echo.
echo [ACIKLAMA]
echo - Caption: Program adi
echo - Command: Calistirilan komut veya yol
echo.
echo [NOT] Baslangicta gereksiz programları kapatmak icin:
echo       - Gorev Yoneticisi'ni acin (Ctrl+Shift+Esc)
echo       - "Baslangic" sekmesine gidin
echo       - Gereksiz programları devre disi birakin
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:INFO_USERS
cls
echo.
echo ========================================================================
echo                    KULLANICI HESAPLARI
echo ========================================================================
echo.
echo [BILGI] Sistemdeki tum kullanici hesaplari:
net user
echo.
echo [ACIKLAMA] Liste icinde:
echo           - Administrator (gizli, [69] ile aktif edilebilir)
echo           - Guest (misafir hesabi, genellikle pasif)
echo           - Kullaniminizdaki hesap (aktif)
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:INFO_STORAGE
cls
echo.
echo ========================================================================
echo                    DEPOLAMA ALANLARI
echo ========================================================================
echo.
echo [BILGI] Diskler ve Bos Alan Durumu:
wmic logicaldisk get caption, freespace, size
echo.
echo [ACIKLAMA]
echo - Caption: Surucu harfi
echo - FreeSpace: Bos alan (byte)
echo - Size: Toplam alan (byte)
echo.
echo [NOT] GB hesaplamak icin: Byte / 1073741824
echo       TB hesaplamak icin: Byte / 1099511627776
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:WINVER
start winver
goto MENU

:INFO_REFRESHRATE
cls
echo.
echo ========================================================================
echo                    MONITOR YENILEME HIZI
echo ========================================================================
echo.
echo [BILGI] Ekran Kartlari ve Monitor Ozellikleri:
wmic path Win32_VideoController get Name, CurrentRefreshRate, VideoModeDescription
echo.
echo [ACIKLAMA]
echo - CurrentRefreshRate: Aktif yenileme hizi (Hz)
echo - VideoModeDescription: Cozunurluk ve renk derinligi
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:: --- ONARIM ---
:REPAIR_SFC
cls
echo.
echo ========================================================================
echo                    SFC (SISTEM DOSYALARI KONTROLU)
echo ========================================================================
echo.
echo [ACIKLAMA] Sistem Dosya Denetleyicisi (SFC) bozuk sistem dosyalarini tarar.
echo [SUREC] 1. Tarama baslatilir (15-30 dakika surebilir)
echo        2. Bozuk dosyalar tespit edilir
echo        3. Onbellekten saglam kopyalarla degistirilir
echo.
echo [UYARI] Bu islem yonetici izni gerektirir.
echo [UYARI] Islem sirasinda bilgisayari kapatmayin.
echo.
echo Sistem dosyalari taranıyor... Lütfen bekleyin.
sfc /scannow
echo.
echo [ONERILER]
echo 1. Eger SFC sorunlari cozmezse, DISM /RestoreHealth calistirin ([30])
echo 2. Yeniden baslattiktan sonra tekrar SFC calistirin
echo 3. Hala sorun varsa, Windows'u onarim ile guncelleyin
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:REPAIR_CHKDSK
cls
echo.
echo ========================================================================
echo                    CHKDSK (DISK HATA DENETIMI)
echo ========================================================================
echo.
echo [ACIKLAMA] Disk yuzeyini tarar, bozuk sektorleri bulur ve duzeltir.
echo [PARAMETRELER]
echo /f - Hatalari duzeltir
echo /r - Bozuk sektorleri bulur ve kurtarilabilir veriyi kurtarir
echo /x - Gerekirse birimi once cikartir
echo.
set /p drv="Hata denetimi yapilacak Surucu Harfi (C/D/E): "
echo.
echo [UYARI] C: surucusu secilirse sistem bir sonraki baslangicta tarayacak.
echo [UYARI] Tarama surucusunun boyutuna gore 1-4 saat surebilir.
echo.
set /p confirm="%drv%: surucusu taranacak. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo [BILGI] %drv%: surucusu taranıyor... Bu uzun surebilir.
chkdsk %drv%: /f /r /x
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:DISM_CHECK
cls
echo.
echo ========================================================================
echo                    DISM CHECKHEALTH (HIZLI KONTROL)
echo ========================================================================
echo.
echo [ACIKLAMA] Windows goruntusunun bozuk olup olmadigini hizlica kontrol eder.
echo [SUREC] 1. Goruntu durumu kontrol edilir
echo        2. Sadece bozukluk olup olmadigi raporlanir
echo        3. Onarim yapilmaz, sadece tespit eder
echo.
echo DISM hizli kontrol baslatiliyor...
dism /online /cleanup-image /checkhealth
echo.
echo [SONUC YORUMU]
echo - "No component store corruption detected.": Sorun yok
echo - "The component store is repairable.": Onarilabilir sorun var
echo - "The component store is corrupted.": Ciddi bozukluk var
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:DISM_SCAN
cls
echo.
echo ========================================================================
echo                    DISM SCANHEALTH (DETAYLI TARAMA)
echo ========================================================================
echo.
echo [ACIKLAMA] Windows goruntusunu detayli sekilde tarar ve bozukluklari tespit eder.
echo [FARK] CheckHealth'a gore daha detayli tarama yapar.
echo [SUREC] 5-15 dakika surebilir.
echo.
echo DISM detayli tarama baslatiliyor... Lutfen bekleyin.
dism /online /cleanup-image /scanhealth
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:DISM_RESTORE
cls
echo.
echo ========================================================================
echo                    DISM RESTOREHEALTH (ONARIM)
echo ========================================================================
echo.
echo [ACIKLAMA] Bozuk Windows goruntusunu onarir.
echo [GEREKSINIM] Aktif internet baglantisi (Windows Update'ten dosya ceker)
echo [SUREC] 15-45 dakika surebilir.
echo.
echo [UYARI] Islem sirasinda internet baglantisini kesmeyin.
echo [UYARI] Laptop kullaniyorsaniz, sarja takili oldugundan emin olun.
echo.
set /p confirm="Windows goruntusu onarilacak. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo DISM onarimi baslatiliyor... Lutfen bekleyin.
echo Bu islem internet baglantisi gerektirir ve zaman alabilir...
dism /online /cleanup-image /restorehealth
echo.
echo [ONERI] DISM tamamlandiktan sonra SFC'yi tekrar calistirin ([26]).
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:RESET_UPDATE
cls
echo.
echo ========================================================================
echo                    WINDOWS UPDATE SIFIRLAMA
echo ========================================================================
echo.
echo [ACIKLAMA] Windows Update bilesenlerini sifirlar, guncelleme sorunlarini cozer.
echo [SUREC] 1. Update servisleri durdurulur
echo        2. Onbellek klasorleri yeniden adlandirilir
echo        3. Servisler yeniden baslatilir
echo.
echo Servisler durduruluyor...
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
echo.
echo Klasorler yenileniyor...
ren %systemroot%\SoftwareDistribution SoftwareDistribution.old
ren %systemroot%\System32\catroot2 catroot2.old
echo.
echo Servisler baslatiliyor...
net start wuauserv
net start cryptSvc
net start bits
net start msiserver
echo.
echo [BASARILI] Windows Update veritabani sifirlandi.
echo.
echo [SONRAKI ADIMLAR]
echo 1. Windows Update'i tekrar kontrol edin
echo 2. Eger sorun cozulmezse, [30] DISM RestoreHealth'i calistirin
echo 3. Yeniden baslatin ve tekrar deneyin
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:BACKUP_DRIVERS
cls
echo.
echo ========================================================================
echo                    SURUCULERI (DRIVERS) YEDEKLEME
echo ========================================================================
echo.
echo [ACIKLAMA] Tum yuklu suruculeri masaustune yedekler.
echo [KULLANIM] Format atarken veya surucu sorunlarinda kullanin.
echo [CIKTI] Masaustunde "Driver_Yedek" klasoru olusur.
echo.
if not exist "%USERPROFILE%\Desktop\Driver_Yedek" mkdir "%USERPROFILE%\Desktop\Driver_Yedek"
echo.
echo Suruculer masaustune yedekleniyor, lutfen bekleyin...
echo Bu islem surucu sayisina gore 1-5 dakika surebilir...
dism /online /export-driver /destination:"%USERPROFILE%\Desktop\Driver_Yedek"
echo.
echo [BASARILI] Islem tamamlandi.
echo [KONUM] Masaustu -> "Driver_Yedek" klasoru
echo.
echo [YEDEKLENENLER]
echo - .inf dosyalari (surucu kurulum dosyalari)
echo - .sys dosyalari (sistem dosyalari)
echo - .dll dosyalari (kutuphane dosyalari)
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:CLEAR_SPOOLER
cls
echo.
echo ========================================================================
echo                    YAZICI KUYRUGUNU TEMIZLEME
echo ========================================================================
echo.
echo [ACIKLAMA] Yazdirma kuyrugundaki takilan islemleri temizler.
echo [KULLANIM] Yazici takildiginda, islem iptal edilemediginde kullanin.
echo.
echo [UYARI] Tum bekleyen yazdirma islemleri silinecek!
echo.
set /p confirm="Yazici kuyrugu temizlenecek. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo Spooler servisi durduruluyor...
net stop spooler
echo.
echo Kuyruk dosyalari siliniyor...
del /Q /F /S "%systemroot%\System32\Spool\Printers\*.*"
echo.
echo Spooler servisi baslatiliyor...
net start spooler
echo.
echo [BASARILI] Yazici kuyrugu temizlendi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:RESET_ICON_CACHE
cls
echo.
echo ========================================================================
echo                    ICON ONBELLEGINI SIFIRLAMA
echo ========================================================================
echo.
echo [ACIKLAMA] Bozuk gorunen masaustu simgelerini duzeltir.
echo [KULLANIM] Simgeler yanlis, bos veya standart gorunuyorsa kullanin.
echo.
echo [UYARI] Explorer (masaustu) kapatilip acilacak, panik yapmayin.
echo.
set /p confirm="Icon onbellegi sifirlanacak. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo Explorer kapatiliyor... (Masaustu ve baslat menusu kaybolacak)
taskkill /f /im explorer.exe
echo.
echo Onbellek dosyasi siliniyor...
del /f /q "%localappdata%\IconCache.db"
echo.
echo Explorer baslatiliyor...
start explorer.exe
echo.
echo [BASARILI] Icon onbellegi sifirlandi.
echo [NOT] Simgeler bir sure sonra normal gorunmeye baslayacak.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:RESTART_EXPLORER
cls
echo.
echo ========================================================================
echo                    EXPLORER.EXE YENIDEN BASLATMA
echo ========================================================================
echo.
echo [ACIKLAMA] Windows Gezgini'ni (masaustu, dosya gezgini) yeniden baslatir.
echo [KULLANIM] Masaustu dondugunde, tepsi simgeleri kayboldugunda kullanin.
echo.
echo [UYARI] Masaustu 2-3 saniyeligine kaybolup geri gelecek.
echo.
set /p confirm="Explorer yeniden baslatilacak. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo Explorer kapatiliyor...
taskkill /f /im explorer.exe
echo.
echo Explorer baslatiliyor...
start explorer.exe
echo.
echo [BASARILI] Explorer yeniden baslatildi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
goto MENU

:: --- PERFORMANS ---
:CLEAN_TEMP
cls
echo.
echo ========================================================================
echo                    GECICI DOSYALARI TEMIZLEME
echo ========================================================================
echo.
echo [ACIKLAMA] Temp klasorlerindeki gecici dosyalari siler.
echo [KAZANIM] 500MB-5GB arasi disk alani acilabilir.
echo.
echo [UYARI] Bazi dosyalar kullanimda oldugu icin silinemeyebilir, bu normaldir.
echo.
set /p confirm="Gecici dosyalar silinecek. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo Temp klasorleri temizleniyor...
del /q /f /s "%TEMP%\*"
del /q /f /s "%WINDIR%\Temp\*"
echo.
echo [BASARILI] Gecici dosyalar temizlendi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:OPTIMIZE_RAM
cls
echo.
echo ========================================================================
echo                    RAM OPTIMIZASYONU
echo ========================================================================
echo.
echo [ACIKLAMA] Kullanilmayan RAM'i bosaltir, sistem performansini artirir.
echo [KULLANIM] Sistem yavasladiginda, fazla RAM kullanildiginda uygulayin.
echo.
echo [NOT] Bu gecici bir cozumdur. Kalici cozum icin:
echo       - Gereksiz baslangic programlarini kapatın
echo       - Daha fazla RAM ekleyin
echo       - Virus taramasi yapin
echo.
set /p confirm="RAM optimizasyonu yapilacak. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo RAM bosaltma tetikleniyor...
echo FreeMem = Space(80000000) > "%TEMP%\CleanMem.vbs"
cscript //nologo "%TEMP%\CleanMem.vbs"
del "%TEMP%\CleanMem.vbs"
echo.
echo [BASARILI] RAM onbellegi temizlendi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:DISK_CLEANUP_TOOL
cleanmgr
goto MENU

:DEL_WIN_OLD
cls
echo.
echo ========================================================================
echo                    WINDOWS.OLD KLASORUNU SILME
echo ========================================================================
echo.
echo [ACIKLAMA] Windows guncellemesinden kalan eski sistem dosyalarini siler.
echo [KAZANIM] 10-30GB disk alani acilabilir.
echo [DIKKAT] Bu klasoru sildikten sonra onceki Windows surumune donemezsiniz!
echo.
if not exist C:\Windows.old (
    echo [BILGI] Windows.old klasoru bulunamadi.
    echo [SEBEPLER]
    echo - Windows guncellemesi yapilmamis
    echo - Daha once silinmis
    echo - 10 gunden eski ve Windows otomatik silmis
    echo.
    echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
    pause
    goto MENU
)
echo.
echo [UYARI] Windows.old klasoru bulundu ve silinecek!
echo [UYARI] Onceki Windows surumune donus yapamayacaksiniz!
echo [UYARI] Islem 5-30 dakika surebilir.
echo.
set /p confirm="Windows.old klasoru SILINECEK. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo Windows.old klasoru siliniyor, bu islem uzun surebilir...
echo Lutfen bekleyin, bilgisayari kapatmayin...
rd /s /q C:\Windows.old
echo.
echo [BASARILI] Windows.old klasoru silindi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:CLEAR_CLIPBOARD
cls
echo.
echo ========================================================================
echo                    PANO (CLIPBOARD) TEMIZLEME
echo ========================================================================
echo.
echo [ACIKLAMA] Kopyala/Yapistir panosundaki veriyi siler.
echo [KULLANIM] Guvenlik icin veya panoda birikmis veriyi temizlemek icin.
echo.
echo off | clip
echo.
echo [BASARILI] Kopyala/Yapistir panosu temizlendi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:CLEAR_EVENTLOGS
cls
echo.
echo ========================================================================
echo                    OLAY GUNLUKLERINI TEMIZLEME
echo ========================================================================
echo.
echo [ACIKLAMA] Tum Windows olay gunluklerini (logs) temizler.
echo [KULLANIM] Disk alani kazanmak veya gunlukleri sifirlamak icin.
echo [DIKKAT] Sorun cozumu icin gerekli loglar silinebilir!
echo.
echo [UYARI] Tum sistem ve uygulama loglari silinecek!
echo.
set /p confirm="Tum olay gunlukleri silinecek. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo Olay gunlukleri temizleniyor...
for /F "tokens=*" %%1 in ('wevtutil.exe el') DO wevtutil.exe cl "%%1"
echo.
echo [BASARILI] Tum loglar silindi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:UPDATE_STORE
cls
echo.
echo ========================================================================
echo              WINDOWS MAGAZA UYGULAMALARINI GUNCELLEME
echo ========================================================================
echo.
echo [ACIKLAMA] Windows Store ve tum Microsoft Store uygulamalarini onarir.
echo [KULLANIM] Store uygulamari acilmadiginda veya guncelleme sorunlarinda.
echo.
echo Windows Store uygulamalari guncelleniyor (PowerShell)...
echo Bu islem bir kac dakika surebilir...
powershell -ExecutionPolicy Bypass -Command "Get-AppxPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register '$($_.InstallLocation)\AppXManifest.xml'}"
echo.
echo [BASARILI] Islem tamam.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:UPDATE_WINGET
cls
echo.
echo ========================================================================
echo                    WINGET ILE PROGRAM GUNCELLEME
echo ========================================================================
echo.
echo [ACIKLAMA] Winget paket yoneticisi ile yuklu programlari gunceller.
echo [GEREKSINIM] Windows 10 1709+ veya Windows 11
echo.
echo Guncellenebilir programlar kontrol ediliyor...
echo Bu islem internet baglantisi gerektirir...
winget upgrade --all --include-unknown
echo.
echo [NOT] Eger winget yuklu degilse:
echo       1. Microsoft Store'dan "App Installer" uygulamasini yukleyin
echo       2. Veya PowerShell'de: winget --version yazarak kontrol edin
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:RESET_HOSTS
cls
echo.
echo ========================================================================
echo                       HOSTS DOSYASINI SIFIRLAMA
echo ========================================================================
echo.
echo [ACIKLAMA] Hosts dosyasini varsayılana sifirlar.
echo [KULLANIM] Web sitesi engelleme sorunlarinda veya hosts dosyasi bozuldugunda.
echo [DIKKAT] Manuel eklediginiz tum kayitlar silinecek!
echo.
echo [UYARI] Eski hosts dosyasi hosts.bak olarak yedeklenecek.
echo.
set /p confirm="Hosts dosyasi sifirlanacak. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo Hosts dosyasi yedeklenip sifirlaniyor...
attrib -r -s -h %windir%\system32\drivers\etc\hosts
ren %windir%\system32\drivers\etc\hosts hosts.bak
echo 127.0.0.1 localhost > %windir%\system32\drivers\etc\hosts
echo ::1 localhost >> %windir%\system32\drivers\etc\hosts
echo.
echo [BASARILI] Hosts dosyasi sifirlandi.
echo [YEDEK] Eski dosya: %windir%\system32\drivers\etc\hosts.bak
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:DISABLE_TELEMETRY
cls
echo.
echo ========================================================================
echo                       TELEMETRIYI KAPATMA
echo ========================================================================
echo.
echo [ACIKLAMA] Microsoft telemetri (veri toplama) servislerini devre disi birakir.
echo [AVANTAJ] - Daha az internet kullanimi
echo           - Daha fazla gizlilik
echo           - Sistem kaynaklarinda azalma
echo.
echo [UYARI] Bu islem Windows Update'i etkileyebilir!
echo [UYARI] Bazi Windows ozellikleri calismayabilir!
echo.
set /p confirm="Telemetri servisleri kapatilacak. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo Servisler durduruluyor ve siliniyor...
sc stop DiagTrack
sc stop dmwappushservice
sc delete DiagTrack
sc delete dmwappushservice
echo.
echo Kayit defteri ayarlaniyor...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
echo.
echo [BASARILI] Telemetri devre disi birakildi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:ULTRA_PERFORMANCE
cls
echo.
echo ========================================================================
echo                    NIHAL PERFORMANS MODU EKLEME
echo ========================================================================
echo.
echo [ACIKLAMA] "Nihai Performans" guc planini sisteme ekler.
echo [AVANTAJ] - Maksimum performans saglar
echo           - Oyun ve profesyonel uygulamalar icin idealdir
echo [DEZAVANTAJ] - Daha fazla guc tuketimi (laptop pil omrunu kısaltır)
echo             - Daha fazla isi ve fan gurultusu
echo.
echo Nihai Performans modu ekleniyor...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo.
echo [BASARILI] Nihai Performans modu eklendi.
echo.
echo Guc secenekleri aciliyor...
echo Lutfen "Nihai Performans"i secin.
start powercfg.cpl
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:DISABLE_HIBERNATE
cls
echo.
echo ========================================================================
echo                    HIBERNATE (HAZIRDA BEKLET) KAPATMA
echo ========================================================================
echo.
echo [ACIKLAMA] Hazirda bekletme ozelligini kapatir ve hiberfil.sys dosyasini siler.
echo [KAZANIM] RAM boyutunuz kadar disk alani acilir (8GB RAM = 8GB disk)
echo [KULLANIM] SSD'li sistemlerde veya disk alani az olanlarda kullanin.
echo.
echo [DIKKAT] Hazirda bekletme ozelligini kullanmayacaksiniz!
echo.
set /p confirm="Hazirda bekletme kapatilacak. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
powercfg -h off
echo.
echo [BASARILI] Hazirda beklet (Hibernate) kapatildi ve diskte yer acildi.
echo [BOYUT] RAM boyutunuz kadar alan acildi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:TOGGLE_EXT
cls
echo.
echo ========================================================================
echo                 DOSYA UZANTILARINI GOSTER/GIZLE
echo ========================================================================
echo.
echo [ACIKLAMA] Dosya uzantilarinin (.txt, .exe, .jpg) gorunurlugunu degistirir.
echo [ONERI] Guvenlik icin uzantilari her zaman gosterin.
echo.
echo [1] Dosya Uzantilarini GOSTER (Tavsiye Edilen)
echo [2] Dosya Uzantilarini GIZLE
echo.
set /p ext_choice="Seciminiz (1/2): "
if "%ext_choice%"=="1" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
    echo.
    echo [BASARILI] Dosya uzantilari GOSTERILDI (Ornek: dosya.txt)
)
if "%ext_choice%"=="2" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 1 /f
    echo.
    echo [BASARILI] Dosya uzantilari GIZLENDI (Ornek: dosya)
)
echo.
echo Explorer yeniden baslatiliyor...
taskkill /f /im explorer.exe >nul
start explorer.exe
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:TOGGLE_HIDDEN
cls
echo.
echo ========================================================================
echo                  GIZLI DOSYALARI GOSTER/GIZLE
echo ========================================================================
echo.
echo [ACIKLAMA] Gizli dosya ve klasorlerin gorunurlugunu degistirir.
echo [KULLANIM] Sistem dosyalarini gormek veya gizlemek icin.
echo.
echo [1] Gizli Dosyalari GOSTER (Gelismis Kullanicilar)
echo [2] Gizli Dosyalari GIZLE (Normal Kullanim)
echo.
set /p hidden_choice="Seciminiz (1/2): "
if "%hidden_choice%"=="1" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 1 /f
    echo.
    echo [BASARILI] Gizli dosyalar GOSTERILDI.
    echo [UYARI] Sistem dosyalarini silmeyin/degistirmeyin!
)
if "%hidden_choice%"=="2" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 2 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 0 /f
    echo.
    echo [BASARILI] Gizli dosyalar GIZLENDI.
)
echo.
echo Explorer yeniden baslatiliyor...
taskkill /f /im explorer.exe >nul
start explorer.exe
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:GPUPDATE
cls
echo.
echo ========================================================================
echo                    GRUP POLITIKALARINI GUNCELLEME
echo ========================================================================
echo.
echo [ACIKLAMA] Yerel ve etki alani grup politika ayarlarini gunceller.
echo [KULLANIM] Politika degisiklikleri hemen uygulansin istendiginde.
echo.
echo Grup politikalari guncelleniyor...
gpupdate /force
echo.
echo [BASARILI] Grup politikalari guncellendi.
echo [NOT] Bazi degisiklikler icin yeniden baslatma gerekebilir.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:: --- AG ---
:NET_FLUSHDNS
cls
echo.
echo ========================================================================
echo                    DNS ONBELLEGINI TEMIZLEME
echo ========================================================================
echo.
echo [ACIKLAMA] DNS onbellegini temizler, web sitesi baglanti sorunlarini cozer.
echo [KULLANIM] Web sitesi acilmadiginda veya yanlis site acildiginda.
echo.
ipconfig /flushdns
echo.
echo [BASARILI] DNS onbellegi temizlendi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:NET_IP_RENEW
cls
echo.
echo ========================================================================
echo                    IP ADRESI YENILEME
echo ========================================================================
echo.
echo [ACIKLAMA] DHCP'den yeni IP adresi alir.
echo [KULLANIM] Ag baglanti sorunlarinda, IP catismalarinda.
echo.
echo [ADIM 1] Mevcut IP adresi serbest birakiliyor...
ipconfig /release
echo.
echo [ADIM 2] Yeni IP adresi talep ediliyor...
ipconfig /renew
echo.
echo [BASARILI] IP adresi yenilendi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:NET_PING
cls
echo.
echo ========================================================================
echo                    PING TESTI (INTERNET BAGLANTISI)
echo ========================================================================
echo.
echo [ACIKLAMA] Google DNS sunucusuna ping atarak internet baglantisi test eder.
echo [SONUC] - Yanit alinirsa: Internet baglantisi var
echo         - Yanit alinmazsa: Internet baglantisi yok
echo.
echo Google DNS (8.8.8.8) sunucusuna ping atiliyor...
ping 8.8.8.8
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:NET_TRACERT
cls
echo.
echo ========================================================================
echo                    TRACERT (ROTA TAKIPI)
echo ========================================================================
echo.
echo [ACIKLAMA] Bir hedefe ulasana kadar gecilen tum yonlendiricileri gosterir.
echo [KULLANIM] Internet yavasliginda veya baglanti kesintilerinde.
echo.
set /p target="Hedef Adres (ornek: google.com): "
echo.
echo %target% adresine rota takibi yapiliyor...
tracert %target%
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:NET_NETSTAT
cls
echo.
echo ========================================================================
echo                    NETSTAT (AG BAGLANTILARI)
echo ========================================================================
echo.
echo [ACIKLAMA] Aktif ag baglantilarini listeler.
echo [KULLANIM] Hangi programin internete baglandigini gormek icin.
echo.
echo Aktif baglantilar listeleniyor...
echo.
echo [1] Tum Aktif Baglantilar
echo [2] Sadece Kurulu (ESTABLISHED) Baglantilar
echo.
set /p netstat_choice="Seciminiz (1/2): "
if "%netstat_choice%"=="1" (
    netstat -an
)
if "%netstat_choice%"=="2" (
    netstat -an | find "ESTABLISHED"
    if %errorlevel% neq 0 echo [BILGI] Su an aktif kurulu baglanti bulunamadi.
)
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:NET_WIFI_PASS
cls
echo.
echo ========================================================================
echo                    KAYITLI WI-FI SIFRELERINI GOSTERME
echo ========================================================================
echo.
echo [ACIKLAMA] Daha once baglanilan Wi-Fi aglarinin sifrelerini gosterir.
echo.
echo --- KAYITLI WI-FI AGLARI ---
netsh wlan show profiles
echo.
set /p wifiname="Sifresini gormek istediginiz Ag Adi (Yukaridan bakin): "
echo.
echo %wifiname% aginin sifresi getiriliyor...
netsh wlan show profile name="%wifiname%" key=clear | findstr /i "Key Content"
echo.
if %errorlevel% neq 0 (
    echo [HATA] Sifre bulunamadi veya ag kayitli degil.
    echo [SEBEPLER]
    echo - Aga hic baglanilmamis
    echo - Sifre kaydedilmemis
    echo - Yonetici izni yetersiz
)
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:NET_RESET_STACK
cls
echo.
echo ========================================================================
echo                    TCP/IP ve WINSOCK SIFIRLAMA
echo ========================================================================
echo.
echo [ACIKLAMA] TCP/IP ve Winsock ayarlarini varsayılana sifirlar.
echo [KULLANIM] Ag baglanti sorunlarinda (internet calisiyor ama browser acilmiyorsa).
echo.
echo [UYARI] Ag baglantisi kesilebilir, yeniden baslatma gerekebilir!
echo.
set /p confirm="TCP/IP ve Winsock sifirlanacak. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
echo Ag ayarlari sifirlaniyor...
netsh int ip reset
netsh winsock reset
echo.
echo [BASARILI] TCP/IP ve Winsock sifirlandi.
echo [ONEMLI] Degisikliklerin etkili olmasi icin BILGISAYARI YENIDEN BASLATIN.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:NET_MAC
cls
echo.
echo ========================================================================
echo                    MAC ADRESINI GOSTERME
echo ========================================================================
echo.
echo [ACIKLAMA] Ag kartlarinin fiziksel (MAC) adreslerini gosterir.
echo [KULLANIM] Ag filtreme veya cihaz tanimlama icin.
echo.
getmac /v
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:NET_ARP
cls
echo.
echo ========================================================================
echo                    ARP TABLOSUNU LISTELEME
echo ========================================================================
echo.
echo [ACIKLAMA] Yerel agdaki IP-MAC adres eslesmelerini gosterir.
echo [KULLANIM] Agdaki cihazlari tespit etmek icin.
echo.
arp -a
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:NET_CHECK_CONN
cls
echo.
echo ========================================================================
echo                    INTERNET BAGLANTI KONTROLU
echo ========================================================================
echo.
echo [ACIKLAMA] Internet baglantisinin olup olmadigini test eder.
echo.
echo Baglanti kontrol ediliyor...
ping -n 2 www.google.com >nul
if %errorlevel% == 0 ( 
    color 2F
    echo [BASARILI] Internet BAGLANTISI VAR.
) else ( 
    color 4F
    echo [HATA] Internet BAGLANTISI YOK.
    echo.
    echo [COZUM ONERILERI]
    echo 1. Modem/router'i yeniden baslatin
    echo 2. Ag kablosunu kontrol edin
    echo 3. Wi-Fi baglantisini kontrol edin
    echo 4. DNS ayarlarini degistirin (8.8.8.8)
    echo 5. [57] TCP/IP sifirlamayi deneyin
)
echo.
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
echo.
echo [UYARI] Kayit defteri duzenleyicisi acildi.
echo [UYARI] Yanlis degisiklikler sisteminizi bozabilir!
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
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
cls
echo.
echo ========================================================================
echo                    GIZLI ADMINISTRATOR HESABINI AKTIF ETME
echo ========================================================================
echo.
echo [ACIKLAMA] Windows'un gizli Administrator hesabini aktif eder.
echo [AVANTAJ] - Tum yetkilere sahip
echo           - UAC (Kullanici Hesabi Denetimi) istemi vermez
echo [DEZAVANTAJ] - Guvenlik riski
echo             - Yanlislikla yapilan degisiklikler sistemi bozabilir
echo.
echo [UYARI] Sadece gerekli oldugunda kullanin, isiniz bitince kapatin!
echo.
set /p confirm="Administrator hesabi AKTIF edilecek. Devam? (E=Evet / H=Hayir): "
if /i "%confirm%" NEQ "E" (
    echo.
    echo [IPTAL] Islem iptal edildi. Menuye donuluyor...
    timeout /t 2 >nul
    goto MENU
)
echo.
net user administrator /active:yes
echo.
echo [BASARILI] Gizli Administrator hesabi AKTIF edildi.
echo [BILGI] Hesap adi: Administrator
echo [BILGI] Varsayilan sifre: YOK (bos)
echo [ONERI] Hemen sifre belirleyin: net user administrator *
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:SEC_ADMIN_OFF
cls
echo.
echo ========================================================================
echo                    GIZLI ADMINISTRATOR HESABINI PASIF ETME
echo ========================================================================
echo.
echo [ACIKLAMA] Windows'un gizli Administrator hesabini tekrar pasif yapar.
echo [ONERI] Guvenlik icin kullanmadiginizda pasif tutun.
echo.
net user administrator /active:no
echo.
echo [BASARILI] Gizli Administrator hesabi PASIF edildi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:SEC_FIREWALL
cls
echo.
echo ========================================================================
echo                    GUVENLIK DUVARINI AC/KAPAT
echo ========================================================================
echo.
echo [ACIKLAMA] Windows Guvenlik Duvarini acar veya kapatir.
echo [ONERI] Guvenlik icin her zaman ACIK tutun.
echo.
echo [1] Guvenlik Duvarini AC (Tavsiye Edilen)
echo [2] Guvenlik Duvarini KAPAT (Sadece Gerekirse)
echo.
set /p fw="Secim: "
if "%fw%"=="1" (
    netsh advfirewall set allprofiles state on
    echo.
    echo [BASARILI] Guvenlik Duvari ACILDI.
)
if "%fw%"=="2" (
    netsh advfirewall set allprofiles state off
    echo.
    echo [UYARI] Guvenlik Duvari KAPATILDI! Guvenlik riski!
    echo [ONERI] Isiniz bitince hemen tekrar acin.
)
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:SEC_LOCK
cls
echo.
echo ========================================================================
echo                    BILGISAYARI KILITLEME
echo ========================================================================
echo.
echo [ACIKLAMA] Bilgisayari kilitleyerek oturum acma ekranina doner.
echo [KULLANIM] Bilgisayarinizi kisa sureligine terk edecekseniz.
echo.
rundll32.exe user32.dll,LockWorkStation
echo.
echo [BILGI] Bilgisayar kilitlendi.
echo [BILGI] Sifrenizi girerek tekrar oturum acabilirsiniz.
echo.
echo [ISLEM TAMAMLANDI] 3 saniye sonra menuye donulecek...
timeout /t 3 >nul
goto MENU

:POWER_SHUTDOWN_TIMER
cls
echo.
echo ========================================================================
echo                    OTOMATIK KAPATMA ZAMANLAYICISI
echo ========================================================================
echo.
echo [ACIKLAMA] Bilgisayarin belirli bir sure sonra otomatik kapanmasini saglar.
echo [KULLANIM] Indirme yaparken, yedek alırken vb. durumlarda.
echo.
echo [UYARI] Onceki zamanlayici varsa iptal edilir!
echo.
set /p time="Kac dakika sonra kapansin?: "
set /a sec=time*60
shutdown -s -t %sec%
echo.
echo [BASARILI] Bilgisayar %time% dakika sonra kapanacak.
echo [IPTAL] Iptal etmek icin [74] numarali secenegi kullanin.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU

:POWER_ABORT
cls
echo.
echo ========================================================================
echo                    KAPATMA ZAMANLAYICISI IPTAL
echo ========================================================================
echo.
echo [ACIKLAMA] Aktif kapatma zamanlayicisini iptal eder.
echo.
shutdown -a
echo.
echo [BASARILI] Kapatma zamanlayicisi iptal edildi.
echo.
echo [ISLEM TAMAMLANDI] Herhangi bir tusa basarak menuye donun...
pause
goto MENU
