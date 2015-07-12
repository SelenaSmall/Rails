class Booking < ActiveRecord::Base
	belongs_to :user

	def get_todays_date 
		GetDate.generate
	end

	def get_current_user 
		User.name
	end
end
