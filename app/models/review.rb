class Review < ApplicationRecord
  belongs_to :hotel
  validates :rating, presence: true,numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :comment, presence: true, length: { minimum: 10 }
  has_many_attached :pictures, dependent: :destroy
  has_many :usercomments, dependent: :destroy

  validates :pictures, content_type: {in: ['image/png', 'image/jpeg', 'image/jpg'], message: ":please upload image file"}

  def pictures_as_thumbnail
    pictures.map do |picture|
      picture.variant(resize_to_limit: [300,250]).processed
    end
  end
  
end
