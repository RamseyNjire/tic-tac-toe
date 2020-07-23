require_relative '../lib/grid_cell.rb'
require_relative '../lib/player.rb'
require_relative '../lib/array_extensions.rb'
require_relative '../lib/board.rb'

class Game
  attr_reader :board, :current_player, :second_player
  def initialize(player_one, player_two, board = Board.new)
    @board = board
    @current_player = player_one
    @second_player = player_two
  end

  def switch_player
    @current_player, @second_player = @second_player, @current_player
  end

  def ask_for_move
    "#{current_player.name}, please make your move by choosing a number from 1 to 9."
  end
  
  def get_player_move(player_move = gets.chomp)
    board_position_mapping(player_move.to_i)
  end

  def end_game_message
    case board.end_game
    when :win
      return "#{current_player.name} has won!"
    when :draw
      return "The game has ended in a draw"
    end
  end

  def game_play
    puts "#{current_player.name} will begin the game"
    puts current_player.name
    puts second_player.name
    while true
      board.display_board
      print "\n"
      puts ask_for_move
      a, b = get_player_move
      board.set_board_cell(a, b, current_player.symbol)
      if board.end_game
        puts end_game_message
        board.display_board
        return
      else
        p "I'm in this block!"
        switch_player
      end
    end
  end

    
  private

  def board_position_mapping (player_move)
    board_positions = { 1 => [0, 0],
                        2 => [0, 1],
                        3 => [0, 2],
                        4 => [1, 0],
                        5 => [1, 1],
                        6 => [1, 2],
                        7 => [2, 0],
                        8 => [2, 1],
                        9 => [2, 2] }
    board_positions[player_move]
  end
end