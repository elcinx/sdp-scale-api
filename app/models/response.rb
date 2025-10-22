class Response < ApplicationRecord
  belongs_to :question
  belongs_to :survey
  belongs_to :user
end
