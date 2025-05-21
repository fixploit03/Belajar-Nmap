# Teknik-Teknik Scan di Nmap

Teknik scanning di `Nmap` merupakan inti dari kemampuannya dalam mengidentifikasi sistem target selama `penetration testing`. Masing-masing teknik memiliki `tujuan`, `tingkat stealth` (tersembunyi), dan `efektivitas` yang berbeda.

## 1. TCP SYN Scan (-sS)
- **Deskripsi**: Disebut juga `stealth scan`, ini adalah teknik pemindaian `TCP` default `Nmap`. Mengirim paket `SYN` ke port, target tanpa menyelesaikan koneksi `TCP` penuh (`3-way handshake`).
- **Cara Kerja**: Nmap mengirim paket `SYN`, dan jika target merespons dengan `SYN/ACK`, port dianggap terbuka. Jika `RST` (reset) diterima, port dianggap tertutup. Nmap tidak mengirim `ACK` kembali, sehingga koneksi tidak selesai.
- **Keunggulan**: Cepat, tidak terdeteksi oleh beberapa sistem `logging` karena tidak ada koneksi penuh.
- **Kekurangan**: Membutuhkan hak akses `root` (di `Unix`) untuk membuat paket `TCP` mentah.
- **Penggunaan**: Ideal untuk pemindaian cepat dan diam-diam pada jaringan besar.

**Contoh:**

```
nmap -sS 192.168.1.1
```

**Respons**
- **Open Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20SYN%20Scan%20(Open).png)

- **Closed Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20SYN%20Scan%20(Closed).png)

- **Filtered Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20SYN%20Scan%20(Filtered).png)
  
## 2. TCP Connect Scan (-sT)
- **Deskripsi**: Menggunakan koneksi `TCP` penuh (`3-way handshake`: `SYN`, `SYN/ACK`, `ACK`) untuk memeriksa status port.
- **Cara Kerja**: `Nmap` memulai koneksi `TCP` penuh dengan target, lalu menutupnya jika port terbuka. Jika koneksi ditolak (`RST`), port dianggap tertutup.
- **Keunggulan**: Tidak memerlukan hak akses `root`, cocok untuk pengguna `non-admin`.
- **Kekurangan**: Lebih lambat dan lebih mudah terdeteksi karena koneksi penuh dicatat oleh sistem target.
- **Penggunaan**: Digunakan ketika `SYN scan` tidak memungkinkan, misalnya pada sistem tanpa akses `root`.

**Contoh:**

```
nmap -sT 192.168.1.1
```

**Respons**
- **Open Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20Connect%20Scan%20(Open).png)

- **Closed Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20Connect%20Scan%20(Closed).png)

- **Filtered Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20Connect%20Scan%20(Filtered).png)


## 3. TCP ACK Scan (-sA)

- **Deskripsi**: Mengirim paket `TCP` dengan flag `ACK` untuk memeriksa apakah port difilter oleh `firewall`.
- **Cara Kerja**: Paket `ACK` dikirim ke port target. Jika tidak ada respons, port kemungkinan difilter. Jika `RST` diterima, port tidak difilter.
- **Keunggulan**: Berguna untuk mendeteksi aturan `firewall` atau sistem penyaringan.
- **Kekurangan**: Tidak dapat menentukan apakah port terbuka atau tertutup, hanya apakah port difilter.
- **Penggunaan**: Digunakan untuk memetakan konfigurasi `firewall` atau `IDS`.

**Contoh:**

```
nmap -sA 192.168.1.1
```

**Respons**
- **Open Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20ACK%20Scan%20(Open).png)

- **Closed Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20ACK%20Scan%20(Closed).png)

- **Filtered Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20ACK%20Scan%20(Filtered).png)

## 4. TCP Window Scan (-sW)

- **Deskripsi**: Mirip dengan `ACK scan`, tetapi memanfaatkan nilai `TCP Window` untuk mendeteksi status port.
- **Cara Kerja**: Menganalisis nilai `TCP Window` dalam respons `RST`. Nilai positif menunjukkan port terbuka, sementara nol menunjukkan port tertutup (pada beberapa sistem).
- **Keunggulan**: Dapat membedakan port terbuka dan tertutup pada sistem tertentu.
- **Kekurangan**: Tidak selalu akurat karena bergantung pada implementasi `TCP stack` target.
- **Penggunaan**: Digunakan untuk analisis lanjutan pada sistem tertentu.

**Contoh:**

```
nmap -sW 192.168.1.1
```

**Respons**
- **Open Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20Window%20Scan%20(Open).png)

- **Closed Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20Window%20Scan%20(Closed).png)

- **Filtered Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20ACK%20Scan%20(Filtered).png)

