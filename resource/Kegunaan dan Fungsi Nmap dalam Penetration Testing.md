#  Kegunaan dan Fungsi Nmap dalam Penetration Testing

## A. Tujuan Penggunaan Nmap dalam Penetration Testing
- Mengumpulkan informasi awal tentang jaringan target (`information gathering`).
- Menentukan permukaan serangan (`attack surface`) melalui deteksi `port` dan `layanan terbuka`.
- Mengidentifikasi kerentanan layanan secara langsung menggunakan `script NSE`.
- Merancang strategi eksploitasi berdasarkan hasil pemindaian.

## B. Fungsi-Fungsi Utama Nmap dalam Pentest

- **1. Host Discovery (Menemukan Host Aktif)**  
  
  `Tujuan`: Menemukan perangkat yang aktif di jaringan.

  **Contoh:**

  ```
  nmap -sn 192.168.1.0/24
  ```

- **2. Port Scanning (Pemindaian Port)**  
  
  `Tujuan`: Mengetahui port mana yang terbuka dan layanan apa yang berjalan.

  **Contoh:**

  ```
  nmap -sS 192.168.1.10
  ```

- **3. Service & Version Detection**  
  
  `Tujuan`: Mengidentifikasi layanan beserta versinya.

  **Contoh:**

  ```
  nmap -sV 192.168.1.10
  ```

- **4. OS Detection**  
  
  `Tujuan`: Mengetahui sistem operasi yang digunakan target.

  **Contoh:**

  ```
  nmap -O 192.168.1.10
  ```

- **5. Aggressive Scan (Pemindaian Agresif)**  
  
  `Tujuan`: Melakukan deteksi lengkap termasuk `traceroute`, `OS`, `layanan`, dan `script NSE`.

  **Contoh:**

  ```
  nmap -A 192.168.1.10
  ```

- **6. Nmap Scripting Engine (NSE)**  
  
  `Tujuan`: Melakukan otomatisasi scanning, deteksi `kerentanan`, `bruteforce login`, `dll`.

  **Contoh:**

  ```
  nmap --script=vuln 192.168.1.10
  ```

## C. Contoh Penggunaan Nmap Berdasarkan Tahapan Pentest

| Tahapan Pentest | Fungsi | Contoh Perintah Nmap |
|:--:|:--:|:--:|
| Discovery | Menemukan host atau perangkat yang aktif di jaringan | `nmap -sn 10.10.10.0/24` |
| Port Scanning | Mendeteksi port-port yang terbuka pada target | `nmap -sS 10.10.10.5` |
| Service Detection | Mengidentifikasi layanan dan versi yang berjalan | `nmap -sV 10.10.10.5` |
| OS Detection | Mengetahui sistem operasi yang digunakan oleh target | `nmap -O 10.10.10.5` |
| Vulnerability Scan | Mendeteksi kerentanan menggunakan `script NSE` | `nmap --script=vuln 10.10.10.5` |

## D. Kelebihan Nmap dalam Dunia Pentest
- `Open-source` & `gratis`, Dapat digunakan bebas tanpa lisensi.
- Kompatibel dengan banyak sistem operasi.
- Cepat dan efisien, bisa digunakan dalam jaringan besar.
- `Scripting engine` (`NSE`) sangat fleksibel dan powerfull.
- Didukung banyak tools lain, seperti `Metasploit` dan `Zenmap`.

## E. Integrasi dengan Tools Lain
| Tool | Fungsi dalam Integrasi dengan Nmap |
|:--:|:--:|
| [Metasploit](https://www.metasploit.com/) | Mengimpor hasil `Nmap` untuk eksploitasi otomatis |
| [Nikto](https://www.cirt.net/Nikto2) | Melanjutkan scanning web service yang ditemukan |
| [Vulners](https://vulners.com/) | Digunakan bersama `NSE` untuk mendeteksi `CVE` secara akurat |
| [Zenmap](https://nmap.org/zenmap/) | `GUI` visual untuk pemula atau analisis jaringan visual |

## F. Kesimpulan
- `Nmap` adalah alat utama dalam `penetration testing`.
- Membantu `pentester` untuk mengidentifikasi dan menganalisis target secara akurat.
- Dengan kombinasi `port scan`, `OS detect`, dan `script NSE`, `Nmap` memberi pondasi yang kuat untuk eksploitasi lebih lanjut.
