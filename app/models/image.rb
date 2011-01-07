class Image < ActiveRecord::Base
  
  has_many :illustrations
  has_many :posts, :through => :illustrations
  
end
