class Venue < ActiveRecord::Base
	belongs_to :organisation
	belongs_to :user
	has_many :customers
	has_many :bookings
	has_many :reports
	has_many :grids
	has_many :plans
	
	has_many :hours
	has_many :covers
	has_many :tables
	has_many :sections

end
