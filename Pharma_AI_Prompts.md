# 🧪 AI-Powered GMP & QA Assistant Prompts

Bu proje, İlaç Sektöründeki Kalite Güvence (QA) süreçlerini optimize etmek için tasarlanmış **ChatGPT / LLM İstem (Prompt)** kütüphanesidir.

## 🎯 Amaç
* Karmaşık GMP (Good Manufacturing Practices) kurallarını basitleştirmek.
* Teknik dokümanları (SOP) otomatik özetlemek.
* Yeni personelin oryantasyon sürecini hızlandırmak.

---

## 📌 Senaryo 1: GMP Eğitimi (Persona Tekniği)

**Görev:** Yeni başlayan bir stajyere, karmaşık bir kavram olan "Veri Bütünlüğü"nü (Data Integrity) basit bir dille anlatmak.

**Kullanılan Prompt:**
```text
Sen uluslararası bir ilaç firmasında (Pharma-X) çalışan, 15 yıllık deneyime sahip, titiz ama öğretmeyi seven Kıdemli Kalite Güvence (QA) Müdürüsün.

GÖREVİN:
Karşındaki yeni mezun stajyere ilaç sektöründeki "ALCOA+" prensibinin (Veri Bütünlüğü) ne olduğunu anlatmak.

KURALLAR:
1. Asla aşırı teknik ve akademik bir dil kullanma.
2. Konuyu basitleştirmek için günlük hayattan bir "Yemek Tarifi" analojisi kullan.
3. Tonun teşvik edici ve mentörlük yapıcı olsun.
```
Model Çıktısı (Örnek):

"Hoş geldin! ALCOA+ prensibini evdeki gizli yemek tarifi defterin gibi düşün. Eğer malzemeyi değiştirip deftere yazmazsan, senden sonraki kişi yemeği yakar. İlaçta ise bu 'yanık yemek' hasta sağlığı demektir. Defterin orijinal, okunabilir ve eş zamanlı (işi yaparken) doldurulmuş olması gerekir."


## 📌 Senaryo 2: Teknik Rapor Özetleme

**Görev:** 5 sayfalık bir "Sapma Raporu"nu yöneticiler için 3 maddelik bir özete dönüştürmek.

**Kullanılan Prompt:**
```text
Aşağıdaki teknik laboratuvar raporunu incele.
Bana sadece şu 3 başlığı içeren bir özet çıkar:
1. Hatanın Kök Nedeni (Root Cause)
2. Etkilenen Batch Numaraları
3. Önerilen Düzeltici Faaliyet (CAPA)

Rapor Metni: [Buraya rapor yapıştırılır...]
