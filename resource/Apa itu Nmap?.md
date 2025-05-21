# A. Apa itu Nmap?

[Nmap](https://nmap.org/) (Network Mapper) adalah alat open-source yang digunakan untuk memindai jaringan dan mendeteksi host serta layanan yang berjalan di jaringan tersebut. Nmap sangat populer di kalangan `ethical hacker`, `sysadmin`, dan `pentester`, karena kemampuannya dalam:

## B. Fungsi Utama Nmap
- Memindai host dalam suatu jaringan.
- Mendeteksi port yang terbuka (open ports).
- Menemukan layanan (service detection) yang berjalan di setiap port (misalnya `HTTP`, `SSH`, `FTP`).
- Mendeteksi sistem operasi (OS Detection).
- Menjalankan skrip untuk eksplorasi lebih lanjut menggunakan NSE (Nmap Scripting Engine).

## C. Contoh Kegunaan Nmap
- Mengetahui komputer apa saja yang aktif dalam jaringan.
- Mengecek apakah firewall dikonfigurasi dengan baik.
- Menemukan celah keamanan dalam jaringan atau server.
- Sebagai langkah awal dalam penetration testing.

## D. Contoh Perintah Nmap

| Perintah | Fungsi |
|:--:|:--:|
| `nmap 192.168.1.1` | Scan default ke 1000 port terhadap satu IP |
| `nmap -sS 192.168.1.1` | TCP SYN (stealth) scan |
| `nmap -p 1-65535 192.168.1.1` | Scan semua port |
| `nmap -sV 192.168.1.1` | Deteksi versi layanan |
| `nmap -O 192.168.1.1` | Deteksi sistem operasi |
| `nmap -A 192.168.1.1` | Full scan: `OS`, `version`, `traceroute`, `script` |
| `nmap -T4 192.168.1.1` | Scan cepat (agresif timing) |

## E. Fitur-Fitur Nmap
- Port scanning
- Service & version detection
- OS fingerprinting
- Scriptable interaction via NSE (Nmap Scripting Engine)
- Output ke `XML`, `grepable`, atau langsung ke `file`

## F. Penjelasan Singkat Tipe Scan

| Tipe Scan | Opsi | Keterangan |
|:--:|:--:|:--:|
| TCP Connect	| `-sT` | Scan TCP standar |
| SYN Scan (Stealth) | `-sS` | Tidak membuka koneksi penuh |
| UDP Scan	| `-sU`	|Scan port UDP |
| Service Version	| `-sV` |Deteksi layanan & versi |
| OS Detection | `-O` |Menebak sistem operasi target |
| Script Scan | `-sC` | Gunakan skrip default NSE |

## G. Kelebihan Nmap
- Open-source dan gratis.
- Sangat fleksibel (bisa digunakan dari simple scan hingga advanced recon).
- Mendukung banyak protokol.
- Bisa diotomatisasi (NSE).
