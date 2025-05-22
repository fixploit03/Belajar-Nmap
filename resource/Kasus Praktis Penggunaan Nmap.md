# Kasus Praktis Penggunaan Nmap

`Nmap` adalah alat pemindaian jaringan yang sangat serbaguna dan kuat, digunakan dalam berbagai skenario profesional, seperti `audit jaringan perusahaan`, `pengujian layanan web`, `identifikasi kerentanan keamanan`, dan `pengamanan perangkat IoT`. Berikut adalah beberapa contoh penggunaan praktis Nmap yang menunjukkan fleksibilitas dan kemampuan alat ini.

## A. Scan Jaringan Perusahaan
- **Tujuan**: Mengidentifikasi `perangkat aktif`, `port yang terbuka`, dan `layanan yang berjalan` dalam jaringan perusahaan untuk memetakan aset jaringan dan mendeteksi potensi risiko keamanan.
- **Contoh Skenario**: `Administrator` jaringan ingin memetakan semua perangkat di subnet `192.168.100.0/24` untuk keperluan inventarisasi dan analisis keamanan.

**Perintah:**

**1. Deteksi Host Aktif:**

   ```
   nmap -sn 192.168.100.0/24
   ```

   **Penjelasan**: Melakukan `ping scan` untuk menemukan perangkat yang aktif (`host up`) dalam subnet tanpa memindai port. Teknik ini menggunakan `ICMP`, `ARP` (untuk jaringan lokal), atau paket `TCP` untuk mendeteksi keberadaan host.

**2. Pemindaian Port, Layanan, dan Sistem Operasi:**

   ```
   nmap -sS -sV -O -T4 192.168.100.0/24
   ```

   **Penjelasan:**
   - **-sS**: Melakukan `TCP SYN scan` untuk mendeteksi port `TCP` yang terbuka secara cepat dan diam-diam.
   - **-sV**: Mendeteksi versi layanan yang berjalan pada port terbuka (misalnya, versi `Apache` atau `SSH`).
   - **-O**: Mendeteksi sistem operasi dan karakteristik perangkat berdasarkan `TCP/IP stack`.
   - **-T4**: Mengatur kecepatan pemindaian (skala `0-5`, `4` untuk cepat namun stabil).
   - **Target**: Subnet `192.168.100.0/24` (`256` alamat IP).

**Output Penting:**
- `Alamat IP` dan `nama host` (`hostname`) perangkat aktif.
- Layanan aktif (contoh: `SSH` pada port `22`, `HTTP` pada port `80`, `RDP` pada port `3389`).
- Versi layanan (misalnya, `Apache 2.4.41` atau `OpenSSH 8.2`).
- Sistem operasi (contoh: `Linux 5.x`, `Windows Server 2019`).
- Daftar port `TCP` yang terbuka.

**Manfaat:**
- Mengidentifikasi perangkat tak terdaftar (`rogue devices`) yang tidak seharusnya ada di jaringan.
- Membuat inventarisasi aset digital untuk dokumentasi dan manajemen jaringan.
- Mengidentifikasi port `TCP` yang terbuka dan tidak sesuai dengan kebijakan keamanan perusahaan (misalnya, port yang tidak terkait dengan layanan resmi atau yang rentan terhadap eksploitasi).

## B. Identifikasi Kerentanan dengan Nmap Scripting Engine (NSE)
- **Tujuan**: Menggunakan `Nmap Scripting Engine` (`NSE`) untuk mengotomatiskan identifikasi kerentanan keamanan pada sistem atau layanan tertentu dalam jaringan.
- **Contoh Skenario**: `Administrator jaringan` ingin memeriksa apakah server web dengan layanan `HTTPS` (port `443`) di alamat `192.168.100.10` rentan terhadap serangan `SSL POODLE`.

**Perintah:**

**1. Pemeriksaan Kerentanan SSL POODLE:**

   ```
   nmap --script ssl-poodle -p 443 192.168.100.10
   ```

   **Penjelasan**: Script `ssl-poodle` memeriksa apakah server pada port `443` (`HTTPS`) rentan terhadap serangan `SSL POODLE` (`CVE-2014-3566`) dengan menguji dukungan protokol `SSLv3` yang rentan.

