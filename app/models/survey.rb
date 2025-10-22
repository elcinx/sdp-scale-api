class Survey < ApplicationRecord
  belongs_to :scale
  belongs_to :user
  has_many :responses, dependent: :destroy
end
