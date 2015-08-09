class Venue < ActiveRecord::Base
	belongs_to :organisation
	has_many :bookings
	has_many :hours
	has_many :customers
	has_many :covers
	has_many :tables

end
