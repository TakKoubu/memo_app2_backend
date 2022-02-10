class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 } 
  
  has_many :memos, dependent: :destroy
  has_many :favorites
  has_many :favorite_memos, through: :favorites, source: :memo

  def favorite(memo)
    self.favorites.find_or_create_by(memo_id: memo.id)
  end

  def favoriting?(memo)
    self.favorite_memos.include?(memo)
  end
end
