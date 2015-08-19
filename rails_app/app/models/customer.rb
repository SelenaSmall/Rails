class Customer < ActiveRecord::Base
	belongs_to :organisation
	belongs_to :venue
	belongs_to :user
	has_many :bookings
	has_many :reports
	has_many :grids

	def get_todays_date 
		GetDate.generate
	end

	def get_tab_count 
		Counter.count
#when @counter.tab.total_number_of_tabs == user.id.number_of_tabs.to_i
	end

	#attr_accessor :name
 
  	validates :name, presence: true, uniqueness: true
 
  # It returns the customers whose names contain one or more words that form the query
  	def self.search(query)
    # where(:name, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%") 
  	end
end
