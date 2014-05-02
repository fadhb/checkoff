class Task < ActiveRecord::Base
  validates :title, :description, :excerpt, :image_url, presence: true
  validates :excerpt, length: {maximum: 80}
  validates :duration, numericality: {greater_than_or_equal_to: 1}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a url for GIF, JPG or PNG image'
  }
  
end