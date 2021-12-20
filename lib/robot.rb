# frozen_string_literal: true

class Robot
  attr_accessor :direction, :position

  def initialize; end

  def place(position:, direction:)
    @position = position
    @direction = direction
  end

  def move
    return unless robot_placed?

    movement = movement_coordinates[direction.value]
    new_x = position.coordinate_x + movement[:x]
    new_y = position.coordinate_y + movement[:y]
    return unless position.valid?(new_x, new_y)

    position.coordinate_x = new_x
    position.coordinate_y = new_y
  end

  def left
    return unless robot_placed?

    direction.value = direction.left
  end

  def right
    return unless robot_placed?

    direction.value = direction.right
  end

  def report
    return 'Robot not placed on table' unless robot_placed?

    "#{position}, #{direction.value.upcase}"
  end

  private

  def robot_placed?
    !position.nil? && !direction.nil?
  end

  def movement_coordinates
    {
      'west' => { x: -1, y: 0 },
      'north' => { x: 0, y: 1 },
      'east' => { x: 1, y: 0 },
      'south' => { x: 0, y: -1 }
    }
  end

  def reset_position(movement)
    position.coordinate_x -= movement[:x]
    position.coordinate_y -= movement[:y]
  end
end
