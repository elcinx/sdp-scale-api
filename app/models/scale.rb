class Scale < ApplicationRecord
  # İLİŞKİLER
  belongs_to :user, optional: true          # Scale'in bir sahibi olabilir ama şart değil
  has_many :questions, dependent: :destroy  # Scale silinirse soruları da sil
  has_many :surveys,   dependent: :destroy  # Scale silinirse ondan türeyen anketler de silinsin

  # DOĞRULAMALAR
  validates :title,  presence: true
  validates :sdp_doi, presence: true
end
