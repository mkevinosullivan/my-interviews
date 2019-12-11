class Question < ApplicationRecord
  has_and_belongs_to_many :questionnaires
  has_many :responses
  validates :question, presence: true
end
