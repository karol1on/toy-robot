# frozen_string_literal: true

class Direction
  CARDINAL_DIRECTIONS = %w[west north east south].freeze

  attr_accessor :value

  def initialize(value:)
    @value = value

    raise TypeError, 'Invalid direction.' unless valid?
  end

  def left
    CARDINAL_DIRECTIONS.rotate(-1)[index]
  end

  def right
    CARDINAL_DIRECTIONS.rotate[index]
  end

  private

  def valid?
    CARDINAL_DIRECTIONS.include?(value)
  end

  def index
    CARDINAL_DIRECTIONS.index(value)
  end
end
