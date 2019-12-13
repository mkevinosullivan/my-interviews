class AddJobPostingToResponses < ActiveRecord::Migration[6.0]
  def change
    change_table :responses do |t|
      t.belongs_to :job_posting
    end
  end
end
