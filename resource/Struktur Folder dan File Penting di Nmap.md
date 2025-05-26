# Struktur Folder dan File Penting di Nmap

## A. Pengantar

`Nmap` bukan hanya sebuah `executable nmap`, tetapi juga dilengkapi dengan banyak file pendukung seperti `skrip`, `database port`, dan `pustaka internal` yang memperkaya fungsinya. Memahami struktur folder dan file penting di `Nmap` akan membantu dalam:
- Modifikasi skrip `Nmap Scripting Engine (NSE)`
- Debugging hasil scan
- Pembuatan modul kustom

## B. Lokasi Instalasi Default (Per OS)

| Sistem Operasi	| Lokasi Umum Instalasi |
|:--:|:--:|
| `Linux (APT/DNF)`	| `/usr/bin/nmap`, `/usr/share/nmap` |
| `Windows`	| `C:\Program Files (x86)\Nmap\` |
| `macOS (Homebrew)`	| `/opt/homebrew/bin/nmap` dan `/opt/homebrew/share/nmap` |

Gunakan perintah `which nmap` atau `where nmap` untuk menemukan lokasi binari `Nmap`.

## C. Struktur Folder Utama (Linux/macOS)

```
/usr/share/nmap/
│
├── nmap-services
├── nmap-protocols
├── nmap-rpc
├── nmap-mac-prefixes
├── nmap-os-db
├── nmap-payloads
├── nse_main.lua
├── scripts/
│   ├── http-enum.nse
│   ├── smb-vuln-ms17-010.nse
│   └── ...
└── scripts/script.db
```

## D. Penjelasan File dan Folder Penting

```
/usr/bin/nmap
```

Executable utama `Nmap (CLI)` yang menjalankan semua proses scanning.

```
/usr/share/nmap/
```

Berisi semua data dan konfigurasi penting. Berikut penjelasan tiap file:

| File/Folder	|Fungsi|
|:--:|:--:|
| `nmap-services` | Daftar port dan protokol standar yang digunakan untuk pemetaan port. |
| `nmap-protocols` | Daftar protokol `IP` (misalnya `TCP=6`, `UDP=17`) yang dikenali oleh `Nmap`. |
| `nmap-os-db` | Database `fingerprint OS` untuk fitur `OS detection`. |
| `nmap-payloads` | Payload default untuk membantu mendeteksi layanan pada port `UDP`. |
| `nmap-mac-prefixes` | Data vendor `MAC address` untuk identifikasi perangkat berdasarkan `OUI`. |
| `scripts/` | Folder semua script `NSE` yang digunakan untuk scanning lanjutan. |
| `scripts/script.db` | Index script yang digunakan `Nmap` untuk menentukan kategori dan dependensi. |
| `nmap-rpc` | Database `RPC` yang digunakan saat mendeteksi layanan `RPC`. |
| `nse_main.lua` | Entry point untuk menjalankan `Nmap Scripting Engine`. |

## E. File Penting di Folder `scripts/`

Di sinilah letak kekuatan `Nmap Scripting Engine (NSE)`. File dengan ekstensi `.nse` adalah script `Lua` yang bisa:
- Melakukan eksploitasi ringan
- Deteksi `CVE`
- Brute force login
- Cek status `SSL`, `DNS`, `HTTP`, `SMB`, `dll`.

**Contoh file populer:**

| Script NSE	|Fungsi|
|:--:|:--:|
| `http-enum.nse` | Enum halaman direktori `HTTP`. |
| `smb-vuln-ms17-010.nse` | Cek kerentanan `EternalBlue (SMB)`. |
| `ftp-anon.nse` | Cek akses `anonim` pada `FTP server`. |
| `ssh-brute.nse` | Brute force login `SSH`. |

## F. Menambahkan atau Mengedit Script NSE

Untuk membuat script sendiri atau memodifikasi script yang ada:

1. Simpan script di:

   ```
   /usr/share/nmap/scripts/
   ```

2. Jalankan perintah rebuild database:

   ```
   sudo nmap --script-updatedb
   ```

3. Jalankan script:

   ```
   sudo nmap --script=namascript.nse target.com
   ```

## G. Cek Lokasi Folder via CLI

Untuk melihat lokasi direktori skrip dan konfigurasi secara dinamis:

```
nmap --script-help
```

Atau:

```
locate nmap | grep script
```

## H. Catatan untuk Pengguna Windows

Pada `Windows`, struktur mirip tetapi semua berada di dalam:

```
C:\Program Files (x86)\Nmap\
│
├── nmap.exe
├── zenmap.exe
├── scripts\
├── nmap-services
├── ...
```

Gunakan `PowerShell` atau `CMD` untuk menelusuri isi folder dan mencoba perintah `nmap.exe`.

## Kesimpulan

Memahami struktur file dan folder `Nmap` memberi kendali lebih terhadap perilaku scanning. Hal ini sangat berguna saat:
- Membuat atau memodifikasi script `NSE`
- Melacak hasil `OS fingerprint`
- Menyesuaikan payload scanning
- Mengembangkan modul scanning otomatis

Pengetahuan ini menjadi pondasi penting untuk melakukan `advanced penetration testing` menggunakan `Nmap`.
