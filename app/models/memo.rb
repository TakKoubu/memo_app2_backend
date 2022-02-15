class Memo < ApplicationRecord
  attr_accessor :is_like, :favorite_count

  belongs_to :user
  has_many :favorites

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

end
