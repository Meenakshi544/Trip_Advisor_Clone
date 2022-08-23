class Usercomment < ApplicationRecord
  belongs_to :review
  validates :body, presence: true, length: {minimum: 5}
end
