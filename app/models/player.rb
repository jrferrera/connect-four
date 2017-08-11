class Player
	attr_accessor :number, :first_name, :color

	def initialize(number, first_name, color)
		self.number = number
		self.first_name = first_name
		self.color = color
	end
end