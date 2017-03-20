class Product < ActiveRecord::Base
IMG_SRC=["bubble","ucream","cushion","cloudcream","eyegel"]

 validates :name,:srp, presence: true
end
