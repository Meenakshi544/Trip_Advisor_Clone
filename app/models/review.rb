class Review < ApplicationRecord
  belongs_to :hotel
  has_many_attached :pictures, dependent: :destroy
  has_many :usercomments, dependent: :destroy

  def pictures_as_thumbnail
    pictures.map do |picture|
      picture.variant(resize_to_limit: [300,250]).processed
    end
  end
end
