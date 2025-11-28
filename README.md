# Industrial-Pharma-Quality-Data-and-AI-Portfolio
Optimizing  Industrial and Pharmaceutical  Quality &amp; Production processes using SQL, Python, and AI. Bridging Chemical Engineering domain knowledge with Data Science.
## 🚜 Proje 1: SQL ile Tarımsal Üretim Verisi Analizi (USDA Capstone)

**Proje Başlığı:** Çoklu Emtia Üretim Verilerinin Veritabanı Yönetimi ve Analizi
**Tarih:** Kasım 2025
**Kullanılan Araçlar:** SQL (SQLite), DBeaver, Data Cleaning Functions

### 1. Proje Özeti
Amerikan Tarım Bakanlığı'nın (USDA) açık veri portalından alınan Peynir, Süt, Bal, Kahve, Yumurta ve Yoğurt üretim verilerini analiz ettim. Ham verileri (CSV) yerel bir veritabanı ortamına (DBeaver/SQLite) taşıyarak, üretim trendlerini ve eyaletler arası ilişkileri inceleyen karmaşık sorgular yazdım.

### 2. Karşılaşılan Zorluklar ve Teknik Çözümler
* **Veri Tipi ve Format Sorunları (Data Cleaning):** Kaynak verideki sayısal değerler "metin" (string) formatında ve virgüllü (Örn: "1,000") geliyordu. Bu durum matematiksel hesaplamaları imkansız kılıyordu.
    * *Çözüm:* `REPLACE` ve `CAST` fonksiyonlarını iç içe kullanarak tüm tablolardaki virgülleri temizledim ve verileri güvenli bir şekilde sayısal (INTEGER) formata dönüştürdüm.
* **Veri Bütünlüğü:** Farklı tablolardaki (Örn: Peynir ve Yoğurt) verileri birleştirirken satır çoğalması (row explosion) riskini yönetmek için `DISTINCT` ve Alt Sorgular (Subqueries) kullandım.

### 3. Yapılan Analizler
* **Aggregation (Toplulaştırma):** Yıllık toplam üretim (SUM) ve ortalama üretim (AVG) hesaplamalarıyla sektörlerin büyüme/küçülme trendlerini belirledim.
* **JOINs & Kesişimler:** `INNER JOIN` ve `LEFT JOIN` kullanarak, belirli bir dönemde (Örn: Nisan 2023) hem süt hem bal üreten eyaletleri tespit ettim.
* **Filtreleme:** `EXCEPT` veya `NOT IN` mantığıyla, belirli üretim kriterlerini sağlamayan eyaletleri raporladım.
