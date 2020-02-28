class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.boolean :liked
      t.references :tag, foreign_key: true
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
