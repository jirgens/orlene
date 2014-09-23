class Album < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  has_one :primary_photo
  has_one :secondary_photo
  validates_presence_of :title
  accepts_nested_attributes_for :pictures

  def first_pictures
    pictures.first(4)
  end

  def to_param
    "#{id}-#{title}"
  end

end
