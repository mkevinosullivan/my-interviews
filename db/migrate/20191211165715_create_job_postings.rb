class CreateJobPostings < ActiveRecord::Migration[6.0]
  def change
    create_table :job_postings do |t|
      t.text :description, null: false
      t.string :posting_link

      t.belongs_to :questionnaire

      t.timestamps
    end

    create_table :candidates_job_postings, id: false do |t|
      t.belongs_to :job_posting
      t.belongs_to :candidate
    end
  end
end
