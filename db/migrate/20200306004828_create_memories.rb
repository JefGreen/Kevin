class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.references :story, foreign_key: true
      t.references :contact, foreign_key: true
      t.timestamps
    end
  end
end
