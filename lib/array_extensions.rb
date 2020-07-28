class Array
  def all_cells_empty?
    all? { |element| element.to_i.positive? }
  end

  def any_cell_empty?
    any? { |element| element.to_i.positive? }
  end

  def no_cell_empty?
    !any_cell_empty?
  end

  def all_cells_same?
    all? { |element| element == self[2] }
  end
end
