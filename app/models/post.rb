class Post < ActiveRecord::Base
  
  belongs_to :user
  has_many :illustrations
  has_many :identifications
  has_many :images, :through => :illustrations
  has_many :tags, :through => :identifications
  
end
