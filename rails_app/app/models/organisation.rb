class Organisation < ActiveRecord::Base
	has_many :users
	has_many :venues
	has_many :customers
	has_many :bookings
	has_many :reports

	def tables
		@tables = []
		@num = 0
		5.times do 
			@num = @num+ 1
			@tables << Table.new(table_number: @num)
		end
		@tables
	end

end
