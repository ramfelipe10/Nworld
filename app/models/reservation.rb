class Reservation < ActiveRecord::Base
belongs_to:users
validates :quantity, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
end
