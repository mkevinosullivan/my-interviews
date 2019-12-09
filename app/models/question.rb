class Question < ApplicationRecord
  has_many :responses
  validates :question, presence: true
end
