class Grid
	attr_accessor :matrix

	def initialize
		self.matrix = Array.new(6, Array.new(7, nil))
  end

  def self.check_winner(player, matrix, row, column)
    horizontal_matches = 0
    vertical_matches = 0

    # Check horizontally
    start = (column - 1) == -1 ? 0 : (column - 1)

  	for i in start.downto(0)
      break if matrix[row][i] != player['number']
  		horizontal_matches += 1
  	end

    for i in column..6
  		break if matrix[row][i] != player['number']
  		horizontal_matches += 1
  	end

    # Check vertically
    start = (row - 1) == -1 ? 0 : (row - 1)
    
    for i in start.downto(0)
      break if matrix[i][column] != player['number']
      vertical_matches += 1
    end

    for i in row..5
      break if matrix[i][column] != player['number']
      vertical_matches += 1
    end

  	(horizontal_matches == 4 or vertical_matches == 4) ? player : nil
  end
end