## 5. UDP Scan (-sU)
- **Deskripsi**: Memindai port `UDP` untuk menentukan apakah port terbuka atau tertutup.
- **Cara Kerja**: Mengirim paket `UDP` kosong (atau payload khusus) ke port target. Jika port tertutup, target mengirim respons `ICMP Port Unreachable`. Jika tidak ada respons, port kemungkinan terbuka atau difilter.
- **Keunggulan**: Penting untuk memindai layanan `UDP` seperti `DNS`, `SNMP`, atau `DHCP`.
- **Kekurangan**: Lambat karena `UDP` tidak memiliki mekanisme pengendalian seperti `TCP`, dan `firewall` sering memblokir respons `ICMP`.
- **Penggunaan**: Digunakan untuk menemukan layanan berbasis `UDP`.

**Contoh:**

```
nmap -sU 192.168.1.1
```

**Respons**
- **Open Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/UDP%20Scan%20(Open).png)

- **Closed Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/UDP%20Scan%20(Closed).png)

- **Filtered Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/UDP%20Scan%20(Filtered).png)

## 6. TCP NULL Scan (sN)
- **Deskripsi**: Mengirim paket `TCP` tanpa flag (`null packet`).
- **Cara Kerja**: Jika port tertutup, target mengirim `RST`. Jika terbuka, biasanya tidak ada respons (sesuai `RFC 793`).
- **Keunggulan**: Dapat menghindari deteksi oleh beberapa sistem keamanan karena tidak menggunakan flag standar.
- **Kekurangan**: Tidak bekerja pada sistem yang tidak mengikuti `RFC 793` (misalnya, `Windows`).
- **Penggunaan**: Cocok untuk sistem `Unix/Linux` untuk pemindaian diam-diam.

**Contoh:**

```
nmap -sN 192.168.1.1
```

**Respons**
- **Open Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20Null%20Scan%20(Open).png)

- **Closed Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20Null%20Scan%20(Closed).png)

- **Filtered Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20Null%20Scan%20(Filtered).png)

## 7. TCP FIN Scan (-sF) 
- **Deskripsi**: Mengirim paket `TCP` dengan flag `FIN`.
- **Cara Kerja**: Mirip dengan `Null scan`, tetapi menggunakan flag `FIN`. Port tertutup mengembalikan `RST`, sementara port terbuka tidak merespons.
- **Keunggulan**: Dapat melewati beberapa `firewall` sederhana.
- **Kekurangan**: Tidak efektif pada sistem seperti `Windows` yang tidak mengikuti `RFC 793`.
- **Penggunaan**: Digunakan untuk pemindaian `stealth` pada sistem `Unix/Linux`.

**Contoh:**

```
nmap -sF 192.168.1.1
```

**Respons**
- **Open Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20FIN%20Scan%20(Open).png)

- **Closed Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20FIN%20Scan%20(Closed).png)

- **Filtered Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20FIN%20Scan%20(Filtered).png)

## 8. TCP Xmas Scan (-sX)
- **Deskripsi**: Mengirim paket `TCP` dengan flag `FIN`, `PSH`, dan `URG` (disebut `Xmas tree` karena flag yang menyala seperti `lampu natal`).
- **Cara Kerja**: Sama seperti `Null` dan `FIN scan`, port tertutup mengembalikan `RST`, port terbuka tidak merespons.
- **Keunggulan**: Dapat digunakan untuk menghindari deteksi pada sistem tertentu.
- **Kekurangan**: Tidak bekerja pada banyak sistem modern, terutama `Windows`.
- **Penggunaan**: Digunakan untuk pemindaian khusus pada sistem `Unix/Linux`.

**Contoh:**

```
nmap -sX 192.168.1.1
```

**Respons**
- **Open Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20Xmas%20Scan%20(Open).png)

- **Closed Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20Xmas%20Scan%20(Closed).png)

- **Filtered Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/TCP%20Xmas%20Scan%20(Filtered).png)


## 9. Idle Scan (-sI)
- **Deskripsi**: Teknik pemindaian `stealth` yang menggunakan `zombie host` untuk memindai target tanpa jejak langsung dari pemindai.
- **Cara Kerja**: Memanfaatkan prediksi nomor `ID IP` dari `zombie host` untuk mengirim paket palsu ke target. Status port ditentukan berdasarkan perubahan nomor `ID IP zombie`.
- **Keunggulan**: Sangat sulit dilacak karena pemindaian tampak berasal dari `zombie host`.
- **Kekurangan**: Sulit diatur, memerlukan `zombie host` yang cocok, dan lambat.
- **Penggunaan**: Digunakan untuk pemindaian rahasia dalam pengujian keamanan tingkat lanjut.

**Contoh:**

```
nmap -sI 192.168.1.100 192.168.1.1
```

**Respons**
- **Open Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/Idle%20Scan%20(Open).png)

- **Closed Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/Idle%20Scan%20(Closed).png)

- **Filtered Port**

  ![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/Idle%20Scan%20(FIltered).png)

## Catatan Penting:
- Beberapa teknik (seperti `Null`, `FIN`, `Xmas`) tidak efektif pada sistem modern seperti `Windows` karena perbedaan implementasi `TCP stack`.
- Pemindaian harus dilakukan dengan izin resmi karena dapat dianggap sebagai aktivitas ilegal jika dilakukan tanpa izin.
