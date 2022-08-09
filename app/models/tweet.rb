class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :user, presence: true
  validates :content, presence: true, length: {minimum: 4}
end
