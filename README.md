# NONPROBABILITY SURVEY TUGAS 2

# Survei Tingkat Kepuasan Mahasiswa Program Studi Statistika terhadap Penggunaan Google Scholar dalam Pencarian Jurnal Ilmiah

---

# Latar Belakang

Google Scholar merupakan salah satu platform pencarian jurnal ilmiah yang paling banyak digunakan oleh mahasiswa dalam menunjang kegiatan akademik. Platform ini menyediakan berbagai referensi ilmiah seperti jurnal, artikel penelitian, prosiding, dan skripsi yang dapat diakses secara online dengan mudah dan cepat.

Dalam proses perkuliahan, mahasiswa membutuhkan sumber referensi ilmiah untuk membantu penyusunan tugas, laporan praktikum, proposal penelitian, hingga skripsi. Google Scholar menjadi pilihan utama karena memiliki cakupan referensi yang luas dan kemudahan akses.

Namun, dalam penggunaannya masih terdapat beberapa kendala seperti hasil pencarian yang terlalu banyak, tidak semua jurnal dapat diakses secara penuh, serta tingkat relevansi hasil pencarian yang terkadang kurang sesuai dengan topik yang dicari.

Oleh karena itu, penelitian ini dilakukan untuk mengetahui tingkat kepuasan mahasiswa Program Studi Statistika terhadap penggunaan Google Scholar sebagai media pencarian jurnal ilmiah.

---

# Tujuan

Tujuan penelitian ini adalah:

- Mengetahui tingkat kepuasan mahasiswa terhadap penggunaan Google Scholar.
- Mengetahui distribusi responden berdasarkan jenis kelamin dan semester.
- Menghitung hasil naive estimation terhadap tingkat kepuasan mahasiswa.
- Melakukan weighting sederhana berdasarkan jenis kelamin.
- Menguji validitas dan reliabilitas instrumen penelitian.

---

# Metode

Penelitian ini merupakan penelitian kuantitatif dengan pendekatan survei online. Data diperoleh melalui penyebaran kuesioner menggunakan Google Form kepada mahasiswa Program Studi Statistika.

Teknik sampling yang digunakan adalah non probability sampling dengan metode convenience sampling, yaitu pengambilan sampel berdasarkan kemudahan memperoleh responden.

Jumlah populasi dalam penelitian ini sebanyak 154 mahasiswa. Penentuan jumlah sampel dilakukan menggunakan rumus Slovin dengan tingkat kesalahan 15%.


# Variabel Penelitian

| Variabel | Keterangan |
|---|---|
| Semester | Tingkat semester responden |
| Jenis Kelamin | Laki-laki / perempuan |
| x1 | Kemudahan akses Google Scholar |
| x2 | Kemudahan mencari jurnal |
| x3 | Kecepatan hasil pencarian |
| x4 | Kesesuaian hasil pencarian |
| x5 | Banyaknya pilihan jurnal |
| x6 | Manfaat untuk tugas/penelitian |
| y | Kepuasan keseluruhan |

---

# Link Kuesioner

https://forms.gle/VHFJ2z83TLsiU7hy7

---

# Syntax Analisis Data Menggunakan R

## 1. Import Data

```r
library(readxl)

data <- read_excel("C:/Users/ASUS/Documents/abel/teksam fiks.xlsx")
```

---

## 2. Rename Variabel

```r
names(data)[6] <- "x1"
names(data)[7] <- "x2"
names(data)[8] <- "x3"
names(data)[9] <- "x4"
names(data)[10] <- "x5"
names(data)[11] <- "x6"
names(data)[12] <- "y"
```

---

## 3. Analisis Deskriptif

```r
table(data$`jenis Kelamin`)
prop.table(table(data$`jenis Kelamin`))*100

table(data$Semester)
prop.table(table(data$Semester))*100
```

---

## 4. Mean

```r
mean(data$x1)
mean(data$x2)
mean(data$x3)
mean(data$x4)
mean(data$x5)
mean(data$x6)
mean(data$y)
```

---

## 5. Standard Deviation

