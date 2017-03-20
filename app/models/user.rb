class User < ActiveRecord::Base
has_secure_password validations: false

has_many:reservations
has_many :products, through: :reservations

validates :username, presence: true, uniqueness: true
validates :password, presence: true, on: :create, length: {minimum: 5}

validates :account_type,presence: true


end
