class Venue < ActiveRecord::Base
	belongs_to :user
	has_many :bookings
	has_many :customers

end
