class Favorite < ActiveRecord::Base
  belongs_to :restaurant, counter_cache: true
  belongs_to :user
end
