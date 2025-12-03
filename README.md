# Industrial-Pharma-Quality-Data-and-AI-Portfolio
Optimizing  Industrial and Pharmaceutical  Quality &amp; Production processes using SQL, Python, and AI. Bridging Chemical Engineering domain knowledge with Data Science.

## 💊 PROJE 1: Google Veri Analitiği (Pharma Quality Case Study)

**Proje Başlığı:** İlaç Üretiminde Kalite Hatalarının Kök Neden Analizi (Root Cause Analysis)
**Tarih:** Kasım 2025
**Kullanılan Araçlar:** Excel (Conditional Formatting, Pivot Tables, Scatter Plots)
**Senaryo:** Pharma-X firmasında, "Aspirin-X" tabletlerinin laboratuvar testlerinden (Dissolution Rate) geçememesi sorunu.

### 1. Proje Özeti (Ön Yazı)
Bir ilaç firmasının üretim hattında artan "Düşük Çözünme Hızı" şikayetlerini inceledim. Üretim parametreleri (Sıcaklık, Karıştırma Hızı) ve hammadde tedarikçileri arasındaki ilişkiyi analiz ederek, kalite testlerindeki başarısızlığın kök nedenini tespit ettim.

### 2. Yapılan Teknik İşlemler
* **Veri Temizleme & Doğrulama:** LIMS/ERP sisteminden gelen ham üretim verilerini Excel'e aktardım. Veri tiplerini (Sayısal vs Kategorik) düzenledim ve eksik veri kontrolü yaptım.
* **Kök Neden Analizi (Root Cause Analysis):**
    * `Granülasyon Sıcaklığı` ile `Çözünme Oranı` arasındaki ters korelasyonu tespit ettim (Sıcaklık arttıkça çözünme düşüyordu).
    * **Pivot Tablolar** kullanarak, hatalı partilerin (Failed Batches) yoğunlukla "Tedarikçi C"den gelen hammaddelerde olduğunu ortaya çıkardım.
* **Görselleştirme:**
    * Sıcaklık ve Kalite arasındaki ilişkiyi göstermek için **Scatter Plot (Dağılım Grafiği)** oluşturdum.
    * Batch başarı oranlarını tedarikçilere göre kıyaslayan sütun grafikleri hazırladım.

### 3. Sonuç ve İş Etkisi
* **Bulgu:** "Tedarikçi C" ham maddesi kullanıldığında ve sıcaklık 58°C'yi geçtiğinde, çözünme oranının %70'in altına düşerek "Kalite Reddine (Fail) sebep olduğu kanıtlandı.
* **Öneri:** Tedarikçi C ile çalışmanın durdurulması veya sıcaklık parametrelerinin revize edilmesi önerildi.

[📂 Proje Veri Setini İncele (CSV)](Pharma_Dataset.csv)

---

## 🚜 PROJE 2: SQL ile Tarımsal Üretim Verisi Analizi (USDA Capstone)

**Proje Başlığı:** Çoklu Emtia Üretim Verilerinin Veritabanı Yönetimi ve Analizi
**Tarih:** Kasım 2025
**Kullanılan Araçlar:** SQL (SQLite), DBeaver, Data Cleaning Functions

### 1. Proje Özeti (Ön Yazı)
Amerikan Tarım Bakanlığı'nın (USDA) açık veri portalından alınan Peynir, Süt, Bal, Kahve, Yumurta ve Yoğurt üretim verilerini analiz ettim. Ham verileri (CSV) yerel bir veritabanı ortamına (DBeaver/SQLite) taşıyarak, üretim trendlerini ve eyaletler arası ilişkileri inceleyen karmaşık sorgular yazdım.

### 2. Karşılaşılan Zorluklar ve Teknik Çözümler (Mülakat Odaklı)
* **Veri Tipi ve Format Sorunları (Data Cleaning):** Kaynak verideki sayısal değerler "metin" (string) formatında ve virgüllü (Örn: "1,000") geliyordu. Bu durum matematiksel hesaplamaları imkansız kılıyordu.
    * *Çözüm:* `REPLACE` ve `CAST` fonksiyonlarını iç içe kullanarak tüm tablolardaki virgülleri temizledim ve verileri güvenli bir şekilde sayısal (INTEGER) formata dönüştürdüm.
* **Veri Bütünlüğü:** Farklı tablolardaki (Örn: Peynir ve Yoğurt) verileri birleştirirken satır çoğalması (row explosion) riskini yönetmek için `DISTINCT` ve Alt Sorgular (Subqueries) kullandım.

### 3. Yapılan Analizler
* **Aggregation (Toplulaştırma):** Yıllık toplam üretim (SUM) ve ortalama üretim (AVG) hesaplamalarıyla sektörlerin büyüme/küçülme trendlerini belirledim.
* **JOINs & Kesişimler:** `INNER JOIN` ve `LEFT JOIN` kullanarak, belirli bir dönemde (Örn: Nisan 2023) hem süt hem bal üreten eyaletleri tespit ettim.
* **Filtreleme:** `EXCEPT` veya `NOT IN` mantığıyla, belirli üretim kriterlerini sağlamayan eyaletleri raporladım.

[💻 SQL Kodlarını İncele](USDA_Final_Project.sql)

---

## 🤖 PROJE 3: AI Destekli GMP Asistanı (Prompt Engineering)

**Proje Başlığı:** Yapay Zeka ile Kalite Güvence Süreçlerinin Otomasyonu
**Sertifika:** ChatGPT Prompt Engineering for Developers (DeepLearning.AI)

### 1. Proje Özeti
İlaç üretim süreçlerindeki teknik dokümantasyonu (SOP, Hata Raporları) basitleştirmek ve yeni personelin GMP eğitimini hızlandırmak için Yapay Zeka (LLM) tabanlı istem (prompt) şablonları geliştirdim.

### 2. Kullanılan Teknikler
* **Persona (Rol Atama):** Yapay zekaya "Kıdemli QA Müdürü" rolü atayarak cevapların sektörel standartlara uygun olmasını sağladım.
* **Few-Shot Prompting:** Modele daha önce yazılmış doğru rapor örneklerini göstererek çıktı kalitesini artırdım.

[📄 Prompt Kütüphanesini ve Senaryoları İncele](Pharma_AI_Prompts.md)
