class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :meeting, foreign_key: true
      t.references :contact, foreign_key: true
      t.timestamps
    end
  end
end
