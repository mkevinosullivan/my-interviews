class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.text :description, null: false

      t.timestamps
    end

    create_table :questionnaires_questions, id: false do |t|
      t.belongs_to :questionnaire
      t.belongs_to :question
    end
  end
end
