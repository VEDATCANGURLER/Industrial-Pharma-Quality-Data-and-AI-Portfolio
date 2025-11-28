/*
PROJE: USDA Gıda Üretim Veri Analizi
TARİH: Kasım 2025
YAZAR: Vedat Can Gürler
AÇIKLAMA: Bu dosya, veritabanı kurulumu, veri temizliği ve analiz sorgularını içerir.
*/

-- ==========================================
-- BÖLÜM 1: TABLO KURULUMLARI (SCHEMA)
-- ==========================================

CREATE TABLE cheese_production (
    Year INTEGER, Period TEXT, Geo_Level TEXT, State_ANSI INTEGER, Commodity_ID INTEGER, Domain TEXT, Value TEXT
);

CREATE TABLE honey_production (
    Year INTEGER, Geo_Level TEXT, State_ANSI INTEGER, Commodity_ID INTEGER, Value TEXT
);

CREATE TABLE milk_production (
    Year INTEGER, Period TEXT, Geo_Level TEXT, State_ANSI INTEGER, Commodity_ID INTEGER, Domain TEXT, Value TEXT
);

CREATE TABLE coffee_production (
    Year INTEGER, Period TEXT, Geo_Level TEXT, State_ANSI INTEGER, Commodity_ID INTEGER, Value TEXT
);

CREATE TABLE egg_production (
    Year INTEGER, Period TEXT, Geo_Level TEXT, State_ANSI INTEGER, Commodity_ID INTEGER, Value TEXT
);

CREATE TABLE yogurt_production (
    Year INTEGER, Period TEXT, Geo_Level TEXT, State_ANSI INTEGER, Commodity_ID INTEGER, Domain TEXT, Value TEXT
);

CREATE TABLE state_lookup (
    State TEXT, State_ANSI INTEGER
);

-- ==========================================
-- BÖLÜM 2: VERİ TEMİZLİĞİ (DATA CLEANING)
-- Virgüllü metin formatındaki sayıları (Örn: "1,000") temizleyip INTEGER formatına çevirme.
-- ==========================================

UPDATE cheese_production SET Value = CAST(REPLACE(Value, ',', '') AS INTEGER);
UPDATE honey_production SET Value = CAST(REPLACE(Value, ',', '') AS INTEGER);
UPDATE milk_production SET Value = CAST(REPLACE(Value, ',', '') AS INTEGER);
UPDATE coffee_production SET Value = CAST(REPLACE(Value, ',', '') AS INTEGER);
UPDATE egg_production SET Value = CAST(REPLACE(Value, ',', '') AS INTEGER);
UPDATE yogurt_production SET Value = CAST(REPLACE(Value, ',', '') AS INTEGER);

-- ==========================================
-- BÖLÜM 3: ANALİZ SORGULARI (ANALYSIS QUERIES)
-- ==========================================

-- 1. 2023 Yılı Toplam Süt Üretimi
SELECT SUM(Value) AS Total_Milk_2023 
FROM milk_production 
WHERE Year = 2023;

-- 2. 2023 Yılında 100 Milyondan Fazla Peynir Üreten Eyalet Sayısı (Nisan Ayı)
SELECT COUNT(*) AS High_Cheese_States
FROM cheese_production 
WHERE Year = 2023 
  AND Period = 'APR' 
  AND Value > 100000000;

-- 3. 2011 Yılı Toplam Kahve Üretimi
SELECT SUM(Value) AS Total_Coffee_2011 
FROM coffee_production 
WHERE Year = 2011;

-- 4. 2022 Yılı Ortalama Bal Üretimi
SELECT AVG(Value) AS Avg_Honey_2022 
FROM honey_production 
WHERE Year = 2022;

-- 5. Florida Eyaletinin ANSI Kodu
SELECT State_ANSI 
FROM state_lookup 
WHERE State = 'FLORIDA';

-- 6. New Jersey Peynir Üretimi (Nisan 2023) - Üretim Yoksa Bile Göster (LEFT JOIN)
SELECT s.State, c.Value 
FROM state_lookup s
LEFT JOIN cheese_production c 
    ON s.State_ANSI = c.State_ANSI 
    AND c.Year = 2023 
    AND c.Period = 'APR'
WHERE s.State = 'NEW JERSEY';

-- 7. 2023'te Peynir Üreten Eyaletlerin 2022'deki Yoğurt Üretimi (Subquery & IN)
SELECT SUM(Value) AS Total_Yogurt_From_Cheese_States
FROM yogurt_production 
WHERE Year = 2022 
  AND State_ANSI IN (
      SELECT DISTINCT State_ANSI 
      FROM cheese_production 
      WHERE Year = 2023
  );

-- 8. 2023'te Süt Üretimi Olmayan Eyalet Sayısı (EXCLUSION)
SELECT COUNT(*) AS States_With_No_Milk
FROM state_lookup 
WHERE State_ANSI NOT IN (
    SELECT DISTINCT State_ANSI 
    FROM milk_production 
    WHERE Year = 2023
);

-- 9. Bal Üretiminin 1 Milyonu Aştığı Yıllardaki Ortalama Kahve Üretimi
SELECT AVG(Value) AS Avg_Coffee_High_Honey_Years
FROM coffee_production 
WHERE Year IN (
    SELECT Year 
    FROM honey_production 
    GROUP BY Year 
    HAVING SUM(Value) > 1000000
);