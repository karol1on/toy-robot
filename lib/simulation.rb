# frozen_string_literal: true

require_relative 'direction'
require_relative 'position'
require_relative 'robot'
require_relative 'table'

class Simulation
  def initialize(table: Table.new(width: 5, height: 5), robot: Robot.new)
    @table = table
    @robot = robot
  end

  def evaluate(input)
    command, params = input.downcase.split(/\s/, 2)
    params = params.split(/\s*,\s*/) unless params.nil?
    return if command.nil?

    if command == 'place'
      place_robot(params)
    elsif robot.respond_to?(command)
      robot.send(command)
    end
  end

  private

  attr_reader :table, :robot

  def place_robot(params)
    return if params.nil?

    position = Position.new(coordinate_x: params[0].to_i, coordinate_y: params[1].to_i, table: table)
    direction = Direction.new(value: params[2])
    robot.place(position: position, direction: direction)
  end
end
