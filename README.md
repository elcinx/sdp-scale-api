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

2️⃣ Bağımlılıkları Yükleyin
bundle install

3️⃣ Veritabanını Oluşturun ve Migrasyonları Uygulayın
rails db:migrate

4️⃣ Sunucuyu Başlatın
rails s

🔹 API artık şu adreste aktif:
👉 http://localhost:3000

📡 API Test (Postman Örnekleri)
🧍 Kullanıcı Oluşturma

POST → /api/v1/users

{
  "user": {
    "name": "Dr. Elçin",
    "email": "elcin@example.com",
    "role": "Researcher"
  }
}

📘 Ölçek (Scale) Ekleme

POST → /api/v1/scales

{
  "scale": {
    "title": "Anxiety Short Form",
    "domain": "Psychology",
    "version": "1.0",
    "sdp_doi": "sdp:anx-sf:1.0",
    "status": "Published",
    "user_id": 1
  }
}

❓ Soru (Question) Ekleme

POST → /api/v1/scales/1/questions

{
  "question": {
    "item_code": "Q1",
    "text": "I felt tense today.",
    "response_type": "Likert",
    "options": "{\"min\":1,\"max\":5}"
  }
}

📋 Anket (Survey) Ekleme

POST → /api/v1/scales/1/surveys

{
  "survey": {
    "title": "Anxiety Study - Cohort A",
    "status": "draft",
    "distribution_mode": "Online",
    "start_at": "2025-10-22T09:00:00",
    "end_at": "2025-11-22T17:00:00",
    "user_id": 1
  }
}

💬 Yanıt (Response) Gönderme

POST → /api/v1/questions/1/responses

{
  "response": {
    "answer": "I felt tense today.",
    "user_id": 1,
    "question_id": 1
  }
}

🧱 Routes (Kısaca)
HTTP	Endpoint	Açıklama
GET	/api/v1/users	Kullanıcıları listeler
POST	/api/v1/users	Yeni kullanıcı ekler
POST	/api/v1/scales	Yeni ölçek ekler
POST	/api/v1/scales/:scale_id/questions	Ölçeğe soru ekler
POST	/api/v1/scales/:scale_id/surveys	Ölçeğe anket ekler
POST	/api/v1/questions/:question_id/responses	Soruya yanıt ekler

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

