# Teknik-Teknik Scan di Nmap

Teknik scanning di Nmap merupakan inti dari kemampuannya dalam mengidentifikasi sistem target selama penetration testing. Masing-masing teknik memiliki `tujuan`, `tingkat stealth` (tersembunyi), dan `efektivitas` yang berbeda.

## 1. TCP SYN Scan (-sS)

Melakukan `half-open scan`, hanya mengirim `SYN` dan melihat respon tanpa menyelesaikan `3-way handshake`.

**Catatan:**
- Cepat dan tidak terlalu mencolok (stealth).
- Default jika dijalankan sebagai `root`.

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

Melakukan `full TCP connection` (menggunakan `syscall connect()`), menyelesaikan `3-way handshake`.

**Catatan:**
- Digunakan jika tidak punya akses `root`.
- Lebih terlihat (noisy) dibanding `-sS`.

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

Mengirim `ACK` ke target, berguna untuk mengetahui status `firewall`.

**Catatan:**
- Tidak bisa mendeteksi port terbuka langsung.
- Jika `no response` -> `filtered`, jika `RST` -> `unfiltered`.

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

Menggunakan variasi dari `ACK scan` dan menganalisis `window size`.

**Catatan:**
- Jika `window size != 0` -> kemungkinan `open`
- Tidak selalu akurat.

**Contoh:**

```
nmap -sW 192.168.1.1
```
