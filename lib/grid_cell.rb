# rubocop:disable Style/ClassMethods
class GridCell
  attr_accessor :value
  @@count = 1
  def initialize
    @value = @@count
    @@count += 1
  end

end

# rubocop: enable Style/ClassMethods