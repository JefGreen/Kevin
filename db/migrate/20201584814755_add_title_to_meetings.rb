class AddTitleToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :title, :string
  end
end
