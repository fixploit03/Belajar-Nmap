# Nmap Scripting Engine (NSE)

## A. Apa Itu NSE?

`Nmap Scripting Engine` (`NSE`) adalah fitur powerful dari `Nmap` yang memungkinkan pengguna untuk menjalankan script otomatis saat melakukan `scanning`. Script ini digunakan untuk berbagai keperluan seperti:
- Deteksi layanan lebih mendalam
- Deteksi kerentanan
- Brute force login
- Malware scanning
- Informasi tambahan dari layanan terbuka

`NSE` menggunakan bahasa pemrograman `Lua`, yang ringan dan cepat.

## B. Cara Menggunakan Script Nmap

- **1. Dasar Penggunaan Script**

  Format umum untuk menggunakan `script NSE`:

  ```
  nmap --script <nama_script> <target>
  ```

  **1. Contoh:**

  ```
  nmap --script http-title 192.168.1.10
  ```

  Menampilkan judul halaman web dari server `HTTP`

  ```
  nmap -sV --script=vuln 192.168.1.10
  ```

  Menjalankan semua script di kategori `vuln` untuk mencari kerentanan

  **2. Menjalankan Banyak Script**

  ```
  nmap --script "http-*,ftp-*" 192.168.1.10
  ```

  Menjalankan semua script dengan awalan `http-` dan `ftp-`

  **3. Menjalankan Berdasarkan Kategori**

  ```
  nmap --script default,safe 192.168.1.10
  ```

  Menjalankan semua script kategori `default` dan `safe`

## C. Contoh Script Penting untuk Scanning

Berikut adalah beberapa script `NSE` populer dan fungsinya:

| Script | Fungsi |
|:--:|:--:|
| `http-title` | Menampilkan judul halaman `HTML` dari layanan `HTTP` |
| `http-vuln-cve2006-3392` | Mendeteksi kerentanan `PHP` `remote code execution` |
| `ftp-anon` | Mengecek apakah server `FTP` mengizinkan login `anonymous` |
| `ssh-brute` | Melakukan `brute force login` `SSH` |
| `smb-enum-shares` | Enumerasi `share folder` pada server `SMB` |
| `smb-os-discovery` | Menampilkan info `OS` target via `SMB` |
| `dns-brute` | Melakukan `bruteforce DNS subdomain` |
| `ssl-cert` | Menampilkan informasi sertifikat `SSL` |
| `vulners`	| Menggunakan database `Vulners` untuk mendeteksi `CVE` di service |

**Cek semua script di folder:**

```
/usr/share/nmap/scripts/
```

## D. Kesimpulan
`NSE` adalah salah satu kekuatan utama `Nmap`. Dengan `NSE`, kamu tidak hanya bisa melakukan `scanning port`, tetapi juga:
- Melakukan eksplorasi mendalam pada layanan
- Mendeteksi celah keamanan
- Membuat `automation scanner` versi kamu sendiri
