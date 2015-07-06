class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :image, :string
    add_column :users, :cycle_length, :integer
    add_column :users, :preference, :string
  end
end
