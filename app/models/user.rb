class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :confirmed_friendships, -> { where confirmed: true }, class_name: 'Friendship'
  has_many :friends, through: :confirmed_friendships

  has_many :pending_friendships, -> { where confirmed: false }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :pending_friends, through: :pending_friendships, source: :friend

  has_many :inverted_friendships, -> { where confirmed: false }, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :friend_requests, through: :inverted_friendships, source: :user

  # check if I have a friend request sent to me
  def request_to_me?(user)
    true if inverse_friendships.include?(user) || friend_requests.include?(user)
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find { |frndship| frndship.user == user }
    friendship.confirmed = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end

  def request_exists?(user)
    true if pending_friends.include?(user) || friend_requests.include?(user)
  end
end
