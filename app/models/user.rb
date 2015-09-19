class User < ActiveRecord::Base
	has_many :bookings
	has_many :customers
	belongs_to :venues 

end