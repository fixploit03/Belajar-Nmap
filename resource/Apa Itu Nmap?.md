# Apa Itu Nmap?

## A. Definisi Singkat

[Nmap (Network Mapper)](https://nmap.org/) adalah tool open-source yang digunakan untuk memetakan jaringan dan melakukan pemindaian terhadap host dan port yang tersedia. Tujuan utamanya adalah untuk membantu administrator sistem, peneliti keamanan, dan penetration tester dalam mendapatkan informasi detail mengenai struktur jaringan dan potensi celah keamanan.

Nmap dirancang untuk:

- Menemukan host aktif di jaringan.
- Menentukan port yang terbuka.
- Mengidentifikasi layanan yang berjalan di port tersebut.
- Mendeteksi sistem operasi dan versinya.
- Menjalankan skrip untuk pendeteksian kerentanan.

## B. Tujuan dan Kegunaan Utama

| Fungsi Utama Nmap | Deskripsi Singkat | 
|:--:|:--:|
| Host Discovery | Menemukan perangkat aktif di jaringan. |
| Port Scanning	| Mengetahui port mana yang `terbuka/tutup/terfilter`. | 
| Service Detection	| Mengidentifikasi layanan dan versinya. | 
| OS Detection | Menebak sistem operasi target. |
| Scripting Engine (NSE) | Menjalankan skrip khusus untuk deteksi dan eksploitasi. |

## C. Apa yang Membuat Nmap Istimewa?

Berikut beberapa keunggulan Nmap dibanding tool lain:

| Keunggulan | Penjelasan |
|:--:|:--:|
| Gratis & Open-source | Bisa digunakan dan dimodifikasi tanpa biaya. |
| Cepat dan Efisien | Memindai ribuan host dalam waktu singkat. |
| Cerdas | Mendeteksi `firewall`, `OS`, dan `layanan tersembunyi`. |
| Fleksibel | Bisa digunakan di `Windows`, `Linux`, `macOS`. |
| Scripting (NSE) | Fitur powerful untuk automatisasi dan eksploitasi. |

## D. Contoh Penggunaan Nmap

```
nmap 192.168.1.1
```

Memindai host dengan alamat IP `192.168.1.1` dan menampilkan port terbuka.

```
nmap -sV -O 192.168.1.1
```

Scan lanjutan: deteksi versi layanan dan sistem operasi.

## E. Sejarah Singkat Nmap

- **Dibuat oleh**: [Gordon Lyon (Fyodor)](https://en.wikipedia.org/wiki/Gordon_Lyon)
- **Rilis pertama**: `1997`
- **Bahasa pemrograman**: `C`, `Lua`, `Python`
- **Lisensi**: `GPL` (GNU General Public License)
- **Situs resmi**: [https://nmap.org](https://nmap.org)

Sejak perilisannya, Nmap terus berkembang dan menjadi standar de facto dalam dunia network scanning dan ethical hacking.

## F. Apakah Nmap Legal?

Nmap legal digunakan untuk:

- Audit jaringan sendiri
- Pembelajaran dan riset
- Pengujian keamanan dengan izin

Namun, penggunaan tanpa izin untuk menyusup ke jaringan orang lain bisa melanggar hukum. Selalu gunakan Nmap secara etis dan legal.

## Kesimpulan

Nmap adalah tool yang sangat penting dalam dunia keamanan jaringan. Dengan fitur-fitur canggih seperti `port scanning`, `OS detection`, dan `scripting engine`, Nmap memberikan kemampuan luar biasa bagi siapa saja yang ingin memahami atau mengamankan infrastruktur jaringan.

> Di bab berikutnya, kita akan menyelami sejarah Nmap: bagaimana tool ini bermula dan berkembang menjadi alat yang tak tergantikan dalam toolkit ethical hacker modern.
