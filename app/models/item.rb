class Item < ApplicationRecord
  belongs_to :user, :optional => true

  validates :user, presence: true
  validates :title, presence: true, length: {minimum: 4}
end
