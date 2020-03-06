class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :correct_answer
      t.references :contact, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
