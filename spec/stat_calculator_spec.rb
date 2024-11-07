# spec/stat_calculator_spec.rb
require 'spec_helper'

RSpec.describe StatCalculator do
  it 'exists' do
    stat_calculator = StatCalculator.new
    expect(stat_calculator).to be_an_instance_of(StatCalculator)
  end
end