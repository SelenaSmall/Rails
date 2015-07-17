class Customer < ActiveRecord::Base
	belongs_to :user

	def get_todays_date 
		GetDate.generate
	end

	def get_tab_count 
		Counter.count
#when @counter.tab.total_number_of_tabs == user.id.number_of_tabs.to_i
	end
end
