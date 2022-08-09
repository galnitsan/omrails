class Comment < ApplicationRecord
  belongs_to :tweet

  validates :body, :username, presence: true,
            length: {minimum: 2}
end
