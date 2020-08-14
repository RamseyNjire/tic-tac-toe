
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



