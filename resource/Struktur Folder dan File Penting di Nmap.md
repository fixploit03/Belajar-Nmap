# Struktur Folder dan File Penting di Nmap

`Nmap` (`Network Mapper`) adalah alat `open-source` untuk `pemindaian jaringan` dan `analisis keamanan`. Struktur folder dan file penting di `Nmap` bervariasi tergantung pada sistem operasi (`Linux`, `Windows`, `macOS`). Berikut adalah penjelasan tentang `lokasi file`, `fungsi`, dan `perbedaan antar platform`.

## A. Ikhtisar Umum

`Nmap` menyimpan berbagai `file konfigurasi`, `script`, dan `database` yang digunakan untuk pemindaian jaringan. File-file ini mencakup:
- `nmap executable`: File `biner` utama untuk menjalankan `Nmap`.
- `nmap-services`: Daftar port dan layanan yang dikenal.
- `nmap-os-db`: Database untuk deteksi sistem operasi.
- `nmap-payloads`: Payload untuk pengujian protokol.
- `nmap-protocols`: Daftar protokol jaringan.
- `nmap-rpc`: Daftar nomor `RPC`.
- `nmap-mac-prefixes`: Daftar prefiks `MAC` untuk vendor perangkat.
- `NSE Scripts`: Script untuk `Nmap Scripting Engine` (`NSE`).
- `nse_main.lua`: File utama untuk menjalankan `NSE`.

Lokasi file-file ini tergantung pada sistem operasi dan metode instalasi (misalnya, melalui `package manager`, `kompilasi dari source`, atau `installer resmi`).

## B. Struktur Folder di Linux

Di `Linux`, `Nmap` biasanya diinstal melalui `package manager` (seperti `apt`, `yum`, atau `dnf`) atau dikompilasi dari `source`. Lokasi file bergantung pada metode instalasi.

**Lokasi Default**

Instalasi via `Package Manager` (misalnya, `sudo apt install nmap`):

- **Executable**: `/usr/bin/nmap` atau `/usr/local/bin/nmap`
- **File `Konfigurasi` dan `Database`**:
  - `/usr/share/nmap/` atau `/usr/local/share/nmap/`
  - **File penting:**
    - `nmap-services`
    - `nmap-os-db`
    - `nmap-payloads`
    - `nmap-protocols`
    - `nmap-rpc`
    - `nmap-mac-prefixes`
- **NSE Scripts**: `/usr/share/nmap/scripts/` atau `/usr/local/share/nmap/scripts/`
- `nse_main.lua:` `/usr/share/nmap/nselib/`
- **File Konfigurasi Pengguna (opsional)**: `~/.nmap/` (dibuat jika pengguna menjalankan `Nmap` dengan opsi tertentu).

**Instalasi dari Source:**
- Jika dikompilasi dari `source`, file biasanya berada di `/usr/local/` kecuali dikonfigurasi lain saat kompilasi (`./configure --prefix=`).
- **Contoh**: `/usr/local/bin/nmap`, `/usr/local/share/nmap/`.

**Catatan**
- File di `/usr/share/nmap/` bersifat `read-only` untuk pengguna biasa. Untuk memodifikasi, gunakan hak akses `root` (`sudo`).
- Pengguna dapat membuat file konfigurasi khusus di `~/.nmap/` untuk menyimpan pengaturan atau script tambahan.

## C. Struktur Folder di Windows

Di `Windows`, `Nmap` diinstal melalui installer resmi dari situs `Nmap` (`nmap.org`). Installer menempatkan semua file di direktori tertentu.

**Lokasi Default**

