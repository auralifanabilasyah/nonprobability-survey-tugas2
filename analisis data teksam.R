# =========================================================
# ANALISIS NON PROBABILITY SURVEY
# Tingkat Kepuasan Mahasiswa terhadap Google Scholar
# =========================================================


# =========================================================
# 1. IMPORT DATA
# =========================================================

library(readxl)
library(psych)

data <- read_excel("C:/Users/ASUS/Documents/abel/teksam fiks.xlsx")


# =========================================================
# 2. RENAME VARIABEL
# =========================================================

names(data)[6]  <- "x1"
names(data)[7]  <- "x2"
names(data)[8]  <- "x3"
names(data)[9]  <- "x4"
names(data)[10] <- "x5"
names(data)[11] <- "x6"
names(data)[12] <- "y"


# =========================================================
# 3. ANALISIS DESKRIPTIF
# =========================================================

# Distribusi Jenis Kelamin
table(data$`jenis Kelamin`)
prop.table(table(data$`jenis Kelamin`)) * 100

# Distribusi Semester
table(data$Semester)
prop.table(table(data$Semester)) * 100


# =========================================================
# 4. MEAN
# =========================================================

mean(data$x1)
mean(data$x2)
mean(data$x3)
mean(data$x4)
mean(data$x5)
mean(data$x6)
mean(data$y)


# =========================================================
# 5. STANDARD DEVIATION
# =========================================================

sd(data$x1)
sd(data$x2)
sd(data$x3)
sd(data$x4)
sd(data$x5)
sd(data$x6)
sd(data$y)


# =========================================================
# 6. GRAFIK DISTRIBUSI RESPONDEN
# =========================================================

# Grafik Jenis Kelamin
barplot(
  table(data$`jenis Kelamin`),
  main = "Distribusi Responden Berdasarkan Jenis Kelamin",
  col = "lightblue"
)

# Grafik Semester
barplot(
  table(data$Semester),
  main = "Distribusi Responden Berdasarkan Semester",
  col = "lightgreen"
)


# =========================================================
# 7. NAIVE ESTIMATION
# =========================================================

# Menghitung jumlah responden puas
puas <- sum(data$y >= 4)

# Menghitung total responden
n <- nrow(data)

# Menghitung naive estimation
naive <- puas/n

# Hasil naive estimation
naive
naive * 100


# =========================================================
# 8. WEIGHTING SEDERHANA
# =========================================================

# Proporsi populasi
prop_pop <- 0.50

# Proporsi sampel
prop_sample <- 0.147

# Menghitung weighting
w <- prop_pop/prop_sample

# Hasil weighting
w


# =========================================================
# 9. GRAFIK PERBANDINGAN HASIL ESTIMASI
# =========================================================

# Data estimasi
estimasi <- c(76.47, 3.401)

# Membuat grafik
barplot(
  estimasi,
  names.arg = c("Naive Estimation", "Weighting"),
  col = c("lightblue", "lightgreen"),
  main = "Perbandingan Hasil Estimasi",
  ylab = "Nilai"
)

# Menambahkan label nilai
text(
  x = c(0.7, 1.9),
  y = estimasi + 3,
  labels = round(estimasi, 2)
)


# =========================================================
# 10. PERHITUNGAN RUMUS SLOVIN
# =========================================================

# Diketahui
N <- 154
e <- 0.15

# Rumus Slovin
n_slovin <- N / (1 + N * (e^2))

# Hasil Slovin
n_slovin


# =========================================================
# 11. UJI VALIDITAS
# =========================================================

# Mengambil item pertanyaan
item <- data[, c("x1","x2","x3","x4","x5","x6")]

# Menghitung skor total
score_total <- rowSums(item)

# Korelasi item dengan skor total
cor(item$x1, score_total)
cor(item$x2, score_total)
cor(item$x3, score_total)
cor(item$x4, score_total)
cor(item$x5, score_total)
cor(item$x6, score_total)


# =========================================================
# 12. UJI RELIABILITAS
# =========================================================

alpha(item)