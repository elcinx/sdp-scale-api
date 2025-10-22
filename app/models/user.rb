class User < ApplicationRecord
  # İLİŞKİLER
  has_many :scales,   dependent: :nullify   # Kullanıcı silinirse scale.owner boşa düşsün
  has_many :surveys,  dependent: :nullify
  has_many :responses, dependent: :nullify  # Yanıt sahipliği opsiyonel

  # DOĞRULAMALAR
  validates :name,  presence: true
  validates :email, presence: true
end
