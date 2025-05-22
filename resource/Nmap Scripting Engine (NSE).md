# Nmap Scripting Engine (NSE)

## A. Apa Itu NSE?

`Nmap Scripting Engine` (`NSE`) adalah fitur canggih dari `Nmap` yang memungkinkan pengguna menjalankan script berbasis `Lua` untuk memperluas kemampuan pemindaian jaringan. `NSE` memungkinkan otomatisasi tugas-tugas kompleks, memberikan fleksibilitas untuk analisis mendalam dan pengujian keamanan. Fungsi utama `NSE` meliputi:
- **Identifikasi Layanan Mendalam**: Mendeteksi versi dan konfigurasi layanan secara rinci (misalnya, versi `Apache` atau `OpenSSH`).
- **Identifikasi Kerentanan**: Memeriksa kerentanan keamanan berdasarkan versi layanan atau konfigurasi (misalnya, `CVE` tertentu).
- **Brute Force Kredensial**: Menguji kredensial default atau lemah pada layanan seperti `SSH`, `HTTP`, atau `FTP`.
- **Deteksi Malware**: Mengidentifikasi indikasi `malware` pada layanan atau sistem.
- **Pengumpulan Informasi Tambahan**: Mengambil data seperti sertifikat `SSL`, `header HTTP`, atau `subdomain DNS`.

`NSE` menggunakan bahasa pemrograman `Lua`, yang ringan, cepat, dan mendukung penulisan script kustom untuk kebutuhan spesifik.

## B. Cara Menggunakan Script NSE

Berikut adalah panduan untuk menggunakan `script NSE` dalam pemindaian `Nmap`:

**1. Dasar Penggunaan Script**

   Format umum untuk menjalankan `script NSE`:

   ```
   nmap --script <nama_script> <target>
   ```

   **Penjelasan**:

   `--script <nama_script>`: Menentukan nama `script NSE` atau kategori script yang akan dijalankan.
   `<target>`: `Alamat IP`, `rentang IP`, atau `hostname target` (contoh: `192.168.1.10`, `192.168.1.0/24`).

   **Contoh:**

   Mengambil judul halaman web dari server `HTTP`:

   ```
   nmap --script http-title -p 80 192.168.1.10
   ```

   **Output**: Menampilkan judul halaman `HTML` (misalnya, `Welcome to Apache`).

   Menjalankan semua script dalam kategori `vuln` untuk mendeteksi kerentanan:

   ```
   nmap -sV --script vuln 192.168.1.10
   ```

   **Penjelasan**: Opsi `-sV` mendeteksi versi layanan untuk meningkatkan akurasi `script vuln`, yang memeriksa kerentanan seperti `CVE-2017-5638` (`Apache Struts`).

**2. Menjalankan Banyak Script**

   Untuk menjalankan beberapa script sekaligus, gunakan tanda koma atau pola wildcard:

   ```
   nmap --script "http-*,ftp-*" -p 80,21 192.168.1.10
   ```

   **Penjelasan**: Menjalankan semua script dengan awalan `http-` (misalnya, `http-title`, `http-headers`) dan `ftp-` (misalnya, `ftp-anon`, `ftp-brute`) pada port `80` (`HTTP`) dan `21` (`FTP`).

**3. Menjalankan Script Berdasarkan Kategori**

   `Nmap` mengelompokkan script ke dalam kategori seperti `default`, `safe`, `vuln`, atau `intrusive`. Contoh:

   ```
   nmap --script default,safe -p- 192.168.1.10
   ```

   **Penjelasan:**
   - `default`: Script aman yang dijalankan secara otomatis dengan opsi `-sC` (misalnya, `http-title`, `ssl-cert`).
   - `safe`: Script yang tidak mengganggu sistem target.
   - `-p-`: Memindai semua port (`1-65535`) untuk memastikan tidak ada layanan yang terlewat.

   **Catatan:**
   - Gunakan `nmap --script-help <nama_script>` untuk melihat dokumentasi script tertentu.
   - Perbarui database script dengan `nmap --script-updatedb` untuk memastikan script terbaru tersedia.


## C. Contoh Script NSE Populer

Berikut adalah beberapa script `NSE` yang sering digunakan beserta fungsinya:

| Script | Fungsi |
|:--:|:--:|
| `http-title` | Menampilkan judul halaman `HTML` dari layanan `HTTP` (contoh: `WordPress Blog`). |
| `http-vuln-cve2006-3392` | Memeriksa kerentanan eksekusi kode jarak jauh pada `Webmin` (`CVE-2006-3392`). |
| `ftp-anon` | Mengecek apakah server `FTP` mengizinkan login `anonim` (`anonymous:anonymous`). |
| `ssh-brute` | Mencoba kombinasi kredensial default atau lemah pada layanan `SSH` (port `22`). |
| `smb-enum-shares` | Mengidentifikasi folder bersama (`shares`) pada server `SMB` (port `445`). |
| `smb-os-discovery` | Mengumpulkan informasi sistem operasi melalui protokol `SMB`. |
| `dns-brute` | Mencoba menebak subdomain `DNS` (misalnya, `sub.domain.com`) melalui `brute force`. |
| `ssl-cert` | Mengambil informasi sertifikat `SSL/TLS`, seperti tanggal kedaluwarsa atau issuer. |
| `vulners` | Memeriksa kerentanan berdasarkan database `Vulners`, menggunakan versi layanan (memerlukan `-sV`). |

**Lokasi Script:**
- Script `NSE` tersimpan di direktori `/usr/share/nmap/scripts/` pada sistem berbasis `Unix`.
- Untuk melihat daftar script, gunakan perintah:

```
ls /usr/share/nmap/scripts/
```

**Contoh Penggunaan Script:**

Memeriksa sertifikat `SSL` pada `HTTPS`:

```
nmap --script ssl-cert -p 443 192.168.1.10
```

**Output**: Informasi sertifikat seperti `issuer`, `validitas`, dan `algoritma enkripsi`.

Mengidentifikasi kerentanan menggunakan `vulners`:

```
nmap -sV --script vulners -p 80,443 192.168.1.10
```

**Output**: Daftar `CVE` yang relevan berdasarkan versi layanan (misalnya, `Apache 2.4.41 vulnerable to CVE-2021-41773`).

## Kesimpulan

`Nmap Scripting Engine` (`NSE`) adalah salah satu fitur utama yang menjadikan `Nmap` alat yang sangat fleksibel untuk pengujian keamanan jaringan. Dengan `NSE`, pengguna dapat:
- Melakukan analisis mendalam terhadap layanan jaringan, seperti `mengidentifikasi versi perangkat lunak` atau `konfigurasi`.
- Mengidentifikasi kerentanan keamanan, termasuk referensi `CVE`, untuk mendukung audit keamanan.
- Mengotomatiskan tugas-tugas kompleks dengan menulis script kustom menggunakan `Lua`.
- Menyediakan data untuk laporan keamanan atau pengujian penetrasi lanjutan.

**Peringatan Etika:**
- Penggunaan `script NSE`, terutama untuk `brute force` (misalnya, `ssh-brute`, `http-brute`), hanya boleh dilakukan dengan izin eksplisit dari pemilik sistem untuk menghindari pelanggaran hukum.
- Pastikan untuk memperbarui database script secara berkala dengan `nmap --script-updatedb` untuk mendapatkan deteksi kerentanan terbaru.
