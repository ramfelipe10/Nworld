class Reservation < ActiveRecord::Base
has_many :users
has_many :products


validates :quantity, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
end
