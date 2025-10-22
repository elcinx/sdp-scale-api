# 🧠 SDP Scale API

Bu proje, **Ruby on Rails 8 (API-Only)** yapısında geliştirilmiş bir **psikolojik ölçek yönetim sistemidir (Scale Management System)**.  
Amaç, araştırmacıların kullanıcı, ölçek, soru, anket ve yanıt verilerini yönetebileceği bir **RESTful API** oluşturmaktır.

---

## 🚀 Proje Özeti

**SDP Scale API**, dijital psikolojik ölçme araçlarının arka planını oluşturur.  
Sistem, **5 temel model** üzerine inşa edilmiştir:

| Model | Açıklama |
|--------|-----------|
| **User** | Araştırmacı veya katılımcı bilgilerini tutar |
| **Scale** | Ölçek başlığı, alanı, sürümü ve durumu gibi meta verileri içerir |
| **Question** | Her ölçeğe ait soruları barındırır |
| **Survey** | Ölçeklerin uygulanma süreci ve tarihlerini temsil eder |
| **Response** | Kullanıcıların verdiği yanıtları saklar |

---

## ⚙️ Kullanılan Teknolojiler

- **Ruby (3.3.x sürümü)**  
- **Ruby on Rails 8 (API Mode)**  
- **ActiveRecord ORM (Veritabanı yönetimi)**  
- **Postman (API test aracı)**  
- **Git + GitHub (versiyon kontrolü)**  

---

## 🧩 Kurulum Adımları

### 1️⃣ Projeyi Klonlayın
```bash
git clone https://github.com/elcinx/sdp-scale-api.git
cd context7_api

Proje Yapısı
context7_api/
├── app/
│   ├── controllers/api/v1/
│   │   ├── users_controller.rb
│   │   ├── scales_controller.rb
│   │   ├── questions_controller.rb
│   │   ├── surveys_controller.rb
│   │   └── responses_controller.rb
│   ├── models/
│   │   ├── user.rb
│   │   ├── scale.rb
│   │   ├── question.rb
│   │   ├── survey.rb
│   │   └── response.rb
├── db/
│   ├── migrate/
│   ├── schema.rb
│   └── seeds.rb
├── config/
│   └── routes.rb
└── README.md

