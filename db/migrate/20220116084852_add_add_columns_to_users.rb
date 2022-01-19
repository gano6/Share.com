class AddAddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :profile, :text
    add_column :users, :icon_image, :string
  end
end
