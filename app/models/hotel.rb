class Hotel < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, length: { minimum: 4 }
  validates :image, presence: true
  has_one_attached :image
  
  def image_as_potrait
    image.variant(resize_to_fill: [700,540]).processed
  end
  def image_as_thumbnail
    image.variant(resize_to_fill: [290,200]).processed
  end
  def hotel_average_rating(hotel)
    hotel.reviews.sum(:rating) / hotel.reviews.count
  end


end
