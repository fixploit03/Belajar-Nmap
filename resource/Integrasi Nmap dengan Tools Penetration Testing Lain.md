# Integrasi Nmap dengan Tools Penetration Testing Lain

`Nmap` tidak hanya berguna sebagai `port scanner`, tetapi juga dapat diintegrasikan dengan berbagai tools lain dalam proses `penetration testing` untuk memperluas kapabilitasnya. Dengan integrasi ini, kamu bisa mempercepat workflow, meningkatkan akurasi deteksi, dan melakukan eksploitasi secara lebih efisien.

## A. Menggunakan Nmap Bersama Metasploit

`Metasploit Framework` menyediakan fitur untuk mengimpor hasil scan dari `Nmap` dan langsung menggunakannya untuk eksploitasi. Hal ini sangat efisien untuk `pivoting` dari fase `scanning` ke fase `exploitation`.

**Langkah-langkah Integrasi:**

1. Scan menggunakan `Nmap` dan simpan output `XML`:

   ```
   nmap -sS -sV -T4 -O -oX hasil_scan.xml 192.168.1.0/24
   ```

2. Buka `Metasploit Console`:

   ```
   msfconsole
   ```

3. Import hasil scan:

   ```
   db_import hasil_scan.xml
   ```

4. Lihat hasil host yang ditemukan:

   ```
   hosts
   ```

5. Lihat service yang berjalan:

   ```
   services
   ```

6. Cari exploit berdasarkan service:
 
   ```
   search type:exploit name:apache
   ```

7. Gunakan exploit:

   ```
   use exploit/windows/smb/ms17_010_eternalblue
   ```

## B. Integrasi dengan Nikto dan Dirb

Menggunakan hasil dari `Nmap` untuk mengarahkan `scan web` menggunakan `Nikto` (`scanner kerentanan web`) atau `Dirb` (`web content scanner`).

**1. Contoh Integrasi dengan Nikto**

Setelah menemukan port `80/443` terbuka:

```
nikto -h http://192.168.1.10
```

Kamu juga bisa mengotomatisasikan menggunakan hasil `Nmap`:

```sh
#!/bin/bash
nmap -p 80,443 --open -oG web_hosts.txt 192.168.1.0/24
for ip in $(grep open web_hosts.txt | cut -d " " -f 2); do
    nikto -h http://$ip
done
```

**2. Contoh Integrasi dengan Dirb**

```
dirb http://192.168.1.10
```

Atau dengan otomatisasi:

```sh
#!/bin/bash
for ip in $(grep open web_hosts.txt | cut -d " " -f 2); do
    dirb http://$ip
done
```

## C. Otomatisasi dengan Skrip

`Nmap` sangat cocok digunakan bersama `Bash` atau `Python` untuk mengotomatisasi proses `scanning` dan `eksploitasi`.

**Contoh Bash Script Otomatisasi:**

```sh
#!/bin/bash
# Scan subnet dan jalankan Nikto jika ditemukan web server

nmap -p 80,443 --open -oG webhosts.txt 192.168.1.0/24

for ip in $(grep open webhosts.txt | cut -d " " -f 2); do
    echo "Scanning $ip dengan Nikto..."
    nikto -h http://$ip -output "nikto_$ip.txt"
done
```

**Contoh Python Otomatisasi:**

```py
import os

with open("webhosts.txt") as f:
    for line in f:
        if "open" in line:
            ip = line.split()[1]
            print(f"[+] Scanning {ip} with Nikto")
            os.system(f"nikto -h http://{ip} -output nikto_{ip}.txt")
```

## Tips Efisien
- Gunakan `-oX` di `Nmap` untuk integrasi otomatis ke tools seperti `Metasploit`, `Faraday`, atau `Dradis`.
- Gunakan `--script http-*` di Nmap untuk mengefisienkan fase `scanning web` sebelum lanjut ke `Nikto` atau `Dirb`.
- Gabungkan `Nmap` + `Bash` + `tools lain` untuk membangun `custom recon pipeline`.
