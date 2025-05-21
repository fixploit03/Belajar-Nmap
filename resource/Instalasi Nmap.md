# Instalasi Nmap

`Nmap` dapat dijalankan di berbagai sistem operasi, termasuk `Linux`, `Windows`, dan `macOS`. Berikut adalah panduan instalasi `Nmap` berdasarkan platform:

## A. Cara Instalasi di Linux (Debian, Kali, Ubuntu)

- **1. Melalui Package Manager (APT)**  
  
  Cocok untuk distro berbasis `Debian` seperti `Ubuntu`, `Kali Linux`, `Linux Mint`.

  ```
  sudo apt update
  sudo apt install nmap -y
  ```

- **2. Cek versi setelah instalasi:**  
 
  ```
  nmap --version                            
  ```

  Jika output menampilkan versi, berarti `Nmap` berhasil terpasang.

## B. Cara Instalasi Nmap di Windows
- **1. Download Installer**  
  
  - Kunjungi situs resmi: https://nmap.org/download.html
  - Pilih: `Microsoft Windows binaries`
  - Unduh file: `nmap-<versi>-setup.exe`

- **2. Langkah Instalasi**  
  
  - Jalankan installer `.exe` seperti program `Windows` biasa.
  - Ikuti petunjuk wizard: `Next` -> `Agree` -> `Next` -> `Install`
  - Pastikan opsi `Add Nmap to the system PATH` dicentang.

- **3. Verifikasi**  
  
  Buka `Command Prompt` (`cmd`) dan jalankan:

  ```
  nmap --version
  ```

  Jika output menampilkan versi, berarti `Nmap` berhasil terpasang.

## C. Cara Instalasi Nmap di macOS

- **1. Menggunakan Homebrew (Direkomendasikan)**  
   
  Jika belum ada `Homebrew`:

  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

  Instal `Nmap`:

  ```
  brew install nmap
  ```

- **2. Verifikasi Instalasi**  

  ```
  nmap --version
  ```

  Jika output menampilkan versi, berarti `Nmap` berhasil terpasang.

## D. Catatan Tambahan

| Sistem Operasi | Metode Instalasi | Catatan |
|:--:|:--:|:--:|
| `Debian/Ubuntu` | `apt` | Versi `Nmap` kadang tidak terbaru |
| `Windows` | Installer `.exe` | `GUI Zenmap` juga terinstal otomatis |
| `macOS` | `brew` | Mudah diupdate melalui `Homebrew` |

## E. Tips

Untuk update ke versi terbaru secara manual, kamu bisa `meng-compile` dari `source code`:

```
git clone https://github.com/nmap/nmap
cd nmap
./configure
make
sudo make install
```

Tapi untuk pemula dan penggunaan umum, pakai `package manager` sudah cukup.
