class Grid
	attr_accessor :matrix

	def initialize
		self.matrix = Array.new(6, Array.new(7, nil))
  end

  def self.check_winner(player, matrix, row, column)
    horizontal_matches = 0
    vertical_matches = 0
    upward_diagonal_matches = 0
  	downward_diagonal_matches = 0

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

    # Check upward diagonal
    start_row = row - 1
    start_column = column + 1

    until start_row < 0 or start_column > 6 do
      break if matrix[start_row][start_column] != player['number']
      start_row -= 1
      start_column += 1
      upward_diagonal_matches += 1
    end
    
    start_row = row + 1
    start_column = column - 1

    until start_row > 5 or start_column < 0 do
      break if matrix[start_row][start_column] != player['number']
      start_row += 1
      start_column -= 1
      upward_diagonal_matches += 1
    end

    # Check downward diagonal
    start_row = row - 1
    start_column = column - 1

    until start_row < 0 or start_column < 0 do
      break if matrix[start_row][start_column] != player['number']
      start_row -= 1
      start_column -= 1
      downward_diagonal_matches += 1
    end
    
    start_row = row + 1
    start_column = column + 1

    until start_row > 5 or start_column > 6 do
      break if matrix[start_row][start_column] != player['number']
      start_row += 1
      start_column += 1
      upward_diagonal_matches += 1
    end

  	(horizontal_matches >= 4 or vertical_matches >= 4 or upward_diagonal_matches >= 3 or downward_diagonal_matches >= 3) ? player : nil
  end
end