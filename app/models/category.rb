class Category < ActiveRecord::Base
  has_many :restaurants, dependent: :destroy
  validates_presence_of :name
end
