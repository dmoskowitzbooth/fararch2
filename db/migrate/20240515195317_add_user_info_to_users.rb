class AddUserInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :position, :string
    add_column :users, :emp_id, :integer
    add_column :users, :doh, :string
    add_column :users, :access, :string
    add_column :users, :image, :string
  end
end
