require_relative '../lib/grid_cell.rb'
require_relative '../lib/array_extensions.rb'


class Board
  attr_reader :board
  def initialize(input = {})
    @board = input.fetch(:board, basic_board)
  end
  
  def basic_board
    Array.new(3) { Array.new(3) {GridCell.new} }
  end

  def get_board_cell(a, b)
    board[a][b]
  end

  def set_board_cell(a, b, value)
    get_board_cell(a, b).value = value
  end

  def display_board
    displayed_board = []
    board.each do |array|
      displayed_array = array.map { |array_cell| array_cell = array_cell.value }
      displayed_board << displayed_array
    end
    displayed_board.each { |array| p array }
  end

  def end_game
    return :win if won?
    return :draw if drawn?
    false
  end

  def drawn?
    board.flatten.map { |grid_cell| grid_cell.value }.no_cell_empty?
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
    winning_config.map{ |grid_cell| grid_cell.value }
  end

  def won?
    winning_config.each do |config|
      next if winning_values(config).all_cells_empty?
      return true if winning_values(config).all_cells_same?
    end
    false
  end


  
end


[
  ["", "", ""],
  ["", "", ""],
  ["", "", ""]
]