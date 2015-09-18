class Table < ActiveRecord::Base
	belongs_to :venue
	has_many :hours
	has_many :bookings

end