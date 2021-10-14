class Comment < ApplicationRecord

  # Contains :user, :body, and :post ref
  validates :user, presence: true, length: {minimum: 5}
  validates :body, presence: true

  belongs_to :post
end
