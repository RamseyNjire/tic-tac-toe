class Array
  def all_cells_empty?
    self.all? { |element| element.to_s.empty? }
  end

  def any_cell_empty?
    self.any? { |element| element.to_s.empty? }
  end

  def no_cell_empty?
    !any_cell_empty?
  end

  def all_cells_same?
    self.all? { |element| element == self[2] }
  end
end