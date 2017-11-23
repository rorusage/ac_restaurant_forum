class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.string :opening_hours
      t.text :description

      t.timestamps null: false
    end
  end
end
