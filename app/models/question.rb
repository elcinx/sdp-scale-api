class Question < ApplicationRecord
  # İLİŞKİLER
  belongs_to :scale
  has_many :responses, dependent: :destroy  # Soru silinirse cevapları da sil

  # DOĞRULAMALAR
  validates :text, presence: true
end
