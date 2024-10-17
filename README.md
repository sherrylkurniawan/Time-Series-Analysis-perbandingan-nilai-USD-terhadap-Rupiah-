# Analisis Perkembangan Nilai Jual Mata Uang USD terhadapNilai Jual Mata Uang Rupiah berdasarkan Time Series
-------

# DESKRIPSI 
Proyek ini menganalisis perkembangan nilai tukar USD terhadap Rupiah menggunakan berbagai model Time Series. Dataset yang digunakan mencakup data dari Januari 2023 hingga Mei 2024, yang bersumber dari Bank Indonesia sebanyak 513 data. Analisis ini mengeksplorasi beberapa model, termasuk ARIMA, Naive Model, Double Moving Average (DMA), Double Exponential Smoothing (DES), dan Neural Network, untuk menemukan model terbaik dalam prediksi yang akurat.

# TUJUAN 
1. Memprediksi nilai tukar USD dan IDR di masa depan menggunakan analisis permodelan Time Series,
2. Memberikan wawasan tentang model mana yang memberikan prediksi paling akurat berdasarkan metrik MAPE dan RMSE

# ALUR KERJA 
1. Pengumpulan Data: Mengumpulkan data nilai tukar dari dataset terbuka Bank Indonesia, yang telah dikumpulkan sebanyak 513 data dengan periode Januari 2023 hingga Mei 2024.
2. Pemodelan: Menerapkan lima model Time Series (ARIMA, Naive Model, DMA, DES, Neural Network) dengan percobaan beberapa parameter untuk memprediksi tren nilai tukar.
3. Evaluasi: Mengevaluasi akurasi setiap model menggunakan metrik seperti RMSE dan MAPE, dan membandingkannya untuk mengidentifikasi model yang paling unggul.

# KESIMPULAN 
Dari 5 permodel Time Series yang diuji, Neural Network dengan konfigurasi tertentu memberikan hasil paling akurat, menjadikannya model terbaik untuk memprediksi nilai tukar USD/IDR. Double Exponential Smoothing juga efektif, meskipun dengan akurasi yang sedikit lebih rendah.

# Tim 
- Sherryl Kurniawan
- Nayla Anandhita Darmawan
