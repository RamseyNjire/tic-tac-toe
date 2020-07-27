class GridCell
  attr_accessor :value
  @@count = 1
  def initialize
    @value = @@count.to_s
    @@count += 1
  end
end
