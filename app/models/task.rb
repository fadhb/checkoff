class Task < ActiveRecord::Base
  has_many :task_items
  before_destroy :ensure_not_referenced_by_any_task_item
  
  validates :title, :description, :excerpt, :image_url, presence: true
  validates :excerpt, length: {maximum: 80}
  validates :duration, numericality: {greater_than_or_equal_to: 1}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a url for GIF, JPG or PNG image'
  }
  
  def self.latest
    Task.order(:updated_at).last
  end
  
  private
  def ensure_not_referenced_by_any_task_item
    if task_items.empty?
      return true
    else
      errors.add(:base, 'task items are present')
      return false
    end
    
  end
end