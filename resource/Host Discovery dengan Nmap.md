# Host Discovery dengan Nmap

`Host Discovery` adalah langkah awal dalam pemindaian jaringan menggunakan `Nmap` untuk mengidentifikasi `host` yang aktif (`online`) sebelum melakukan pemindaian port atau layanan lebih lanjut. Berikut adalah penjelasan opsi `host discovery` yang umum digunakan:

## 1. List Scan (-sL)
- **Deskripsi**: Hanya mencantumkan daftar target yang akan dipindai tanpa melakukan pemindaian aktual.
- **Fungsi**: Digunakan untuk memverifikasi `daftar IP` atau `hostname` tanpa mengirimkan paket ke target.

**Contoh:**

```
nmap -sL 192.168.1.0/24
```

**Kegunaan**: Cocok untuk membuat inventaris target sebelum pemindaian.

## 2. Ping Scan (-sn)
- **Deskripsi**: Melakukan `ping scan` tanpa memindai port (hanya mendeteksi `host` aktif).
- **Fungsi**: Menggunakan metode seperti `ICMP echo request` atau `TCP/UDP probe` untuk memeriksa keberadaan `host`.

**Contoh:**

```
nmap -sn 192.168.1.0/24
```

**Kegunaan**: Cepat untuk menemukan `host` aktif di jaringan.

## 3. Skip Host Discovery (-Pn)
- **Deskripsi**: Menganggap semua `host online` dan langsung melakukan pemindaian port tanpa penemuan `host`.
- **Fungsi**: Berguna saat `firewall` memblokir `ping` atau saat Anda yakin `host` aktif.

**Contoh:**

```
nmap -Pn 192.168.1.100
```

**Kegunaan**: Menghemat waktu pada target yang diketahui aktif.

## 4. TCP SYN, TCP ACK, UDP, atau SCTP Discovery (-PS/-PA/-PU/-PY)
- **Deskripsi**: Mengirimkan paket `TCP SYN` (`-PS`), `TCP ACK` (`-PA`), `UDP` (`-PU`), atau `SCTP` (`-PY`) ke daftar port tertentu untuk mendeteksi `host` aktif.
- **Fungsi**: Menentukan apakah `host` merespons pada port tertentu.

**Contoh:**

```
nmap -PS22,80,443 192.168.1.100
```

**Kegunaan**: Efektif untuk melewati `firewall` yang memblokir `ICMP`.

## 5. ICMP Echo, Timestamp, dan Netmask Request (-PE/-PP/-PM)
- **Deskripsi**:
  - `-PE`: Mengirim `ICMP Echo Request` (`ping` standar).
  - `-PP`: Mengirim `ICMP Timestamp Request`.
  - `-PM`: Mengirim `ICMP Netmask Request`.
- **Fungsi**: Mendeteksi `host` menggunakan variasi paket `ICMP`.

**Contoh:**

```
nmap -PE 192.168.1.0/24
```

**Kegunaan**: Berguna untuk jaringan yang mengizinkan lalu lintas `ICMP`.

## 6. IP Protocol Ping (-PO)
**Deskripsi**: Mengirimkan paket dengan protokol `IP` tertentu (misalnya, `ICMP`, `IGMP`) untuk mendeteksi `host`.
**Fungsi**: Menguji respons `host` terhadap protokol tertentu.
    
**Contoh:**

```
nmap -PO1,2 192.168.1.100
```

**Kegunaan**: Alternatif untuk penemuan `host` saat `ICMP` diblokir.

## 7. Pengaturan Resolusi DNS (-n/-R)
- **Deskripsi**:
  - `-n`: Tidak melakukan `resolusi DNS` (menghemat waktu).
  - `-R`: Selalu melakukan `resolusi DNS` untuk setiap `host`.
- **Fungsi**: Mengontrol apakah `Nmap` mencoba menerjemahkan `IP` ke `hostname`.

**Contoh:**

```
nmap -n 192.168.1.0/24
nmap -R 192.168.1.100
```

**Kegunaan**: `-n` untuk kecepatan, `-R` untuk detail tambahan.

## 8. Custom DNS Servers (--dns-servers)
**Deskripsi**: Menentukan `server DNS` khusus untuk resolusi nama.
**Fungsi**: Menggantikan `server DNS` default sistem untuk keandalan atau kecepatan.
    
**Contoh:**

```
nmap --dns-servers 8.8.8.8,8.8.4.4 192.168.1.100
```

**Kegunaan**: Berguna di jaringan dengan `DNS internal` atau saat server default tidak responsif.

## 9. Gunakan DNS Sistem (--system-dns)
- **Deskripsi**: Menggunakan `resolver DNS` bawaan sistem operasi.
- **Fungsi**: Menghindari penggunaan `resolver DNS` internal `Nmap`.

**Contoh:**

```
nmap --system-dns 192.168.1.100
```

**Kegunaan**: Kompatibilitas dengan konfigurasi `DNS sistem`.

# 10. Lacak Jalur Hop (--traceroute)
- **Deskripsi**: Melacak rute paket dari sumber ke setiap `host` target.
- **Fungsi**: Menampilkan hop jaringan (`router`) yang dilewati menuju target.

**Contoh:**

```   
nmap --traceroute 192.168.1.100
```

**Kegunaan**: Membantu memahami topologi jaringan dan mengidentifikasi masalah konektivitas.

## Contoh Kombinasi Perintah

```
nmap -sn -PE -PS22,80 192.168.1.0/24 --traceroute
```

Perintah ini melakukan `ping scan` dengan `ICMP Echo` dan `TCP SYN` ke port `22` dan `80`, lalu melacak rute ke `host` aktif.

## Catatan Penting
- `Host Discovery` adalah langkah krusial untuk efisiensi pemindaian, karena hanya host aktif yang akan dipindai lebih lanjut.
- Kombinasi opsi (misalnya, `-PE` `-PS22`,`80`) dapat digunakan untuk meningkatkan akurasi deteksi.
- Pertimbangkan `firewall` dan kebijakan jaringan target untuk memilih metode yang tepat.
- Selalu gunakan `Nmap` dengan izin yang sah untuk menghindari masalah hukum.
