
require_relative '../lib/grid_cell.rb'
require_relative '../lib/player.rb'
require_relative '../lib/array_extensions.rb'
require_relative '../lib/board.rb'
require_relative '../lib/game.rb'

describe GridCell do
  let(:cell) {GridCell.new}
  it "has the value attribute" do
    expect(cell).to respond_to(:value)
  end
end

describe Player do
  let(:player) {Player.new({name: "Joe", symbol: "X"})}
  it "has the symbol and name attributes" do
    expect(player).to have_attributes(:name => "Joe", :symbol => "X")
  end
  it "throws an error when the argument is not a hash" do
    expect{Player.new(23)}.to raise_error(NoMethodError)
  end
end

describe Board do
  let(:board) {Board.new}
  let! (:set_board) {board.set_board_cell(1, 2, "x")}
  it "has the board attribute" do
    expect(board).to respond_to(:board)
  end

  context "getting a board cell" do
    it "the get_board_cell method only accepts integer arguments" do
      expect{board.get_board_cell("1", "2")}.to raise_error(TypeError)
    end
    it "returns a grid cell" do
      expect(board.get_board_cell(1, 2)).to be_a(GridCell)
    end
  end
  
  context "setting a board cell" do
    it "is expected to take at least 3 arguments" do
      expect(board).to respond_to(:set_board_cell).with(3).arguments
    end
    it "throws an error when the arguments are less than or greater than 3" do
      expect{board.set_board_cell}.to raise_error(ArgumentError)
      expect{board.set_board_cell(1, 2, 3, 4)}.to raise_error(ArgumentError)
    end
    it "raises an error if the first two arguments are not valid co-ordinates" do
      expect{board.set_board_cell(10, 10, 10)}.to raise_error(NoMethodError)
    end
    it "returns false if the value is already taken" do
      expect(board.set_board_cell(1, 2, "x")).to be(false)
    end
  end
end

describe Array do
  array_1 = [1, 2, 3, 4, 5]
  array_2 = [0, 0, 0]
  array_3 = [1,0 ,0, 0]
  context 'all cells empty' do
    it 'should return true if all values are positive' do
      expect(array_1.all_cells_empty?).to be(true)
    end
    it 'should return false if not all values are positive' do
      expect(array_2.all_cells_empty?).to be(false)
    end

  end

  context 'any cell empty' do
    it 'returns true if any value is positive' do
      expect(array_3.any_cell_empty?).to be(true)
    end
    it 'returns false if no value is positive' do
      expect(array_2.any_cell_empty?).to be(false)
    end
  end

  context 'no cell empty' do
    it 'returns true if no value is positive' do
      expect(array_2.no_cell_empty?).to be(true)
    end
    it 'returns false if any value is positive' do
      expect(array_3.no_cell_empty?).to be(false)
    end
  end

  context 'all cells same' do
    it 'returns true if all values are the same' do
      expect(array_2.all_cells_same?).to be(true)
    end
    it 'returns false if not all values are the same' do
      expect(array_3.all_cells_same?).to be(false)
    end
  end
end

describe Game do
  let(:board) {Board.new}
  let(:player_one) {Player.new({name: "Joe", symbol: "X"})}
  let(:player_two) {Player.new({name: "Jane", symbol: "O"})}
  let(:game) {Game.new(player_one, player_two, board)}
  it "has two player attributes and one board attribute" do
    expect(game).to have_attributes(:current_player => player_one, :second_player => player_two, :board => board)
  end

  context "switch players" do
    it "switches the current player from player_one to player_two and vice versa" do
      game.switch_player
      expect(game.current_player).to be(player_two)
    end
  end

  context "ask for move" do
    it "should call the name method of the current player" do
      expect(player_one).to receive(:name)
      game.ask_for_move
    end
  end

  context "get player move" do
    it "should raise an error if no argument is or too many arguments are given" do
      expect{game.get_player_move}.to raise_error(ArgumentError)
      expect{game.get_player_move(1,2)}.to raise_error(ArgumentError)
    end
    it "should returns nil if the argument is not an integer in the range 1 to 9" do
      expect(game.get_player_move(10)).to be(nil)
    end
    it "should return an array if the argument is an integer in the range 1 to 9" do
      expect(game.get_player_move(5)).to be_a(Array)
    end
  end

  context "end game message" do
    it "should call the name method of the current player" do
      game.board.set_board_cell(0,0,"X")
      game.board.set_board_cell(0,1,"X")
      game.board.set_board_cell(0,2,"X")
      expect(player_one).to receive(:name)
      game.end_game_message
    end
  end
end