**2. Pemeriksaan Kerentanan Umum:**

   ```
   nmap --script vuln -sV 192.168.100.10
   ```

   **Penjelasan**: Opsi `--script vuln` menjalankan semua script dalam kategori `vuln` untuk mendeteksi berbagai kerentanan berdasarkan versi layanan (`-sV`) dan konfigurasi sistem. Ini mencakup script seperti `http-vuln-cve2017-5638` (untuk `Struts`) atau `smb-vuln-ms17-010` (untuk `EternalBlue`).

**Contoh Script NSE Lain:**
- `http-vuln-cve2017-5638`: Memeriksa kerentanan `Apache Struts` (`CVE-2017-5638`).
- `smb-vuln-ms17-010`: Mendeteksi kerentanan `SMB` terkait `WannaCry` (`CVE-2017-0143`).
- `ssl-cert`: Memeriksa validitas dan konfigurasi sertifikat `SSL/TLS`.
- `Catatan`: Gunakan perintah seperti `nmap --script-help <nama-script>` untuk detail setiap script.

**Output Penting:**
- **Nama Kerentanan**: Identifikasi kerentanan spesifik, seperti `SSL POODLE` atau `MS17-010 (EternalBlue)`.
- **Status**: Indikasi apakah sistem rentan (misalnya, `Vulnerable` atau `Not Vulnerable`) berdasarkan hasil script.
- **Detail Tambahan**: Informasi seperti versi layanan (contoh: `OpenSSL 1.0.1`), konfigurasi yang rentan, atau referensi `CVE` (jika tersedia).
- **Catatan**: Beberapa script memberikan saran mitigasi sederhana, tetapi untuk rekomendasi lengkap, analisis manual atau alat tambahan mungkin diperlukan.

**Manfaat:**
- Mengidentifikasi kerentanan keamanan yang terkait dengan layanan atau konfigurasi sistem, termasuk referensi `CVE` tertentu (jika didukung oleh script).
- Memvalidasi keberhasilan patch keamanan dengan memeriksa apakah kerentanan masih ada setelah pembaruan sistem.
- Menyediakan data untuk laporan audit keamanan, membantu organisasi mematuhi standar seperti `ISO 27001` atau `PCI DSS`.

## C. Pengujian Keamanan Web Server
- **Tujuan**: Mengidentifikasi `layanan web`, `direktori` atau `file tersembunyi`, serta potensi kerentanan berbasis web, seperti `SQL Injection`, `Cross-Site Scripting` (`XSS`), atau `Local File Inclusion` (`LFI`), untuk mendukung pengujian penetrasi.
- **Contoh Skenario**: Seorang penguji penetrasi (`pentester`) memiliki target server web dengan alamat IP `192.168.56.101`, di mana port `80` (`HTTP`) dan `443` (`HTTPS`) terdeteksi terbuka, dan ingin mengevaluasi keamanan layanan web tersebut.

**Langkah Praktis:**

**1. Identifikasi Layanan Web:**

   ```
   nmap -sV -p 80,443 192.168.56.101
   ```

   **Penjelasan**: Opsi `-sV` mendeteksi versi layanan yang berjalan pada port `80` (`HTTP`) dan `443` (`HTTPS`), seperti `Apache 2.4.41`, `Nginx 1.18.0`, atau versi spesifik lainnya, untuk menentukan potensi kerentanan berdasarkan versi perangkat lunak.

**2. Analisis Konfigurasi dan Konten Web dengan NSE:**

   ```
   nmap --script http-enum,http-title,http-headers -p 80,443 192.168.56.101
   ```

   **Penjelasan:**
   - `http-enum`: Mencari direktori atau file tersembunyi (misalnya, `/admin`, `/config.php`) menggunakan daftar enumerasi berbasis web.
   - `http-title`: Mengambil judul halaman web untuk mengidentifikasi aplikasi atau CMS (misalnya, `WordPress`, `Joomla`).
   - `http-headers`: Memeriksa header `HTTP` untuk mendeteksi konfigurasi salah, seperti server yang mengungkapkan versi perangkat lunak.

