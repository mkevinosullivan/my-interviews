class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.text :response, null: false
      t.integer :score, null: false

      t.belongs_to :candidate
      t.belongs_to :question

      t.timestamps
    end
  end
end
