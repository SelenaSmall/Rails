class Booking < ActiveRecord::Base
	#belongs_to :customer
	belongs_to :organisation
	belongs_to :venue
	belongs_to :user
	belongs_to :customer
	has_many :reports
	has_many :grids
	has_many :plans
	has_many :tables

end
