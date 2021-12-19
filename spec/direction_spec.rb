# frozen_string_literal: true

require_relative '../lib/direction'

describe Direction do
  describe '#initialize' do
    subject { described_class.new(value: value) }

    context 'when invalid direction value is passed' do
      let(:value) { 'test' }

      it 'should raise TypeError' do
        expect { subject }.to raise_error(TypeError)
      end
    end
  end

  describe '#left' do
    subject { described_class.new(value: value).left }

    context 'when direction value is east' do
      let(:value) { 'east' }
      it 'should return north' do
        expect(subject).to eq('north')
      end
    end
  end

  describe '#right' do
    subject { described_class.new(value: value).right }

    context 'when direction value is north' do
      let(:value) { 'north' }
      it 'should return east' do
        expect(subject).to eq('east')
      end
    end
  end
end
