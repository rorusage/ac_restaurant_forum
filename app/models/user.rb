class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants, through: :comments
  mount_uploader :avatar, AvatarUploader
  validates_presence_of :name
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  has_many :inverse_followships, class_name: "Followship", foreign_key: "following_id"
  has_many :followers, through: :inverse_followships, source: :user

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :inverse_friends, class_name: "Friendship", foreign_key: "friend_id"
  has_many :who_add_me, through: :inverse_friends, source: :user

  def admin?
    self.role == "admin"
  end

  def following?(user)
    self.followings.include?(user)
  end

  def has_this_friend?(user)
    self.friends.include?(user)
  end

  def all_friends
    a = self.who_add_me + self.friends
    a.uniq!
  end
end
