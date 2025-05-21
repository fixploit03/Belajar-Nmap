# Scan Port dan Host Lebih Lanjut

`Nmap` bukan hanya untuk pemindaian dasar. Dalam praktik keamanan jaringan dan penetration testing, kita sering dihadapkan pada kebutuhan untuk:
- Memindai port tertentu saja
- Memindai banyak host dalam satu jaringan
- Menghindari deteksi oleh `IDS/IPS` (`Intrusion Detection/Prevention Systems`)

Bagian ini membahas teknik pemindaian lanjutan untuk port dan host, serta bagaimana melakukan `stealth scan` dan `evasion` untuk tetap tidak terdeteksi.

## A. Scan Port Tertentu dan Range Port

Secara default, `Nmap` akan memindai `1.000` port paling umum (`well-known ports`). Namun kita bisa menentukan port spesifik atau rentang port tertentu.

**1. Contoh Scan Port Tertentu**

```
nmap -p 80 192.168.1.10
```

Memindai port `80` saja pada host `192.168.1.10`

```
nmap -p 22,80,443 192.168.1.10
```
    
Memindai port `22`, `80`, dan `443` secara spesifik

**2. Contoh Scan Range Port**

```
nmap -p 1-1000 192.168.1.10
```

Memindai port `1` hingga `1000`

**3. Gabungan `Port` + `Range`**

```
nmap -p 21-25,80,110,443 192.168.1.10
```

Memindai port dari `21` sampai `25`, dan juga port `80`, `110`, dan `443`

## B. Scan Multiple Host dan Subnet

`Nmap` sangat fleksibel untuk scan banyak host sekaligus. Kamu bisa menggunakan format `IP list`, `range`, `subnet`, bahkan `file`.

**1. Scan Banyak Host Sekaligus**

```
nmap 192.168.1.1 192.168.1.2 192.168.1.3
```

**2. Gunakan Range IP**

```
nmap 192.168.1.1-50
```

Memindai host dari `192.168.1.1` hingga `192.168.1.50`

**3. Gunakan CIDR/Subnet**

```
nmap 192.168.1.0/24
```

Memindai seluruh subnet `/24` (yaitu `192.168.1.1` sampai `192.168.1.254`)

**4. Dari File List**

```
nmap -iL target.txt
```
    
Memindai semua `IP/host` yang tercantum dalam file `target.txt`

## C. Teknik Stealth Scan dan Evasion Techniques

Dalam situasi nyata (`real-world pentest`), kamu mungkin tidak ingin terdeteksi oleh sistem keamanan target. `Nmap` menyediakan beberapa teknik untuk menyembunyikan aktivitas pemindaian:

**1. SYN Scan (Stealth Scan)**

```
nmap -sS 192.168.1.10
```

`Half-open scan` (hanya mengirim `SYN` tanpa menyelesaikan koneksi). Ini adalah teknik `stealth` paling umum karena tidak menyelesaikan `three-way handshake`.

**2. UDP Scan**

```
nmap -sU 192.168.1.10
```

Digunakan untuk mendeteksi layanan `UDP`. Biasanya lebih lambat dan sering diblokir `firewall`.

**3. Scan dengan Decoy (Kamus IP Palsu)**

```
nmap -D RND:5 192.168.1.10
```

Menambahkan `5` IP acak sebagai kamuflase untuk menyembunyikan IP asli kita.

**4. Scan Tanpa DNS Resolution**

```
nmap -n 192.168.1.10
```

Menghindari deteksi lewat `DNS lookup`.

**5. Mengatur Waktu Scan (Timing)**

```
nmap -T2 192.168.1.10
```
    
Mode `-T2` = lebih lambat dan `stealthy`. Mode `-T0` hingga `-T5`, semakin tinggi semakin cepat, tapi juga lebih mudah terdeteksi.

**6. Fragmentasi Paket**

```
nmap -f 192.168.1.10
```

Membagi paket menjadi fragmen kecil agar lebih sulit dideteksi oleh `IDS/IPS`.

## Catatan Penting
- Teknik `evasive` tidak selalu efektif terhadap semua `firewall` atau `IDS`. Sistem keamanan modern sering mampu mengenali pola-pola aneh.
- Etika dan legalitas sangat penting. Jangan pernah melakukan scanning pada jaringan tanpa izin.
