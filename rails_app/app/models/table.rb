class Table < ActiveRecord::Base
	belongs_to :venue
	belongs_to :grid

end

#class Table
#	include ActiveModel::Model
#
#	attr_accessor :table_number
#end