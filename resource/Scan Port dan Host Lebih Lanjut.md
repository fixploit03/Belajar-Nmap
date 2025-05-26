# Scan Port dan Host Lebih Lanjut

## Pendahuluan

Memperdalam penggunaan Nmap untuk melakukan scanning lebih detail, termasuk range IP, berbagai jenis port, teknik pengoptimalan kecepatan scan, serta deteksi layanan dan sistem operasi.

## 1. Memindai Banyak IP Sekaligus

Nmap mendukung scanning multiple target dalam berbagai format:

| Target	| Contoh |
|:--:|:--:|
| Satu IP | `nmap 192.168.1.1` |
| Banyak IP	| `nmap 192.168.1.1 192.168.1.2` |
| IP range	| `nmap 192.168.1.1-100` |
| CIDR notation | `nmap 192.168.1.0/24` |
| Dari file	| `nmap -iL list.txt` |
| Semua kecuali | `nmap --exclude 192.168.1.5,192.168.1.10` |

Contoh:

```
nmap -sS 192.168.1.1-100
nmap -iL daftar_target.txt
```

## 2. Scan Port Lebih Spesifik

Secara default, Nmap memindai `1.000` port `TCP` paling umum. Namun kamu bisa memindai:

1. Port Tertentu:

   ```
   nmap -p 22,80,443 192.168.1.10
   ```

2. Port Range:

   ```
   nmap -p 1-65535 192.168.1.10
   ```

3. Semua Port + UDP:

   ```
   nmap -sS -sU -p T:1-65535,U:1-1000 192.168.1.10
   ```

## 3. Service Detection (-sV)

Untuk mengetahui nama layanan dan versinya, gunakan:

```
nmap -sV 192.168.1.10
```

Contoh hasil:

```
PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH 7.9p1 Debian
80/tcp   open  http    Apache httpd 2.4.38
```

Informasi ini sangat krusial untuk eksploitasi.

## 4. OS Detection (-O)

Nmap bisa mencoba menebak jenis sistem operasi target berdasarkan `fingerprint TCP/IP`:

```
nmap -O 192.168.1.10
```

Butuh privilege `root` dan hasil bisa tidak akurat jika firewall aktif.

## 5. Aggressive Scan (-A)

Menggabungkan beberapa fitur sekaligus:
- OS detection
- Service version
- Traceroute
- NSE basic scripts

Contoh:

```
nmap -A 192.168.1.10
```

**Hati-hati**: bising dan mudah terdeteksi oleh `IDS/IPS`.

## 6. Traceroute (--traceroute)

Untuk melihat jalur jaringan menuju target:

Contoh:

```
nmap --traceroute 192.168.1.10
```

## 7. Mengatur Kecepatan Scan

Nmap punya `6` level timing (`-T0` s.d. `-T5`):

| Level | Deskripsi |
|:--:|:--:|
| `-T0` | Paranoid (super lambat) |
| `-T3` | Normal (default) |
| `-T4` | Cepat (umum dipakai) |
| `-T5` | Insane (risiko tinggi, cepat) |

Contoh:

```
nmap -sS -T4 192.168.1.10
```

## 8. Output Detail Scan

Gunakan `-v` untuk verbose:

Contoh:

```
nmap -v -sS 192.168.1.10
```

Gunakan `-vv` atau `-d` untuk lebih detail lagi.

## 9. Contoh Scan Lanjutan

**Contoh**: Scan semua port dengan service detection dan OS detection:

```
nmap -p- -sS -sV -O 192.168.1.10
```

**Contoh**: Scan satu subnet penuh dengan agresif:

```
nmap -A 192.168.1.0/24
```

## Kesimpulan

Fitur lanjutan dari Nmap memungkinkan penetration tester untuk:
- Menyesuaikan target scan (multi-IP, subnet, file list).
- Memindai lebih banyak port dan protokol.
- Melakukan deteksi layanan dan OS.
- Mengoptimalkan waktu scan sesuai situasi.

Semua ini membuat Nmap menjadi tool yang luwes dan powerful dalam pengumpulan informasi jaringan.