**3. Pemeriksaan Kerentanan Berbasis Web:**

   ```
   nmap --script http-vuln-* -p 80,443 192.168.56.101
   ```

   **Penjelasan**: Menjalankan semua script dalam kategori `http-vuln-*`, seperti `http-vuln-cve2017-5638` (`Apache Struts`) atau `http-sql-injection`, untuk mendeteksi kerentanan web seperti `XSS`, `SQL Injection`, atau `LFI`. Opsi ini memerlukan `-sV` untuk akurasi yang lebih baik:

   ```
   nmap --script http-vuln-* -sV -p 80,443 192.168.56.101
   ```

   **Catatan**: Pemindaian ini memakan waktu, pertimbangkan script spesifik (misalnya, `http-sql-injection`) untuk efisiensi.

**Contoh Script NSE Tambahan:**
- `http-methods`: Memeriksa metode `HTTP` yang diizinkan (misalnya, `TRACE`, `PUT`) yang bisa menunjukkan konfigurasi salah.
- `http-wordpress-enum`: Mengidentifikasi plugin atau tema `WordPress` yang rentan.
- `ssl-cert`: Memeriksa validitas sertifikat `SSL/TLS` pada port `443`.

**Output Penting:**
- **Layanan dan Versi**: Misalnya, `Apache 2.4.41` pada port `80` atau `OpenSSL 1.1.1` pada port `443`.
- **Direktori/File Tersembunyi**: Daftar direktori seperti `/admin` atau file seperti `/backup.sql`.
- **Header HTTP**: Informasi seperti `Server`: `Apache/2.4.41 (Ubuntu)` atau header keamanan yang hilang (misalnya, `X-Frame-Options`).
- **Kerentanan**: Indikasi kerentanan seperti `Vulnerable to CVE-2017-5638` atau `Potensi SQL Injection pada URL tertentu`.
- **Catatan**: Script `NSE` mungkin tidak memberikan eksploitasi langsung, tetapi hasilnya dapat digunakan untuk pengujian lebih lanjut dengan alat seperti `Burp Suite` atau `Metasploit`.

**Manfaat:**
- Mengidentifikasi file atau direktori sensitif yang dapat diakses publik (misalnya, `file konfigurasi` atau `backup`).
- Mendeteksi konfigurasi salah, seperti directory `listing aktif` atau `metode HTTP berbahaya`.
- Menyediakan data awal untuk perencanaan pengujian penetrasi lanjutan, seperti eksploitasi `SQL Injection`, `XSS`, atau `LFI`, menggunakan alat khusus.

## D. Pengujian Keamanan Perangkat IoT dengan Nmap
- **Tujuan**: Mengidentifikasi dan mengevaluasi keamanan perangkat `IoT`, seperti `kamera IP`, `router`, atau `smart TV`, dengan mendeteksi port terbuka, layanan yang rentan, dan konfigurasi tidak aman, seperti kredensial default.
- **Contoh Skenario**: Seorang penguji keamanan (`pentester`) ingin memeriksa perangkat `IoT` di jaringan lokal (misalnya, subnet `192.168.0.0/24` di rumah atau kantor kecil) untuk mengidentifikasi potensi risiko keamanan.

**Langkah Praktis:**

**1. Identifikasi Perangkat Aktif:**

   ```
   nmap -sn 192.168.0.0/24
   ```

   **Penjelasan**: Melakukan `ping scan` untuk menemukan perangkat aktif dalam subnet menggunakan `ARP` (untuk jaringan lokal), `ICMP`, atau paket `TCP`. Ini membantu mengidentifikasi perangkat `IoT` seperti `kamera IP`, `router`, atau `smart TV`.

