module PlayerName

	attr_accessor :name
	
	def PlayerName.initialize
		puts "\t\tWhat is your last name, Specialist?"
		name = $stdin.gets.chomp
		@playername = name
	end
	
	
	def PlayerName.callplayer
		@playername.upcase
	end
end