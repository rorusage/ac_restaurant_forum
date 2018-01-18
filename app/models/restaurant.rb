class Restaurant < ActiveRecord::Base
  validates_presence_of :name
  mount_uploader :image, PhotoUploader
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end

  def is_liked_by?(user)
    self.liked_users.include?(user)
  end

  # def count_favorites
  #   self.favorites_count = self.favorites.count
  #   puts favorites_count
  #   self.save
  # end
end
