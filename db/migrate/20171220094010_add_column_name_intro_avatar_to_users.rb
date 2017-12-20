class AddColumnNameIntroAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :intro, :text
    add_column :users, :avatar, :string
  end
end