```r
sd(data$x1)
sd(data$x2)
sd(data$x3)
sd(data$x4)
sd(data$x5)
sd(data$x6)
sd(data$y)
```

---

## 6. Grafik Distribusi

```r
barplot(
  table(data$`jenis Kelamin`),
  main = "Distribusi Responden Berdasarkan Jenis Kelamin",
  col = "lightblue"
)

barplot(
  table(data$Semester),
  main = "Distribusi Responden Berdasarkan Semester",
  col = "lightgreen"
)
```

---

## 7. Naive Estimation

```r
puas <- sum(data$y >= 4)

n <- nrow(data)

naive <- puas/n

naive
naive*100
```

---

## 8. Weighting Sederhana

```r
prop_pop <- 0.50
prop_sample <- 0.147

w <- prop_pop/prop_sample

w
```

---

## 9. Perhitungan Rumus Slovin

Rumus Slovin digunakan untuk menentukan jumlah sampel minimum dari suatu populasi.

### Rumus Slovin

```text
n = N / (1 + N(e²))
```

Keterangan:
- n = jumlah sampel
- N = jumlah populasi
- e = tingkat kesalahan

---

## 9. Uji Validitas

```r
library(psych)

item <- data[,c("x1","x2","x3","x4","x5","x6")]

score_total <- rowSums(item)

cor(item$x1, score_total)
cor(item$x2, score_total)
cor(item$x3, score_total)
cor(item$x4, score_total)
cor(item$x5, score_total)
cor(item$x6, score_total)
```

---

## 10. Uji Reliabilitas

```r
alpha(item)
```

---

# Hasil dan Pembahasan

## Analisis Deskriptif

Analisis deskriptif dilakukan untuk mengetahui distribusi responden berdasarkan jenis kelamin dan semester.

### Distribusi Jenis Kelamin

| Jenis Kelamin | Frekuensi | Persentase |
|---|---|---|
| Laki-laki | 5 | 14.7% |
| Perempuan | 29 | 85.3% |
| Total | 34 | 100% |

Berdasarkan hasil survei, mayoritas responden dalam penelitian ini adalah perempuan sebanyak 29 responden atau 85,3%, sedangkan laki-laki sebanyak 5 responden atau 14,7%. Hasil ini menunjukkan bahwa distribusi sampel tidak seimbang sehingga persepsi responden lebih banyak merepresentasikan kelompok perempuan.

---

### Distribusi Semester

| Semester | Frekuensi | Persentase |
|---|---|---|
| Semester 2 | 5 | 14.7% |
| Semester 4 | 26 | 76.5% |
| Semester 6 | 3 | 8.8% |
| Total | 34 | 100% |

Mayoritas responden berasal dari semester 4 sebanyak 26 responden atau 76,5%. Hal ini menunjukkan bahwa responden didominasi oleh mahasiswa tingkat menengah yang sudah cukup familiar menggunakan Google Scholar dalam kegiatan akademik.

---
## Analisis Mean dan Standard Deviation

| Variabel | Mean | Standard Deviation |
|---|---|---|
| x1 | 4.12 | 0.64 |
| x2 | 3.74 | 0.75 |
| x3 | 4.03 | 0.72 |
| x4 | 3.44 | 0.70 |
| x5 | 3.65 | 0.73 |
| x6 | 4.00 | 0.65 |
| y | 3.79 | 0.73 |

Hasil mean menunjukkan bahwa seluruh variabel memiliki nilai rata-rata di atas 3 sehingga responden cenderung memberikan penilaian positif terhadap penggunaan Google Scholar. Variabel x1 memiliki nilai mean tertinggi yang menunjukkan bahwa Google Scholar dinilai mudah diakses oleh mahasiswa.

Sementara itu, nilai standard deviation yang relatif kecil menunjukkan bahwa jawaban responden cenderung homogen atau tidak terlalu bervariasi.

## Grafik Distribusi Responden

### Grafik Jenis Kelamin

![Grafik Gender](output/grafik-gender.png)

Grafik menunjukkan bahwa jumlah responden perempuan lebih mendominasi dibandingkan laki-laki.

---

### Grafik Semester

![Grafik Semester](output/grafik-semester.png)

