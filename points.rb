module Points

	@score = []
	attr_accessor :score
	
	def Points.addpoint(n)
		@score.push(n)
	end
	
	def Points.total
		@score.inject(:+)
	end
end