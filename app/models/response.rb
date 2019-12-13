class Response < ApplicationRecord
  belongs_to :candidate
  has_one :question
  has_one :job_posting

  validates :response, presence: true
  validates :score, presence: true

  def to_s
    "response [#{response}], score [#{score}], candidate_id [#{candidate_id}], question_id [#{question_id}]"
  end
end
