class Restaurant < ActiveRecord::Base
  validates_presence_of :name
  mount_uploader :image, PhotoUploader
  belongs_to :category, optional: true
end
