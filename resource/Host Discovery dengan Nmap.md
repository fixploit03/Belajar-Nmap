# Host Discovery dengan Nmap

## Pendahuluan

Sebelum melakukan `scanning port` atau `service`, kita perlu mengetahui host mana saja yang aktif di jaringan. Proses ini disebut `host discovery`, dan `Nmap` menyediakan berbagai metode untuk mendeteksi apakah suatu host sedang hidup (`up`) atau tidak (`down`).

## Tujuan Host Discovery
- Menentukan target yang benar-benar aktif.
- Menghindari waktu dan sumber daya untuk memindai host yang mati.
- Langkah awal dalam `enumeration jaringan`.

## A. Metode Host Discovery di Nmap

Secara default, ketika kamu menjalankan `Nmap` tanpa opsi scan port, `Nmap` hanya melakukan `host discovery`.

**Default Ping Scan (tanpa opsi)**

```
nmap 192.168.1.0/24
```

Akan mengirim:
- `ICMP Echo Request` (ping)
- `TCP SYN` ke port `443`
- `TCP ACK` ke port `80`
- `ICMP Timestamp Request`

## B. Opsi Khusus untuk Host Discovery

| Opsi | Nama	| Keterangan |
|:--:|:--:|:--:|
| `-sn`	| `No port scan` | Hanya lakukan `host discovery` (tanpa scan port). |
| `-Pn`	| `Ping no` | Jangan lakukan `ping`, anggap semua host `up`. |
| `-PS`	| `TCP SYN ping` | Kirim `SYN` ke port tertentu. |
| `-PA`	| `TCP ACK ping` | Kirim `ACK` ke port tertentu. |
| `-PU`	| `UDP ping` | Kirim `UDP` ke port tertentu. |
| `-PE`	| `ICMP Echo` | Kirim `ICMP Echo request`. |
| `-PP`	| `ICMP Timestamp` | Kirim `ICMP timestamp request`. |
| `-PM`	| `ICMP Netmask` | Kirim `ICMP address mask request`. |

## C. Contoh Penggunaan

1. `Ping Scan` Tanpa `Port Scanning`

   ```
   nmap -sn 192.168.1.0/24
   ```

   Digunakan untuk mencari host yang hidup di dalam subnet tanpa scan port.

2. Scan dengan `TCP SYN Ping` (Port `80`)

   ```
   nmap -PS80 192.168.1.1-20
   ```

   Kirim paket `TCP SYN` ke port `80` untuk mendeteksi host aktif.

3. `ICMP Echo Ping` Saja

   ```
   nmap -PE 10.0.0.0/24
   ```

   Kirim `ping klasik (ICMP echo)` ke setiap host.

4. Gabungkan Beberapa Teknik Ping

   ```
   nmap -PE -PS22,80,443 -PU53 192.168.1.0/24
   ```

   Menggabungkan `ICMP`, `TCP SYN` ke port `22/80/443`, dan `UDP` ke port `53`.

5. Lewati `Host Discovery`

   ```
   nmap -Pn target.com
   ```

   Langsung lakukan scan meskipun host tidak merespons ping (berguna untuk host yang dibelakang firewall).

## Kapan Menggunakan Opsi Tertentu?

| Skenario | Opsi yang Disarankan |
|:--:|:--:|
| Host dibelakang firewall | `-Pn` atau `-PS443` |
| Host hanya merespons `ICMP` | `-PE` |
| Jaringan besar, ping saja | `-sn` |
| Port tertentu dibuka | `-PS<port>`, `-PA<port>` |

## Output Contoh

```
$ nmap -sn 192.168.1.0/24

Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-27 05:08 WIB
Nmap scan report for 192.168.1.1
Host is up (0.0057s latency).
MAC Address: 68:58:11:25:43:20 (Fiberhome Telecommunication Technologies)
Nmap scan report for 192.168.1.3
Host is up (0.074s latency).
MAC Address: 90:D4:73:EB:B7:22 (vivo Mobile Communication)
Nmap scan report for 192.168.1.6
Host is up (0.078s latency).
MAC Address: E2:BC:EF:24:5A:4E (Unknown)
Nmap scan report for 192.168.1.7
Host is up (0.046s latency).
MAC Address: 6A:B5:A6:F7:5F:D6 (Unknown)
Nmap scan report for 192.168.1.10
Host is up (0.00050s latency).
MAC Address: 08:00:27:73:F9:94 (PCS Systemtechnik/Oracle VirtualBox virtual NIC)
Nmap scan report for 192.168.1.13
Host is up (0.10s latency).
MAC Address: 8E:72:04:67:85:25 (Unknown)
Nmap scan report for 192.168.1.11
Host is up.
Nmap done: 256 IP addresses (7 hosts up) scanned in 3.13 seconds
```

## Tips Tambahan
- Gunakan `-v` atau `-vv` untuk melihat info lebih detail saat scan berjalan.
- Gunakan `-n` untuk skip `DNS resolution` jika tidak diperlukan, mempercepat proses.
- Tambahkan `-oG` atau `-oN` untuk menyimpan hasil scan ke file.

## Catatan Keamanan

Beberapa `firewall` atau `IDS (Intrusion Detection System)` akan mendeteksi dan memblokir `ping` atau `SYN scan`. Dalam kasus seperti itu:
- Gunakan teknik `stealth scan`.
- Gunakan kombinasi `-Pn` dan `-sS`.
- Lakukan `footprinting pasif` sebelum aktif scanning.

## Kesimpulan

`Host Discovery` adalah tahap krusial dalam `penetration testing` menggunakan `Nmap`. Dengan teknik-teknik ini, kamu bisa dengan cepat:
- menentukan target yang aktif.
- menyusun strategi scanning.
- menghindari pemborosan waktu pada host yang mati.
