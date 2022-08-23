class Hotel < ApplicationRecord
  has_many :reviews, dependent: :destroy, :after_add => :update_average_rating
  has_one_attached :image, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true,  numericality: { greater_than: 1000}
  validates :image, presence: true, content_type: {in: ['image/png', 'image/jpeg', 'image/jpg'], message: ":please upload image file"}
  validates :location, presence: true
  
  def image_as_potrait
    image.variant(resize_to_fill: [700,540]).processed
  end

  def image_as_thumbnail
    image.variant(resize_to_fill: [290,200]).processed
  end
  
  def update_average_rating(review=nil)
    s = self.reviews.sum(:rating)
    c = self.reviews.where.not(approved_by: 0).count
    a= (self.reviews.where.not(approved_by: 0).average(:rating)).round(1) if c!=0
    self.update_attribute(:average_rating, c == 0 ? 0.0 : a)
  end


end
