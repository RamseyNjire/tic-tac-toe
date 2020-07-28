# rubocop:disable Style/ClassVars
class GridCell
  attr_accessor :value
  @@count = 1
  def initialize
    @value = @@count
    @@count += 1
  end
end

# rubocop: enable Style/ClassVars