**2. Identifikasi Port, Layanan, dan Sistem Operasi:**

   ```
   nmap -sS -sV -O -p- 192.168.0.100
   ```

   **Penjelasan:**
   - **-sS**: Melakukan `TCP SYN scan` untuk mendeteksi port `TCP` terbuka secara cepat dan diam-diam.
   - **-sV**: Mengidentifikasi versi layanan (misalnya, `Telnet`, `HTTP`, atau `RTSP`) yang berjalan pada port.
   - **-O**: Mencoba mendeteksi `sistem operasi` atau `firmware` perangkat berdasarkan `TCP/IP stack`.
   - **-p-**: Memindai semua port (`1-65535`) untuk memastikan tidak ada port `IoT` yang terlewat (misalnya, `23` untuk `Telnet`, `554` untuk `RTSP`).
   - **Target**: Alamat IP spesifik perangkat `IoT` (contoh: `192.168.0.100`).


**3. Analisis Keamanan dengan Script NSE:**

   ```
   nmap --script default,safe -p 23,80,554 192.168.0.100
   ```

   **Penjelasan:**
   - `--script default,safe`: Menjalankan script `NSE` dalam kategori `default` (script aman dan umum seperti `http-title`) dan `safe (script yang tidak mengganggu sistem).
   - Port `23` (`Telnet`), `80` (`HTTP`), dan `554` (`RTSP`) dipilih karena sering digunakan pada perangkat `IoT` seperti `kamera IP` atau `router`.
   - Contoh script relevan: `http-title` (mengambil judul halaman web), `rtsp-methods` (memeriksa metode `RTSP`), atau `telnet-encryption` (memeriksa dukungan enkripsi `Telnet`).

**4. Pemeriksaan Kredensial Default:**

   ```
   nmap --script telnet-brute,http-brute -p 23,80 192.168.0.100
   ```
        
   **Penjelasan:**
   - `telnet-brute`: Mencoba kombinasi nama pengguna dan kata sandi default (misalnya, `admin:admin`) pada port `23` (`Telnet`).
   - `http-brute`: Mencoba kredensial default pada antarmuka web `HTTP` (port `80`).
   - **Peringatan**: Pengujian `brute-force` hanya boleh dilakukan dengan izin eksplisit dari pemilik sistem untuk menghindari pelanggaran hukum.

**Contoh Script NSE Tambahan untuk IoT:**
- `http-iot-info`: Mengidentifikasi informasi spesifik perangkat `IoT` melalui antarmuka web.
- `rtsp-url-brute`: Mencoba menebak `URL RTSP` pada `kamera IP`.
- `upnp-info`: Mengumpulkan informasi tentang perangkat `IoT` yang menggunakan `UPnP`.

**Output Penting:**
- **Perangkat Aktif**: `Daftar IP` dan `hostname` perangkat `IoT` (misalnya, `192.168.0.100` - `Camera-IP`).
- **Port dan Layanan**: Port terbuka (misalnya, `23/tcp` open `telnet`, `80/tcp` open `http`, `554/tcp` open `rtsp`) beserta versi layanan (contoh: `lighttpd 1.4.45`).
- **Sistem Operasi**: Informasi seperti `Linux 2.6.x` atau `embedded firmware` (jika terdeteksi).
- **Hasil Script NSE**: Misalnya, `http-title: Camera Web Interface` atau `telnet-brute: Valid credentials found: admin:admin`.
- **Kerentanan**: Indikasi layanan rentan (misalnya, `Telnet` tanpa enkripsi) atau `firmware` usang berdasarkan versi layanan.

**Manfaat:**
- Mengidentifikasi kredensial default (misalnya, `admin:admin`) yang meningkatkan risiko akses tidak sah.
- Mendeteksi port tidak aman, seperti Telnet (port `23`) atau `RTSP` (port `554`), yang sering digunakan pada perangkat `IoT`.
- Mengindikasikan potensi kerentanan `firmware` berdasarkan versi layanan yang usang, memungkinkan pembaruan atau mitigasi.
- Menyediakan data untuk laporan audit keamanan `IoT`, mendukung kepatuhan terhadap standar keamanan.

## Kesimpulan

`Nmap` bukan hanya untuk `scan biasa`. Ia bisa jadi alat yang sangat strategis dalam:
- Audit skala `enterprise`
- Deteksi kerentanan spesifik
- Analisis keamanan `web`
- Keamanan perangkat `IoT`
