class Identification < ActiveRecord::Base
  
  belongs_to :tag
  belongs_to :post
  
end
