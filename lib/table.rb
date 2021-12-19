# frozen_string_literal: true

class Table
  attr_reader :width, :height

  def initialize(width:, height:)
    @width = width
    @height = height

    raise TypeError, 'Invalid table sizes. Only integers allowed.' unless valid?
  end

  private

  def valid?
    width.is_a?(Integer) && height.is_a?(Integer)
  end
end
