# Sejarah Nmap

## A. Sejarah Awal Nmap
- **Pencipta**: [Gordon Lyon](https://en.wikipedia.org/wiki/Gordon_Lyon), yang dikenal juga dengan julukan `Fyodor`.
- **Tahun Rilis Pertama**: `1997`
- **Latar Belakang Pembuatan**:
   - Pada tahun `1990-an`, alat pemindai jaringan yang ada masih sangat terbatas, lambat, dan sebagian besar bersifat komersial atau proprietary.
   - `Fyodor` melihat kebutuhan akan alat pemindai jaringan yang `cepat`, `efisien`, dan `dapat diakses oleh siapa saja` (`open-source`).
   - Dengan tujuan tersebut, `Fyodor` mengembangkan `Nmap` sebagai software `open-source` yang mudah digunakan dan dapat diandalkan.
 
## B. Versi Awal dan Fitur Dasar Nmap
- Versi awal `Nmap` fokus pada dua fungsi utama:
   1. `Ping Sweep`: Mengecek komputer atau perangkat mana saja yang aktif di jaringan.
   2. `Port Scanning`: Mengetahui port mana saja yang terbuka di sebuah host.
- `Nmap` hanya berbasis `command-line interface` (`CLI`) dan memiliki fitur yang relatif sederhana.
- Dengan `Nmap`, `sysadmin` dan `pentester` bisa melakukan pemindaian dasar untuk mengamankan jaringan.

## C. Perkembangan Fitur Nmap

**Tahun 2000-an Awal**
   - `Nmap` mulai mengembangkan teknik scanning yang lebih kompleks dan efektif, misalnya:
     - `SYN Scan` (Stealth Scan): Metode scanning yang cepat dan sulit terdeteksi.
     - `TCP Connect Scan`: Cara scanning standar menggunakan koneksi `TCP` penuh.
   - Penambahan kemampuan:
     - Deteksi Sistem Operasi (`OS Detection`): `Nmap` bisa menganalisa paket dan mencoba mengidentifikasi `OS target`.
     - Deteksi Versi Layanan (`Version Detection`): Mengetahui versi aplikasi yang berjalan pada port terbuka.

**Pertengahan 2000-an**
   - Pengenalan `Nmap Scripting Engine` (`NSE`) yang merupakan fitur `revolusioner`:
      - Mengizinkan pengguna menjalankan script otomatis berbasis bahasa `Lua`.
      - Script-script ini bisa digunakan untuk mengotomatisasi `audit`, `deteksi kerentanan`, dan `pengumpulan informasi` yang lebih mendalam.
   - Rilis `Nmap` versi `3` dan `4` membawa peningkatan performa dan stabilitas.
   - Diperkenalkan pula `GUI` bernama `NmapFE`, yang kemudian berkembang menjadi `Zenmap` agar pengguna yang kurang nyaman `CLI` tetap bisa menggunakan `Nmap` dengan mudah.

## D. Nmap Scripting Engine (NSE)
- Diperkenalkan pada tahun `2006`.
- Memberi kekuatan ekstra bagi `Nmap`, membuatnya bukan sekadar pemindai port, tapi juga platform skrip untuk berbagai jenis pemindaian dan tes keamanan.
- Contoh kegunaan `NSE`:
   - Deteksi kerentanan pada layanan tertentu.
   - Menjalankan exploit ringan.
   - Mendeteksi `malware` atau `backdoor`.
   - Mengumpulkan informasi `login yang lemah` atau `konfigurasi buruk`.

## E. Nmap Saat Ini
- `Nmap` terus dikembangkan dengan pembaruan rutin dan dukungan komunitas yang besar.
- Mendukung banyak platform seperti `Windows`, `Linux`, `macOS`, `BSD`, dan `lainnya`.
- Fitur modern `Nmap` meliputi:
   - Pemindaian `IPv6`.
   - Deteksi `firewall` dan `evasion techniques`.
   - Script scripting lebih kompleks dan modul tambahan.
   - Output format yang beragam: `XML`, `grepable`, `JSON`, dan `lain-lain`.
- `Zenmap` sebagai `GUI` resmi memberikan kemudahan bagi pengguna yang lebih suka tampilan grafis.
- `Nmap` juga sering digunakan dalam:
   - Penetration testing (`pentest`).
   - Manajemen jaringan.
   - Deteksi dan mitigasi ancaman keamanan.
   - Pendidikan dan riset keamanan siber.
 
## F. Dampak dan Pengaruh Nmap
- **Standar de facto**: `Nmap` menjadi alat pemindai jaringan yang paling dikenal dan banyak dipakai di dunia keamanan.
- **Open-source**: Membantu mempopulerkan konsep `open-source` di bidang keamanan jaringan.
- **Komunitas aktif**: Banyak pengguna dan developer yang berkontribusi membuat `script NSE` dan fitur baru.
- **Inspirasi**: Menjadi inspirasi bagi banyak software keamanan lainnya dan alat audit jaringan.
- **Pendidikan**: Digunakan secara luas untuk mengajarkan konsep jaringan dan keamanan di perguruan tinggi dan pelatihan profesional.
- **Etika**: Membantu proses audit dan testing keamanan dengan cara yang legal dan terstruktur.

## Kesimpulan
- `Nmap` dibuat oleh `Fyodor` pada `1997` untuk mengisi kebutuhan alat pemindai jaringan yang `cepat`, `efisien`, dan `gratis`.
- Dari versi sederhana, `Nmap` berkembang menjadi tool yang sangat powerful dengan berbagai fitur canggih.
- Pengenalan `NSE` menambah dimensi baru pada `Nmap`, menjadikannya platform audit keamanan yang fleksibel.
- Saat ini `Nmap` adalah salah satu alat paling penting dan terpercaya dalam dunia keamanan jaringan.
- Penggunaan `Nmap` mendorong praktik keamanan yang lebih baik dan lebih luas di kalangan `profesional IT`.
