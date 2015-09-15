class Booking < ActiveRecord::Base
	belongs_to :venue
	belongs_to :table

end
