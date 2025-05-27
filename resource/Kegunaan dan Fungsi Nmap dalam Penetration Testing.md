# Kegunaan dan Fungsi Nmap dalam Penetration Testing

## Pengantar

Dalam dunia penetration testing (pengujian penetrasi), proses awal yang paling penting adalah `informasi gathering`, yakni mengumpulkan informasi sebanyak mungkin tentang target. Nmap adalah alat utama (primary tool) dalam tahap ini karena kemampuannya dalam:

- Mengenali host yang aktif
- Memindai port terbuka
- Menentukan layanan yang berjalan
- Mengidentifikasi sistem operasi
- Menjalankan skrip eksploitasi atau deteksi kerentanan

## A. Peran Nmap dalam Tahapan Pentest

Berikut adalah posisi Nmap dalam fase umum penetration testing:

| Fase Pentest | Peran Nmap |
|:--:|:--:|
| Reconnaissance | Mengidentifikasi perangkat aktif di jaringan |
| Scanning | Memetakan port dan layanan target |
| Enumeration | Mengumpulkan info spesifik dari layanan |
| Vulnerability Assessment | Menemukan potensi celah keamanan dengan `NSE` |
| Reporting | Memberikan output yang bisa digunakan untuk dokumentasi |

## B. Fungsi Utama Nmap dalam Pentest

**1. Host Discovery**
   
- Menemukan sistem aktif dalam jaringan
- Menggunakan ping sweep (`nmap -sn`)

**2. Port Scanning**

- Menemukan port yang `terbuka`, `tertutup`, atau `difilter`
- Teknik: `TCP Connect`, `SYN scan`, `UDP scan`, `dll`.

**3. Service and Version Detection**

- Mengidentifikasi layanan yang berjalan di port terbuka
- Mengetahui versi perangkat lunak (misal: `Apache 2.4.49`)

Contoh:

```
nmap -sV 192.168.1.100
```

**4. Operating System Detection**

- Menebak `OS` target berdasarkan respons paket
- Sangat berguna untuk menyesuaikan payload exploit

Contoh:

```
nmap -O 192.168.1.100
```

**5. Firewall & IDS Evasion**

Nmap dapat menghindari deteksi firewall dengan teknik `stealth`, `spoofing`, `timing`, `fragmenting`, `dll`.

Contoh:

```
nmap -sS -f --source-port 53 target.com
```

**6. Nmap Scripting Engine (NSE)**

Menjalankan skrip otomatis untuk:

- Deteksi kerentanan (`vuln scan`)
- Brute force login
- Info disclosure
- Malware backdoor

Contoh:

```
nmap --script vuln 192.168.1.100
```

## C. Contoh Nyata Penggunaan Nmap dalam Pentest

**Kasus 1: Mendeteksi Web Server dengan Vulnerability**

```
nmap -p 80,443 -sV --script=http-vuln-cve2014-3704 target.com
```

Mengecek apakah server web rentan terhadap `Drupalgeddon (CVE-2014-3704)`

**Kasus 2: Brute Force SSH Login**

```
nmap -p 22 --script ssh-brute 192.168.1.100
```

**Kasus 3: Deteksi Layanan SMB**

```
nmap -p 445 --script smb-os-discovery 192.168.1.100
```

## D. Kenapa Nmap Efektif dalam Pentest?

| Kelebihan | Penjelasan | 
|:--:|:--:|
| Cepat & Efisien | Bisa scanning ribuan host dengan metode yang dioptimalkan |
| Modular | Bisa menambahkan skrip khusus dengan mudah |
| Detail | Memberikan output lengkap dan spesifik |
| Kompatibel | Cocok dengan banyak `OS` & integrasi tools lain (`Metasploit`, `Nessus`, `dll`.) |

## E. Etika dan Legalitas

Walaupun Nmap adalah alat yang sangat powerful, penggunaannya harus tetap:

- Dengan izin dari pihak yang memiliki sistem
- Tidak digunakan untuk tujuan ilegal
- Dikendalikan oleh profesional yang paham etika penggunaan alat keamanan

## Kesimpulan

Nmap adalah alat serbaguna yang sangat penting dalam setiap tahapan `penetration testing`. Mulai dari scanning awal hingga eksploitasi, Nmap menyediakan fondasi kuat untuk memahami target dan mengidentifikasi celah keamanan.

> Bab selanjutnya akan membahas Instalasi Nmap di berbagai sistem operasi agar kamu bisa segera mulai praktik langsung.

Siap lanjut ke: Instalasi Nmap?

> [Instalasi Nmap](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Instalasi%20Nmap.md)
