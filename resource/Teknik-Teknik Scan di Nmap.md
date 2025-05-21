# Teknik-Teknik Scan di Nmap

Teknik scanning di Nmap merupakan inti dari kemampuannya dalam mengidentifikasi sistem target selama penetration testing. Masing-masing teknik memiliki `tujuan`, `tingkat stealth` (tersembunyi), dan `efektivitas` yang berbeda.

## 1. -sS (TCP SYN Scan)

Melakukan `half-open scan`, hanya mengirim `SYN` dan melihat respon tanpa menyelesaikan `3-way handshake`.

**Catatan:**
- Cepat dan tidak terlalu mencolok (stealth).
- Default jika dijalankan sebagai `root`.

**Contoh:**

```
nmap -sS 192.168.1.1
```

**Respons**

## 2. -sT (TCP Connect Scan)

Melakukan `full TCP connection` (menggunakan `syscall connect()`), menyelesaikan `3-way handshake`.

**Catatan:**
- Digunakan jika tidak punya akses `root`.
- Lebih terlihat (noisy) dibanding `-sS`.

**Contoh:**

```
nmap -sT 192.168.1.1
```
