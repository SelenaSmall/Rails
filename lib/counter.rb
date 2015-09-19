#!/usr/bin/ruby

module Counter

def self.count	
	tab = CreateTabs.new

#	"#{tab.total_number_of_tabs}"
	"#{(1..12).to_a}"
#	"#{Array.to_s}"
end

class CreateTabs
	attr_reader :tab_number
	array = Array.new

	@@no_of_tabs = 0 
	@@store_tab_number = {}

	def intialize
		@tab_number=tab.number 
		@@no_of_tabs +=1
		@@store_tab_number[@tab.number] ||= 0
		@@store_tab_number[@tab.number] +=1
	end
	
#	def total_number_of_tabs
#		puts "Number of tabs:"
#		@@no_of_tabs = gets.chomp.to_i
#	end

#	def show_tabs
#		puts "Tabs: #{total_number_of_tabs.to_i}"
#	end

	#TODO list_all_tabs doesn't work with rails - why?
	def list_tabs
		puts "Listing tabs:\n"
		@@no_of_tabs.times do |count|
  		puts "#{count}\n"
	end
end
	
#tab=CreateTabs.new

#tab.total_number_of_tabs
#tab.list_all_tabs
end
end
