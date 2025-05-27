# Instalasi Nmap

## Pendahuluan

Sebelum menggunakan Nmap dalam penetration testing atau network scanning, kita perlu melakukan instalasi terlebih dahulu. Nmap dapat diinstal di berbagai sistem operasi seperti:

- Linux (`Debian`, `Ubuntu`, `Kali`, `Arch`, `dll`)
- macOS
- Windows

Instalasi bisa dilakukan melalui `package manager`, `installer resmi`, atau dengan cara build dari `source code`.

## A. Instalasi Nmap di Linux

**1. Debian, Ubuntu, Kali Linux, Parrot OS, dan turunannya:**

```
sudo apt update
sudo apt install nmap
```

**2. Arch Linux, Manjaro:**

```
sudo pacman -S nmap
```

**3. Fedora, Red Hat, CentOS:**

```
sudo dnf install nmap
```

**4. OpenSUSE:**

```
sudo zypper install nmap
```

> Catatan: Di `Kali Linux`, Nmap biasanya sudah `pre-installed`.

## B. Instalasi Nmap di Windows

**Langkah-langkah:**

1. Kunjungi situs resmi: [https://nmap.org/download.html](https://nmap.org/download.html)
2. Unduh file installer Windows (`nmap-setup.exe`)
3. Jalankan installer, Klik `Next` sampai selesai
4. Setelah instalasi, buka `Command Prompt (CMD)` dan ketik:

   ```
   nmap -v
   ```

   Jika berhasil, akan muncul versi Nmap yang terpasang.

> Installer Windows biasanya menyertakan `Zenmap`, GUI dari Nmap.

🍎 Instalasi Nmap di macOS
Menggunakan Homebrew (disarankan):

brew install nmap

Atau bisa juga:

    Download file .dmg dari situs resmi: https://nmap.org/download.html

    Install secara manual

## Build Nmap dari Source Code (Linux/Mac)

Jika kamu ingin versi terbaru atau ingin melakukan kustomisasi:

**Langkah-langkah:**

```
git clone https://github.com/nmap/nmap.git
cd nmap
./configure
make
sudo make install
```
  
Pastikan kamu sudah menginstall build tools seperti `gcc`, `make`, dan `libpcap-dev`.

Verifikasi Instalasi

Setelah proses instalasi, cek apakah Nmap sudah dapat dijalankan:

```
nmap -v
```

Contoh output:

```
Nmap version 7.95 ( https://nmap.org )
Platform: x86_64-pc-linux-gnu
Compiled with: liblua-5.4.7 openssl-3.5.0 libssh2-1.11.1 libz-1.3.1 libpcre2-10.45 libpcap-1.10.5 nmap-libdnet-1.12 ipv6
Compiled without:
Available nsock engines: epoll poll select
```

## Uji Coba Awal

Coba perintah dasar untuk menguji fungsionalitas:

```
nmap scanme.nmap.org
```

`scanme.nmap.org` adalah server resmi yang disediakan oleh Nmap untuk latihan scanning.

## Tips Tambahan

- Selalu gunakan versi terbaru untuk mendapatkan fitur dan script `NSE` terbaru.
- Di sistem operasi `Linux`, kamu bisa melihat lokasi file Nmap:

   ```
   which nmap
   ```

## Kesimpulan

Instalasi Nmap sangat mudah dan fleksibel di berbagai sistem operasi. Setelah berhasil menginstal, kamu siap untuk memulai eksplorasi fitur-fitur powerful yang ditawarkan Nmap dalam proses penetration testing.

> Selanjutnya kita akan membahas: Struktur Folder dan File Penting di Nmap
