class AddFavoritesCountToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :favorites_count, :integer, default: 0
  end
end
