class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :room_users, :name, :string
  end
end
