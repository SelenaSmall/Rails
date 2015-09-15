class User < ActiveRecord::Base
#	belongs_to :organisation
	has_many :bookings
	has_many :customers
	belongs_to :venues 

end
