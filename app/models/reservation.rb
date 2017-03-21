class Reservation < ActiveRecord::Base



validates :quantity, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 10 }
end
