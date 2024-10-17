# Analisis Perkembangan Nilai Jual Mata Uang USD terhadapNilai Jual Mata Uang Rupiah berdasarkan Time Series
-------

# DESKRIPSI 
Proyek ini menganalisis perkembangan nilai tukar USD terhadap Rupiah menggunakan berbagai model Time Series. Dataset yang digunakan mencakup data dari Januari 2023 hingga Mei 2024, yang bersumber dari Bank Indonesia sebanyak 513 data. Analisis ini mengeksplorasi beberapa model, termasuk ARIMA, Naive Model, Double Moving Average (DMA), Double Exponential Smoothing (DES), dan Neural Network, untuk menemukan model terbaik dalam prediksi yang akurat.

# TUJUAN 
1. Memprediksi nilai tukar USD dan IDR di masa depan menggunakan analisis permodelan Time Series,
2. Memberikan wawasan tentang model mana yang memberikan prediksi paling akurat berdasarkan metrik MAPE dan RMSE
3. Memberikan wawasan yang dapat membantu investor dan pengambil keputusan memahami tren nilai tukar di masa depan.

# ALUR KERJA 
- Data Collection:
   - Data nilai tukar USD terhadap Rupiah dikumpulkan dari Bank Indonesia untuk periode Januari 2023 hingga Mei 2024.
- Preprocessing:
   - Melakukan pembersihan dan pembagian data menjadi data training (90%) dan testing (10%).
- Modeling:
   - Menerapkan beberapa model Time Series:
     - ARIMA
     - Naive Model
     - Double Moving Average (DMA)
     - Double Exponential Smoothing (DES)
     - Neural Network
- Evaluation:
    - Evaluasi dilakukan menggunakan metrik akurasi seperti RMSE dan MAPE untuk membandingkan kinerja model.
- Model Selection:
    - Memilih model terbaik berdasarkan hasil evaluasi dan akurasi pada data testing.

# KESIMPULAN 
Berdasarkan hasil analisis, model Neural Network dengan jumlah input sebanyak 6 dan jumlah hidden layer sebanyak 3 [NN(6,3)] terbukti menjadi pilihan terbaik untuk memprediksi nilai tukar USD terhadap Rupiah. Model Double Exponential Smoothing juga menunjukkan performa yang baik dengan tingkat akurasi yang tinggi. Proyek ini memberikan panduan berharga dalam memilih model Time Series yang optimal untuk analisis nilai tukar mata uang.

# Tim 
- Sherryl Kurniawan
- Nayla Anandhita Darmawan
