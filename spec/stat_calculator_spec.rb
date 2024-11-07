require_relative 'spec_helper'

RSpec.describe StatCalculator do
  describe '#initialize' do
    it 'exists' do
      stat_calculator = StatCalculator.new
      expect(stat_calculator).to be_an_instance_of(StatCalculator)
    end
  end
end