- **Instalasi Default:**
  - **Executable**: `C:\Program Files (x86)\Nmap\nmap.exe` (untuk sistem `64-bit`) atau `C:\Program Files\Nmap\nmap.exe` (untuk sistem `32-bit`).
  - **File Konfigurasi dan Database**:
    - `C:\Program Files (x86)\Nmap\`
    - **File penting**:
      - `nmap-services`
      - `nmap-os-db`
      - `nmap-payloads`
      - `nmap-protocols`
      - `nmap-rpc`
      - `nmap-mac-prefixes`
- **NSE Scripts**: `C:\Program Files (x86)\Nmap\scripts\`
- `nse_main.lua`: `C:\Program Files (x86)\Nmap\nselib\`
- **File Konfigurasi Pengguna (opsional)**: `%APPDATA%\nmap\` (misalnya, `C:\Users\<Username>\AppData\Roaming\nmap\`).

**Catatan**
- Untuk menjalankan `Nmap` di `Windows`, pastikan Anda membuka `Command Prompt` atau `PowerShell` sebagai `Administrator` untuk fitur tertentu (misalnya, `pemindaian raw packet`).
- File seperti `nmap.exe` dapat dipindahkan ke direktori lain untuk portabilitas, tetapi pastikan semua file pendukung (seperti `nmap-services` dan `script NSE`) ikut dipindahkan.
- `Windows` tidak mendukung beberapa fitur `Nmap` (misalnya, beberapa jenis pemindaian `raw`) tanpa driver seperti `Npcap`.

# D. Struktur Folder di macOS

Di `macOS`, `Nmap` biasanya diinstal melalui `package manager` seperti `Homebrew` (`brew install nmap`) atau dengan mengunduh `binary` dari situs resmi `Nmap`.

**Lokasi Default**

- **Instalasi via Homebrew:**
  - **Executable**: `/usr/local/bin/nmap` atau `/opt/homebrew/bin/nmap` (tergantung versi `Homebrew` dan `arsitektur Mac`, seperti `Intel` atau `Apple Silicon`).
  - **File Konfigurasi dan Database**:
    - `/usr/local/share/nmap/` atau `/opt/homebrew/share/nmap/`
    - **File penting**:
      - `nmap-services`
      - `nmap-os-db`
      - `nmap-payloads`
      - `nmap-protocols`
      - `nmap-rpc`
      - `nmap-mac-prefixes`
  - **NSE Scripts**: `/usr/local/share/nmap/scripts/` atau `/opt/homebrew/share/nmap/scripts/`
  - `nse_main.lua`: `/usr/local/share/nmap/nselib/` atau `/opt/homebrew/share/nmap/nselib/`
  - **File Konfigurasi Pengguna (opsional)**: `~/.nmap/`.
- **Instalasi dari Binary Resmi**:
  - Jika diinstal dari `binary`, file biasanya ditempatkan di `/usr/local/bin/` dan `/usr/local/share/nmap/`.
  - Struktur mirip dengan instalasi `Homebrew`.

**Catatan**
- `Homebrew` adalah metode paling umum untuk menginstal `Nmap` di `macOS`. Pastikan `Homebrew` diperbarui (`brew update`) sebelum instalasi.
- Untuk fitur pemindaian `raw`, `macOS` memerlukan izin `root` (`sudo`) karena pembatasan keamanan sistem.

# E. Fungsi File Penting

Berikut adalah fungsi utama dari file-file penting di `Nmap`:

- `nmap-services`: Berisi daftar port `TCP/UDP` dan layanan terkait (misalnya, port `80` untuk `HTTP`). Digunakan untuk mengidentifikasi layanan saat pemindaian.
- `nmap-os-db`: Database sidik jari (`fingerprint`) sistem operasi untuk mendeteksi `OS` dan `versi perangkat`.
- `nmap-payloads`: Berisi payload untuk menguji respons protokol tertentu.
- `nmap-protocols`: Daftar nomor protokol `IP` (misalnya, `TCP`, `UDP`, `ICMP`).
- `nmap-rpc`: Daftar nomor `RPC` untuk mengidentifikasi layanan `RPC`.
- `nmap-mac-prefixes`: Daftar prefiks `MAC address` untuk mengidentifikasi `vendor perangkat`.
- `NSE Scripts`: Script `Lua` untuk memperluas fungsi `Nmap`, seperti deteksi `kerentanan` atau `enumerasi layanan`.
- `nse_main.lua`: File inti untuk menjalankan `Nmap Scripting Engine`.

## F. Perbedaan Antar Platform

| Aspek | Linux | Windows | macOS |
|:--:|:--:|:--:|:--:|
| **Lokasi Executable** | `/usr/bin/nmap` atau `/usr/local/bin/nmap` | `C:\Program Files (x86)\Nmap\nmap.exe` | `/usr/local/bin/nmap` atau `/opt/homebrew/bin/nmap` |
| **Lokasi File Database** | `/usr/share/nmap/` atau `/usr/local/share/nmap/` | `C:\Program Files (x86)\Nmap\` | `/usr/local/share/nmap/` atau `/opt/homebrew/share/nmap/` |
| **File Konfigurasi Pengguna** | `~/.nmap/` | `%APPDATA%\nmap\` | `~/.nmap/` |
| **Metode Instalasi** | `Package manager`, `source` | `Installer resmi` | `Homebrew`, `binary resmi` |
| **Izin Root** | Diperlukan untuk fitur `raw packet` | Diperlukan untuk fitur `raw packet` (dengan `Npcap`) | Diperlukan untuk fitur `raw packet` |
| **Driver Tambahan** | Tidak diperlukan | `Npcap` untuk pemindaian `raw` | Tidak diperlukan |

## G. Tips Pengelolaan File
- **Memperbarui Database**: Jalankan `nmap --script-updatedb` untuk memperbarui `script NSE` dan `nmap --versiondb-update` (jika tersedia) untuk memperbarui database seperti `nmap-services` dan `nmap-os-db`.
- **Menambahkan Script Kustom**: Tambahkan script Lua kustom ke direktori `scripts/` atau `~/.nmap/scripts/`.
- **Backup File Konfigurasi**: Jika memodifikasi file seperti `nmap-services`, buat salinan cadangan untuk menghindari kehilangan data.
- **Portabilitas di Windows**: Untuk penggunaan portabel, salin seluruh folder `Nmap` ke drive eksternal, tetapi pastikan `Npcap` diinstal jika diperlukan.

## H. Contoh Penggunaan

Untuk memverifikasi lokasi file di sistem Anda:

- **Linux/macOS:**
  
  ```
  which nmap
  ls -l /usr/share/nmap/
  ```

- **Windows:**
  
  ```
  dir "C:\Program Files (x86)\Nmap\"
  ```

Untuk menjalankan `Nmap` dengan `script NSE`:

```
nmap --script <nama_script> <target>
```

## Kesimpulan
Memahami struktur folder dan file penting di `Nmap` sangat penting untuk `konfigurasi`, `penyesuaian`, dan `pemecahan masalah`. `Linux` dan `macOS` memiliki struktur serupa karena basis `Unix`, sementara `Windows` menggunakan pendekatan berbasis `installer` dengan direktori terpusat. Pastikan untuk memeriksa izin akses dan driver tambahan (seperti `Npcap` di `Windows`) untuk memastikan `Nmap` berfungsi optimal.
