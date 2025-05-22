# Struktur Perintah Nmap

## A. Struktur Perintah Nmap

Sebelum mulai `scanning`, penting untuk memahami struktur dasar perintah `Nmap`:

```
nmap [opsi] [target]
```

**Penjelasan:**

| Komponen | Keterangan|
|:--:|:--:|
| `nmap`	| Nama program |
| `[opsi]` | Metode `scan`, `teknik`, `script`, `dll` |
| `[target]` | `IP address`, `hostname`, atau `rentang IP` |

**Contoh Sederhana:**

```
nmap 192.168.1.1
```

Melakukan pemindaian port dasar ke IP `192.168.1.1`.

## B. Scanning Host dan Port Dasar

Berikut adalah beberapa perintah dasar yang wajib diketahui oleh pemula:

**1. Ping Scan (Host Discovery)**  
  
   Menemukan host aktif dalam jaringan tanpa memindai port.
  
   ```
   nmap -sn 192.168.1.0/24
   ```
  
   Memindai seluruh jaringan `/24` untuk mencari perangkat yang hidup.

**2. Port Scan Dasar (TCP SYN Scan)**  
  
   Melakukan pemindaian port standar (`TCP`).

   ```
   nmap -sS 192.168.1.1
   ```
  
   Scan cepat dan `stealthy` (tidak membuat koneksi penuh).

**3. Scan Beberapa Target Sekaligus**  

   ```
   nmap 192.168.1.1 192.168.1.2
   ```
  
   Scan dua IP berbeda dalam satu perintah.

**4. Scan Rentang IP**  
  
   ```
   nmap 192.168.1.1-50
   ```
  
   Scan IP dari `192.168.1.1` sampai `192.168.1.50`.

**5. Scan Nama Domain**  

   ```
   nmap scanme.nmap.org
   ```
  
   Scan terhadap domain alih-alih alamat IP.

## C. Memahami Output Hasil Scan

Saat menjalankan `Nmap`, hasilnya akan menampilkan informasi seperti:

```
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-21 10:48 WIB
Nmap scan report for 192.168.1.11
Host is up (0.000010s latency).
Not shown: 998 closed tcp ports (reset)
PORT     STATE SERVICE
22/tcp   open  ssh
80/tcp   open  http
443/tcp  open  https
```

**Penjelasan:**

| Bagian Output	| Keterangan |
|:--:|:--:|
| `Nmap scan report for` | Menunjukkan `IP` atau `hostname` yang discan |
| `Host is up` | Target hidup dan merespons |
| `Not shown:` | Banyak port yang tidak terbuka (disembunyikan dari tampilan) |
| `PORT` | Nomor port yang terdeteksi |
| `STATE` | Status port (`open`, `closed`, atau `filtered`) |
| `SERVICE` | Nama layanan yang umum berjalan di port tersebut |

**Contoh Status Port:**

| Status | Keterangan |
|:--:|:--:|
| `open` | Port terbuka dan menerima koneksi |
| `closed` | Port tertutup, tapi host merespons |
| `filtered` | Tidak ada respons. Mungkin diblokir `firewall` |

## Tips Dasar untuk Pemula
- Gunakan opsi `-v` untuk output lebih rinci (`verbose`).

  ```
  nmap -v 192.168.1.1
  ```

- Gunakan `-Pn` jika target tidak merespons ping (`ICMP diblokir`).

  ```
  nmap -Pn 192.168.1.1
  ```
