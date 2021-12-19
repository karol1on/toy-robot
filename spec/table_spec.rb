# frozen_string_literal: true

require_relative '../lib/table'

describe Table do
  describe '#initialize' do
    context 'when the attributes are not integers' do
      subject { described_class.new(width: '1', height: 'Test') }

      it 'should raise TypeError' do
        expect { subject }.to raise_error(TypeError)
      end
    end
  end
end
