# frozen_string_literal: true

require_relative '../lib/simulation'

describe Simulation do
  let(:robot) { instance_double(Robot) }

  describe '#evaluate' do
    subject { described_class.new(robot: robot).evaluate(input) }

    context 'when place command' do
      before do
        allow(Position).to receive(:new).and_return(dummy_position)
        allow(Direction).to receive(:new).and_return(dummy_direction)
        allow(robot).to receive(:place).and_return(nil)
      end

      let(:input) { 'PLACE 0,0,NORTH' }
      let(:dummy_position) { instance_double(Position) }
      let(:dummy_direction) { instance_double(Direction) }

      it 'initializes the Position with proper arguments' do
        subject
        expect(Position).to have_received(:new).with(coordinate_x: 0, coordinate_y: 0, table: instance_of(Table))
      end

      it 'initializes the Direction with proper arguments' do
        subject
        expect(Direction).to have_received(:new).with(value: 'north')
      end

      it 'calls place method' do
        subject
        expect(robot).to have_received(:place).with(position: dummy_position, direction: dummy_direction)
      end
    end

    context 'when valid command' do
      before { allow(robot).to receive(:move) }

      let(:input) { 'MOVE' }

      it 'calls move method' do
        subject
        expect(robot).to have_received(:move)
      end
    end
  end
end
