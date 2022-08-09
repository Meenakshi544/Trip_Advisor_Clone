class Review < ApplicationRecord
  belongs_to :hotel
  validates :rating, presence: true, numericality: true
  validates :comment, presence: true, length: { minimum: 10 }
  has_many_attached :pictures, dependent: :destroy
  has_many :usercomments, dependent: :destroy

  def pictures_as_thumbnail
    pictures.map do |picture|
      picture.variant(resize_to_limit: [300,250]).processed
    end
  end
  
end
