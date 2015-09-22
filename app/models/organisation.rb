class Organisation < ActiveRecord::Base
	include FriendlyId
	friendly_id :name, :use => [:slugged]
	
	has_many :users
	has_many :venues
	has_many :customers
	has_many :bookings
	has_many :reports

	validates :name, uniqueness: true

end