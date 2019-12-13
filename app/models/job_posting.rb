class JobPosting < ApplicationRecord
  has_one :questionnaire
  has_and_belongs_to_many :candidates

  validates :description, :posting_link, :questionnaire_id, presence: true
end
