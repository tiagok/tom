class Tag < ActiveRecord::Base
  
  has_many :identifications
  has_many :posts, :through => :identifications
  
end
