class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :meeting_location
      t.date :birthday

      t.timestamps
    end
  end
end
