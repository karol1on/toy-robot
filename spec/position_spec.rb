# frozen_string_literal: true

require_relative '../lib/position'
require_relative '../lib/table'

describe Position do
  let(:table) { Table.new(width: 10, height: 12) }

  describe '#initialize' do
    subject { described_class.new(coordinate_x: coordinate_x, coordinate_y: coordinate_y, table: table) }

    context 'when there is no such position on the table' do
      let(:coordinate_x) { 7 }
      let(:coordinate_y) { 13 }

      it 'should raise TypeError' do
        expect { subject }.to raise_error(TypeError)
      end
    end
  end

  describe '#to_s' do
    subject { described_class.new(coordinate_x: coordinate_x, coordinate_y: coordinate_y, table: table).to_s }

    let(:coordinate_x) { 7 }
    let(:coordinate_y) { 12 }

    it 'returns coordinates as string' do
      expect(subject).to eq('7, 12')
    end
  end
end