Grafik menunjukkan bahwa mayoritas responden berasal dari semester 4.

---

## Naive Estimation

Naive estimation digunakan untuk menghitung estimasi awal tingkat kepuasan mahasiswa terhadap penggunaan Google Scholar.

Berdasarkan hasil analisis diperoleh:
- Jumlah responden puas = 26 orang
- Total responden = 34 orang

Hasil naive estimation menunjukkan sebesar 76,47% mahasiswa merasa puas terhadap penggunaan Google Scholar dalam pencarian jurnal ilmiah.

---

## Weighting Sederhana

Weighting sederhana dilakukan untuk mengurangi bias akibat ketidakseimbangan jumlah responden berdasarkan jenis kelamin.

Hasil weighting menunjukkan nilai sebesar:

```text
w = 3,401
```

Hasil ini menunjukkan bahwa terdapat ketidakseimbangan proporsi sampel sehingga pembobotan diperlukan agar hasil estimasi lebih representatif terhadap populasi.

---
## Perbandingan Estimasi

Perbandingan estimasi dilakukan untuk melihat perbedaan hasil antara naive estimation dan weighting sederhana dalam mengestimasi tingkat kepuasan mahasiswa terhadap penggunaan Google Scholar.

| Metode | Hasil |
|---|---|
| Naive Estimation | 76,47% |
| Weighting Sederhana | 3,401 |

Berdasarkan hasil analisis, naive estimation menunjukkan bahwa sebesar 76,47% mahasiswa merasa puas terhadap penggunaan Google Scholar dalam pencarian jurnal ilmiah. Sementara itu, hasil weighting sederhana sebesar 3,401 menunjukkan adanya ketidakseimbangan distribusi responden berdasarkan jenis kelamin.

Perbedaan tersebut menunjukkan bahwa distribusi sampel yang tidak seimbang dapat memengaruhi hasil estimasi penelitian. Oleh karena itu, weighting digunakan untuk membantu memperoleh hasil estimasi yang lebih representatif terhadap populasi sebenarnya.

------
## rumus slovin
Diketahui:
- N = 154
- e = 15% = 0,15

### Perhitungan

```text
n = 154 / (1 + 154(0,15²))

n = 154 / (1 + 154(0,0225))

n = 154 / (1 + 3,465)

n = 154 / 4,465

n = 34,49
```

Berdasarkan hasil perhitungan menggunakan rumus Slovin diperoleh jumlah sampel minimal sebanyak 34,49 responden. Karena jumlah sampel harus berupa bilangan bulat, maka jumlah sampel dibulatkan menjadi 34 responden.


## Uji Validitas

Uji validitas dilakukan untuk mengetahui apakah item pertanyaan mampu mengukur variabel penelitian dengan baik.

Hasil pengujian menunjukkan bahwa seluruh item pertanyaan memiliki korelasi positif terhadap skor total sehingga item pertanyaan dinyatakan valid.

---

## Uji Reliabilitas

Uji reliabilitas dilakukan menggunakan metode Cronbach Alpha.

Hasil pengujian menunjukkan bahwa nilai Cronbach Alpha berada di atas 0,70 sehingga instrumen penelitian dinyatakan reliabel dan memiliki konsistensi yang baik.

---

# Kesimpulan

Berdasarkan hasil analisis data yang telah dilakukan, dapat disimpulkan bahwa:

1. Mahasiswa Program Studi Statistika secara umum memiliki tingkat kepuasan yang cukup tinggi terhadap penggunaan Google Scholar.

2. Kemudahan akses dan kecepatan pencarian menjadi aspek yang paling disukai oleh responden.

3. Hasil naive estimation menunjukkan bahwa sekitar 76,47% responden merasa puas terhadap penggunaan Google Scholar.

4. Hasil weighting menunjukkan adanya ketidakseimbangan sampel berdasarkan jenis kelamin sehingga pembobotan diperlukan agar hasil lebih representatif.

5. Hasil uji validitas menunjukkan bahwa seluruh item pertanyaan valid, sedangkan hasil uji reliabilitas menunjukkan bahwa instrumen penelitian reliabel.

---
