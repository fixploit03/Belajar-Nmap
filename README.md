# Belajar Nmap

![](https://github.com/fixploit03/Belajar-Nmap/blob/main/img/nmap.jpg)

<div align="center">
  <b>Repositori untuk belajar Nmap</b>
</div>

<div align="center">
  <b>(Bahasa Indonesia)</b>
</div><br>

<p align="center">
  <img src="https://img.shields.io/github/repo-size/fixploit03/Belajar-Nmap?label=Repository%20Size" alt="Repository Size">
  <img src="https://img.shields.io/github/last-commit/fixploit03/Belajar-Nmap?label=Last%20Commit" alt="Last Commit">
  <img src="https://img.shields.io/github/stars/fixploit03/Belajar-Nmap?style=social&label=Stars" alt="Stars">
  <img src="https://img.shields.io/github/license/fixploit03/Belajar-Nmap?label=License&color=blue" alt="MIT License">
  <img src="https://img.shields.io/badge/Level-Beginner%20%E2%86%92%20Advanced-blueviolet" alt="Level">
  <img src="https://img.shields.io/badge/Language-Indonesian-red" alt="Language">
</p>

> **Disclaimer**: Materi ini disediakan hanya untuk tujuan edukasi dan pembelajaran. Dilarang keras menggunakan informasi di dalamnya untuk aktivitas yang melanggar hukum. Segala penyalahgunaan materi sepenuhnya menjadi tanggung jawab individu masing-masing. Penulis tidak bertanggung jawab atas konsekuensi yang timbul, baik di dunia maupun di akhirat.

## Daftar Isi
- [Pendahuluan](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Pendahuluan.md)
  - [Mengenal Dunia Keamanan Jaringan](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Pendahuluan.md#a-mengenal-dunia-keamanan-jaringan)
  - [Peran Network Scanning dalam Pentest](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Pendahuluan.md#b-peran-network-scanning-dalam-pentest)
  - [Kenapa Harus Nmap?](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Pendahuluan.md#c-kenapa-harus-nmap)
  - [Tujuan Panduan Ini](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Pendahuluan.md#d-tujuan-panduan-ini)
  - [Siapa yang Cocok Membaca Panduan Ini?](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Pendahuluan.md#e-siapa-yang-cocok-membaca-panduan-ini)
  - [Pengetahuan Dasar yang Dibutuhkan](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Pendahuluan.md#f-pengetahuan-dasar-yang-dibutuhkan)
  - [Siap untuk Belajar Nmap?](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Pendahuluan.md#siap-untuk-belajar-nmap)
- [Apa Itu Nmap?](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Apa%20Itu%20Nmap%3F.md)
  - [Definisi Singkat](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Apa%20Itu%20Nmap%3F.md#a-definisi-singkat)
  - [Tujuan dan Kegunaan Utama](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Apa%20Itu%20Nmap%3F.md#b-tujuan-dan-kegunaan-utama)
  - [Apa yang Membuat Nmap Istimewa?](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Apa%20Itu%20Nmap%3F.md#c-apa-yang-membuat-nmap-istimewa)
  - [Contoh Penggunaan Nmap](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Apa%20Itu%20Nmap%3F.md#d-contoh-penggunaan-nmap)
  - [Sejarah Singkat Nmap](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Apa%20Itu%20Nmap%3F.md#e-sejarah-singkat-nmap)
  - [Apakah Nmap Legal?](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Apa%20Itu%20Nmap%3F.md#f-apakah-nmap-legal)
  - [Kesimpulan](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Apa%20Itu%20Nmap%3F.md#kesimpulan)
- [Sejarah Nmap](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Sejarah%20Nmap.md)
  - [Awal Mula Nmap](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Sejarah%20Nmap.md#a-awal-mula-nmap)
  - [Filosofi dan Visi Awal](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Sejarah%20Nmap.md#b-filosofi-dan-visi-awal)
  - [Perjalanan Versi dan Fitur Penting](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Sejarah%20Nmap.md#c-perjalanan-versi-dan-fitur-penting)
  - [Nmap dalam Dunia Nyata](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Sejarah%20Nmap.md#d-nmap-dalam-dunia-nyata)
  - [Nmap di Budaya Populer](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Sejarah%20Nmap.md#e-nmap-di-budaya-populer)
  - [Komunitas dan Kontribusi](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Sejarah%20Nmap.md#f-komunitas-dan-kontribusi)
  - [Kesimpulan](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Sejarah%20Nmap.md#kesimpulan)
- [Kegunaan dan Fungsi Nmap dalam Penetration Testing](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Kegunaan%20dan%20Fungsi%20Nmap%20dalam%20Penetration%20Testing.md)
  - [Pengantar](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Kegunaan%20dan%20Fungsi%20Nmap%20dalam%20Penetration%20Testing.md#pengantar)
  - [Peran Nmap dalam Tahapan Pentest](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Kegunaan%20dan%20Fungsi%20Nmap%20dalam%20Penetration%20Testing.md#a-peran-nmap-dalam-tahapan-pentest)
  - [Fungsi Utama Nmap dalam Pentest](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Kegunaan%20dan%20Fungsi%20Nmap%20dalam%20Penetration%20Testing.md#b-fungsi-utama-nmap-dalam-pentest)
  - [Contoh Nyata Penggunaan Nmap dalam Pentest](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Kegunaan%20dan%20Fungsi%20Nmap%20dalam%20Penetration%20Testing.md#c-contoh-nyata-penggunaan-nmap-dalam-pentest)
  - [Kenapa Nmap Efektif dalam Pentest?](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Kegunaan%20dan%20Fungsi%20Nmap%20dalam%20Penetration%20Testing.md#d-kenapa-nmap-efektif-dalam-pentest)
  - [Etika dan Legalitas](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Kegunaan%20dan%20Fungsi%20Nmap%20dalam%20Penetration%20Testing.md#e-etika-dan-legalitas)
  - [Kesimpulan](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Kegunaan%20dan%20Fungsi%20Nmap%20dalam%20Penetration%20Testing.md#kesimpulan)
- [Instalasi Nmap](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Instalasi%20Nmap.md)
- [Struktur Folder dan File Penting di Nmap](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Struktur%20Folder%20dan%20File%20Penting%20di%20Nmap.md)
- [Struktur Perintah Nmap](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Struktur%20Perintah%20Nmap.md)
- [Host Discovery dengan Nmap](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Host%20Discovery%20dengan%20Nmap.md)
- [Teknik-Teknik Scan di Nmap](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Teknik-Teknik%20Scan%20di%20Nmap.md)
- [Scan Port dan Host Lebih Lanjut](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Scan%20Port%20dan%20Host%20Lebih%20Lanjut.md)
- [Nmap Scripting Engine (NSE)](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Nmap%20Scripting%20Engine%20(NSE).md)
- [Output dan Reporting Nmap](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Output%20dan%20Reporting%20Nmap.md)
- [Integrasi Nmap dengan Tools Penetration Testing Lain](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Integrasi%20Nmap%20dengan%20Tools%20Penetration%20Testing%20Lain.md)
- [Kasus Praktis Penggunaan Nmap](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Kasus%20Praktis%20Penggunaan%20Nmap.md)
- [Tips dan Trik Menggunakan Nmap Efektif](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Tips%20dan%20Trik%20Menggunakan%20Nmap%20Efektif.md)
- [Penutup](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Penutup.md)
  
> Jika repositori ini merasa bermanfaat, tolong beri repositori ini star (⭐) agar semua orang bisa menemukan repositori ini juga terima kasih.

**Rofi (Fixploit03)**
