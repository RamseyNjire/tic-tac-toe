class Player
  attr_reader :symbol, :name
  def initialize(player_details)
    @name = player_details.fetch(:name)
    @symbol = player_details.fetch(:symbol)
  end
end
