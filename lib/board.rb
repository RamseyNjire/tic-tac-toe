require_relative './grid_cell'
require_relative './array_extensions'

class Board
  attr_reader :board
  def initialize(input = {})
    @board = input.fetch(:board, basic_board)
  end

  def basic_board
    Array.new(3) { Array.new(3) { GridCell.new } }
  end

  def get_board_cell(x_coordinate, y_coordinate)
    board[x_coordinate][y_coordinate]
  end

  def set_board_cell(x_coordinate, y_coordinate, value)
    if get_board_cell(x_coordinate, y_coordinate).value.to_i.positive?
      get_board_cell(x_coordinate, y_coordinate).value = value
    else
      false
    end
  end

  def display_board
    displayed_board = []
    board.each do |array|
      displayed_board << array.map(&:value)
    end
    displayed_board.each { |array| p array }
  end

  def end_game
    return :win if won?
    return :draw if drawn?

    false
  end

  def drawn?
    board.flatten.map(&:value).no_cell_empty?
  end

  def board_diagonals
    [
      [get_board_cell(0, 0), get_board_cell(1, 1), get_board_cell(2, 2)],
      [get_board_cell(0, 2), get_board_cell(1, 1), get_board_cell(2, 0)]
    ]
  end

  def winning_config
    board + board.transpose + board_diagonals
  end

  def winning_values(winning_config)
    winning_config.map(&:value)
  end

  def won?
    winning_config.each do |config|
      next if winning_values(config).all_cells_empty?
      return true if winning_values(config).all_cells_same?
    end
    false
  end
end
