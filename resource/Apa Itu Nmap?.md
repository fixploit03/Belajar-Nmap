# A. Apa Itu Nmap?

[Nmap](https://nmap.org/), singkatan dari `Network Mapper`, adalah sebuah tool open-source yang digunakan untuk memetakan jaringan dan melakukan pemindaian (`scanning`) terhadap `host`, `port`, serta `layanan` yang berjalan di dalam sebuah jaringan komputer. Nmap sering digunakan oleh `administrator jaringan`, `profesional keamanan siber`, dan `penetration tester` untuk:
- Mengidentifikasi perangkat yang aktif (`live hosts`) di jaringan
- Mengetahui port mana saja yang terbuka pada perangkat tersebut
- Mendeteksi `layanan` dan `versi software` yang berjalan pada port terbuka
- Menganalisa sistem operasi (`OS`) yang digunakan perangkat target
- Mencari celah keamanan dan kerentanan pada target

## B. Fungsi Utama Nmap
1. **Port Scanning**  
    `Nmap` dapat memindai port `TCP` dan `UDP` pada sebuah host untuk mengetahui layanan apa saja yang berjalan dan terbuka. Port yang terbuka bisa menjadi titik masuk bagi penyerang jika tidak diamankan dengan baik.
2. **Host Discovery (Ping Sweep)**  
    Dengan fitur ini, `Nmap` dapat menentukan host mana saja yang aktif dan merespon di dalam sebuah jaringan sebelum melakukan scan port.
3. **Service Version Detection**  
    `Nmap` tidak hanya memindai port terbuka, tapi juga dapat mengidentifikasi aplikasi dan versi layanan yang berjalan pada port tersebut. Contohnya: `web server Apache` versi `2.4.41`.
4. **Operating System Detection**  
    `Nmap` bisa melakukan `fingerprinting` terhadap sistem operasi target berdasarkan cara target merespon paket tertentu, sehingga bisa mengidentifikasi OS seperti `Windows`, `Linux`, `macOS`, `dll`.
5. **Scriptable Interaction dengan Nmap Scripting Engine (NSE)**  
    Fitur canggih ini memungkinkan `Nmap` menjalankan skrip untuk melakukan berbagai tugas otomatis, seperti `mengecek kerentanan`, `brute force password`, `audit keamanan`, dan `lainnya`.

## C. Keunggulan Nmap
- `Open-source` dan `gratis`
- Mendukung berbagai platform: `Linux`, `Windows`, `macOS`, `BSD` dan `lainnya`
- Fleksibel dan bisa dipakai untuk scan jaringan kecil hingga sangat besar
- Memiliki banyak opsi `scanning` dan `scripting` untuk berbagai kebutuhan
- Banyak digunakan oleh `profesional` dan `komunitas keamanan siber` di seluruh dunia
