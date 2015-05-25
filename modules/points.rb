module Points

	@score = []
	attr_accessor :score
	
	def Points.addpoint
		@score.push(1)
	end
	
	def Points.total
		@score.length * 10
	end
end