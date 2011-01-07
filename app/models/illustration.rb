class Illustration < ActiveRecord::Base
  
  belongs_to :image
  belongs_to :post
  
end
