class Response < ApplicationRecord
  belongs_to :candidate
  has_one :question

  validates :response, presence: true
  validates :score, presence: true

  def to_s
    "response [#{response}], score [#{score}], candidate_id [#{candidate_id}], question_id [#{question_id}]"
  end
end
