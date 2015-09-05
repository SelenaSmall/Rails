class Venue < ActiveRecord::Base
	include FriendlyId
	friendly_id :name, :use => [:slugged]

 	belongs_to :organisation
	belongs_to :user
	has_many :customers, dependent: :destroy
	has_many :bookings, dependent: :destroy
	
	has_many :hours, dependent: :destroy
	has_many :covers, dependent: :destroy
	has_many :tables, dependent: :destroy
	has_many :sections, dependent: :destroy

	validates :name, uniqueness: true

end
