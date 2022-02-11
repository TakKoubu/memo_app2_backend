class Memo < ApplicationRecord
  belongs_to :user
  has_many :favorites

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def favorite_count
    self.favorites.count
  end

end
