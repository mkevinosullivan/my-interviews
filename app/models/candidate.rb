class Candidate < ApplicationRecord
  has_many :responses
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
