class Board
  def initialize(board, current_player)
    @board= board
    @current_player = current_player
  end

  def display_board
    board = []
    @board.each do |array|
    board << array.to_s.tr(',', ' ')
    end
    board
  end

  
end
