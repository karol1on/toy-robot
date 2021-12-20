# frozen_string_literal: true

require_relative '../lib/direction'
require_relative '../lib/position'
require_relative '../lib/robot'
require_relative '../lib/table'

describe Robot do
  let(:robot) { described_class.new }
  let(:table) { Table.new(width: 5, height: 5) }
  let(:position) { Position.new(coordinate_x: 0, coordinate_y: 0, table: table) }
  let(:direction) { Direction.new(value: direction_value) }
  let(:direction_value) { 'east' }

  describe '#move' do
    subject { robot.move }

    before { robot.place(position: position, direction: direction) }

    context 'when valid movement' do
      it 'changes position' do
        expect { subject }.to change(position, :to_s).from('0, 0').to('1, 0')
      end
    end

    context 'when invalid movement' do
      let(:direction_value) { 'south' }

      it 'does not change the position' do
        expect { subject }.not_to change(position, :to_s).from('0, 0')
        expect(position.to_s).to eq('0, 0')
      end
    end
  end

  describe '#left' do
    subject { robot.left }

    before { robot.place(position: position, direction: direction) }

    it 'rotates robot left' do
      expect { subject }.to change(direction, :value).from('east').to('north')
    end
  end

  describe '#right' do
    subject { robot.right }

    before { robot.place(position: position, direction: direction) }

    it 'rotates robot right' do
      expect { subject }.to change(direction, :value).from('east').to('south')
    end
  end

  describe '#report' do
    subject { robot.report }

    context 'when robot placed on the table' do
      before { robot.place(position: position, direction: direction) }

      it 'returns robot position' do
        expect(subject).to eq('0, 0, EAST')
      end
    end

    context 'when robot is not placed on the table' do
      it 'returns not placed message' do
        expect(subject).to eq('Robot not placed on table')
      end
    end
  end
end
