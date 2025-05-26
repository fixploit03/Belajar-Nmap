# Struktur Perintah Nmap

## Pendahuluan

`Nmap` menggunakan struktur perintah berbasis `command line (CLI)` yang sangat fleksibel dan modular. Dengan memahami struktur dasarnya, kamu dapat menyusun perintah `Nmap` sesuai kebutuhan: mulai dari scanning sederhana hingga kompleks, termasuk `deteksi OS`, `deteksi layanan`, `scripting`, dan `lain-lain`.

## A. Struktur Umum Perintah Nmap

```
nmap [opsi] [target]
```

Contoh sederhana:

```
nmap 192.168.1.1
```

Contoh lebih kompleks:

```
sudo nmap -sS -sV -O -T4 -p 1-1000 192.168.1.1
```

## B. Komponen Penting dalam Struktur Perintah Nmap

**1. Target**

Bisa berupa `IP tunggal`, `range`, `subnet`, `nama domain`.

**Contoh:**
- `192.168.1.1`
- `192.168.1.1-10`
- `192.168.1.0/24`
- `example.com`

**2. Opsi Scan (Scan Type)**

Menentukan teknik scanning yang digunakan:
    
| Opsi | Nama | Keterangan |
:--:|:--:|:--:|
| `-sS`	| TCP SYN scan | `Stealth scan` (default, cepat) |
| `-sT`	| TCP connect scan | `Full TCP connect` |
| `-sU`	| UDP scan | Scan port `UDP` |
| `-sA`	| ACK scan | Untuk bypass `firewall` |
| `-sN`	| Null scan | Tanpa flag `TCP` |

**3. Opsi Deteksi dan Identifikasi**
- `-sV`: Deteksi versi layanan
- `-O`: Deteksi sistem operasi (`OS`)
- `-A`: Deteksi agresif (`OS`, `version`, `script`, `traceroute`)

**4. Opsi Port**
- `-p`: untuk menentukan port
  - `-p 80`: scan port `80` saja
  - `-p 1-1000`: scan port `1` sampai `1000`
  - `-p-`: scan semua `65535` port

**5. Timing dan Performa**
- `-T0` sampai `-T5`

  | Opsi | Mode | Kecepatan | Risiko Terdeteksi | Deskripsi | 
  |:--:|:--:|:--:|:--:|:--:|
  | `-T0` | Paranoid | Sangat lambat | Sangat stealth | Delay `5 menit` antar `probe`, cocok untuk menghindari `IDS` |
  | `-T1` | Sneaky | Lambat | Stealth tinggi | Delay `15 detik` antar `probe`, untuk jaringan yang dimonitor ketat |
  | `-T2` | Polite | Lambat | Stealth sedang | Delay `beberapa detik`, mengurangi beban `bandwidth` |
  | `-T3` | Normal | Sedang | Sedang| Mode default, keseimbangan `kecepatan` dan `stealth` |
  | `-T4` | Aggressive | Cepat | Mudah terdeteksi | Timeout lebih pendek, paralel lebih tinggi | 
  | `-T5` | Insane | Sangat cepat | Sangat mudah terdeteksi | Sangat agresif, mungkin tidak akurat pada jaringan lambat |

**6. Penggunaan Script (NSE)**
- `--script=<nama>`: Menjalankan script `NSE` tertentu.

  Contoh:

  ```
  sudo nmap --script=http-title 192.168.1.1
  ```

- `--script=default`: Menjalankan script default `Nmap`.
- `--script-help=<nama>`: Tampilkan dokumentasi script.

**7. Output**
- `-oN <file>`: Output dalam format normal.
- `-oX <file>`: Output dalam format `XML`.
- `-oG <file>`: Output `grepable`.
- `-oA <basename>`: Semua format di atas sekaligus.

**8. Lain-lain**
- `-Pn`: Skip `host discovery` (anggap semua host hidup).
- `-v`, `-vv`, `-vvv`: Verbose level (informasi lebih detail).
- `--open`: Tampilkan hanya port yang terbuka.

## C. Contoh Struktur Perintah Kombinasi

1. Scan cepat port umum:

   ```
   nmap -F target.com
   ```

2. Scan intensif dengan `OS detection`:

   ```
   sudo nmap -sS -sV -O -T4 -p- target.com
   ```

3. Gunakan script untuk deteksi kerentanan:

   ```
   sudo nmap -sV --script=vuln 192.168.1.1
   ```

4. Simpan hasil scan ke file:

   ```
   nmap -sS -T4 -oA hasil-scan 10.10.10.1
   ```

## D. Tips dalam Menyusun Struktur Perintah
- Gunakan `-T3` atau `-T4` untuk `balancing` antara `stealth` dan `kecepatan`.
- Gunakan `--top-ports <jumlah>` untuk scan port terbuka yang paling umum.
- Jika butuh bypass firewall, kombinasi `-sS`, `-sA`, atau `-sN` bisa dicoba.
- Untuk jaringan besar, gunakan subnet `CIDR (192.168.1.0/24)`.
- Gabungkan dengan script `NSE` untuk hasil lebih mendalam.

## E. Latihan

Coba analisis dan jelaskan fungsi dari perintah berikut:

```
sudo nmap -sS -sV -p 22,80,443 --script=http-enum -oN webscan.txt example.com
```

**Jawaban:**

Lakukan `SYN scan (-sS)`, `deteksi versi (-sV)` pada port `22`, `80`, `443`, menggunakan script `http-enum`, dan simpan hasilnya dalam file teks `webscan.txt`.

## Kesimpulan

Struktur perintah `Nmap` sangat fleksibel dan bisa dikustomisasi sesuai kebutuhan. Dengan memahami struktur ini, kamu akan mampu membangun perintah `Nmap` yang `kuat`, `efisien`, dan `sesuai dengan tujuan penetration testing`.
