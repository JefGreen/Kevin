class CreateGroupContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :group_contacts do |t|
      t.references :group, foreign_key: true
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
