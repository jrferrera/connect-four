class Grid
	attr_accessor :matrix

	def initialize
		self.matrix = Array.new(6, Array.new(7, nil))
  end
end