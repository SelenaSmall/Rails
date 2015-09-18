class Hour < ActiveRecord::Base
	belongs_to :venue
	belongs_to :table

end