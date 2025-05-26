# Instalasi Nmap

## A. Pendahuluan

Sebelum mulai menggunakan `Nmap`, kita perlu menginstalnya terlebih dahulu. `Nmap` tersedia secara `gratis` dan `open-source`, serta dapat dijalankan di berbagai sistem operasi, seperti `Linux`, `Windows`, dan `macOS`.

## B. Instalasi Nmap di Linux

### 1. Debian/Ubuntu/Kali Linux

```
sudo apt update
sudo apt install nmap
```

`Nmap` biasanya sudah `pre-installed` di `Kali Linux`, tapi tetap bisa di-update melalui `APT`.

### 2. Fedora

```
sudo dnf install nmap
```

### 3. Arch Linux/Manjaro

```
sudo pacman -S nmap
```

**Cek versi Nmap:**

```
nmap --version
```

## C. Instalasi Nmap di Windows

### Langkah-langkah:

- Kunjungi situs resmi `Nmap`:  
  https://nmap.org/download.html
- Unduh `Windows Installer` (biasanya bernama `nmap-[versi]-setup.exe`).
- Jalankan `installer` seperti biasa (klik dua kali file `.exe`).
- Pilih komponen yang ingin diinstal:
  - `Nmap Core Files`
  - `Register Nmap Path`
  - `Npcap 1.82`
  - `Network Performance Inprovements`
  - `Ncat (Modern Netcat reincarnation)`
  - `Nping (Packet generator)`
  - `Zenmap (GUI Frontend)`
  - `Ndiff (Scan comparison tool)`
- Klik `Next` hingga selesai.
- Setelah instalasi, buka `Command Prompt (cmd)` dan jalankan:

```
nmap --version
```

Jika muncul versi, maka instalasi berhasil.

## D. Instalasi Nmap di macOS

### 1. Opsi 1: Menggunakan Homebrew (disarankan)

Pastikan `Homebrew` sudah terpasang. Jika belum:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Install Nmap:**

```
brew install nmap
```

### 2. Opsi 2: Menggunakan Installer Resmi
- Download dari: https://nmap.org/download.html
- Pilih file `.dmg` untuk `macOS`
- Seret ikon `Nmap` ke folder `Applications`

## E. Catatan Tambahan

Jika ingin menggunakan `Nmap` terbaru, sebaiknya kompilasi dari `source`.

**Untuk Linux:**

```
sudo apt install build-essential
wget https://nmap.org/dist/nmap-7.94.tgz
tar xvf nmap-7.94.tgz
cd nmap-7.94
./configure
make
sudo make install
```

**Cek versi:**

```
nmap --version
```

## F. Hak Akses

`Nmap` membutuhkan izin `root` untuk menjalankan beberapa teknik scanning (seperti `SYN scan`, `OS detection`). Maka dari itu, gunakan `sudo` jika dibutuhkan:

```
sudo nmap -sS 192.168.1.1
```

## Kesimpulan

Instalasi `Nmap` cukup mudah dan tersedia di hampir semua sistem operasi utama. Pastikan selalu menggunakan versi terbaru untuk mendapatkan dukungan fitur dan keamanan yang optimal. Setelah instalasi selesai, kamu siap menggunakan `Nmap` untuk `scanning`, `deteksi OS`, `pemetaan jaringan`, dan `eksplorasi kerentanan`.
