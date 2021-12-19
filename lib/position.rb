# frozen_string_literal: true

class Position
  attr_accessor :coordinate_x, :coordinate_y, :table

  def initialize(coordinate_x:, coordinate_y:, table:)
    @table = table
    raise TypeError, 'Invalid position.' unless valid?(coordinate_x, coordinate_y)

    @coordinate_x = coordinate_x
    @coordinate_y = coordinate_y
  end

  def to_s
    "#{coordinate_x}, #{coordinate_y}"
  end

  def valid?(new_x, new_y)
    new_x >= 0 && new_y >= 0 &&
      new_x <= table.width && new_y <= table.height
  end
end
