# Pendahuluan

## A. Mengenal Dunia Keamanan Jaringan

Dalam era digital yang semakin berkembang pesat, keamanan jaringan menjadi salah satu aspek krusial dalam perlindungan data dan sistem. Setiap hari, berbagai sistem terhubung melalui internet dan jaringan lokal, mulai dari server perusahaan, perangkat IoT, hingga infrastruktur kritikal seperti sistem perbankan dan kesehatan. Dengan meningkatnya konektivitas ini, muncul pula berbagai ancaman keamanan seperti serangan siber, peretasan, dan eksploitasi kerentanan.

Agar sistem tetap aman, diperlukan pendekatan proaktif dalam mengidentifikasi kelemahan dan celah yang mungkin dimanfaatkan oleh pihak yang tidak bertanggung jawab. Inilah pentingnya dilakukan aktivitas penetration testing (pengujian penetrasi) atau yang biasa disebut `pentest`.

## B. Peran Network Scanning dalam Pentest

Salah satu langkah awal dalam penetration testing adalah melakukan `network reconnaissance` atau pengintaian jaringan, yang bertujuan untuk:

- Menemukan host aktif di jaringan.
- Mengidentifikasi port terbuka dan layanan yang berjalan.
- Menentukan versi layanan dan sistem operasi target.

Tanpa informasi ini, seorang pentester seperti bekerja dalam gelap. Di sinilah tools seperti Nmap berperan sangat penting.

## C. Kenapa Harus Nmap?

Nmap (Network Mapper) adalah alat pemindai jaringan yang sangat populer dan serbaguna, digunakan oleh:

- Administrator jaringan untuk audit dan monitoring.
- Penetration tester untuk persiapan eksploitasi.
- Peneliti keamanan untuk eksplorasi infrastruktur.

Nmap tidak hanya mampu melakukan scanning IP dan port, tapi juga mendeteksi sistem operasi, fingerprint layanan, bahkan menjalankan script otomatis untuk deteksi kerentanan melalui fitur `Nmap Scripting Engine (NSE)`.

## D. Tujuan Panduan Ini

Panduan ini disusun untuk membantu kamu, baik sebagai pemula maupun praktisi, dalam:

- Memahami konsep dasar dan sejarah Nmap.
- Mempelajari cara instalasi dan struktur folder Nmap.
- Menguasai teknik scanning dari dasar hingga lanjutan.
- Menjelajahi fitur scripting dan integrasi Nmap dengan tools lain.
- Mempraktikkan penggunaan Nmap dalam skenario nyata pentesting.

## E. Siapa yang Cocok Membaca Panduan Ini?

- Mahasiswa atau pelajar yang tertarik dengan etical hacking.
- Praktisi IT yang ingin memahami lebih dalam soal keamanan jaringan.
- Penetration tester yang ingin mengoptimalkan penggunaan Nmap.
- Siapa saja yang ingin belajar mengamankan jaringan dan memahami bagaimana jaringan dapat dipetakan oleh pihak luar.

## F. Pengetahuan Dasar yang Dibutuhkan

Untuk memahami panduan ini secara optimal, kamu disarankan memiliki pemahaman dasar tentang:

- Jaringan komputer (`IP`, `subnet`, `port`, `TCP/UDP`).
- Sistem operasi Linux (terutama untuk praktik menggunakan terminal).
- Konsep dasar keamanan informasi.

Namun, kamu tidak perlu khawatir, setiap konsep teknis akan dijelaskan secara langkah demi langkah dengan bahasa yang mudah dipahami.

## Siap untuk Belajar Nmap?

Mari mulai petualangan ini dengan mengenal terlebih dahulu:

> [Apa Itu Nmap?](https://github.com/fixploit03/Belajar-Nmap/blob/main/resource/Apa%20Itu%20Nmap%3F.md)
