#!/usr/bin/ruby -w

require "date"

module GetDate

def self.generate
current = DateTime.now
	
	#print current.day
	monthinwords =	case current.month
	 when 1
	 	"January"
	 when 2
	 	"February"
	 when 3
	 	"March"
	 when 4
	 	"April"
	 when 5 
	 	"May"
	 when 6
	 	"June"
	 when 7
	 	"July"
	 when 8
	 	"August"
	 when 9
	 	"September"
	 when 10
	 	"October"
	 when 11
	 	"November"
	 when 12
	 	"December"
	 else
	end

	#print current.year, "\n"
	"#{current.day}/#{monthinwords}/#{current.year}"
end

end

