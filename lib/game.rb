require_relative './player'
require_relative './array_extensions'
require_relative './board'

class Game
  attr_reader :board, :current_player, :second_player
  def initialize(player_one, player_two, board = Board.new)
    return "Only objects accepted here" if !(player_one.is_a?(Player) && player_two.is_a?(Player) && board.is_a?(Board))
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

  def get_player_move(player_move)
    board_position_mapping(player_move)
  end

  def end_game_message
    case board.end_game
    when :win
      "#{current_player.name} has won!"
    when :draw
      'The game has ended in a draw'
    end
  end

  private

  def board_position_mapping(player_move)
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
