class Picture < ActiveRecord::Base
  attr_accessible :image, :imageable_id, :imageable_type
  
  belongs_to :imageable, polymorphic: true
  has_attached_file :image

end
