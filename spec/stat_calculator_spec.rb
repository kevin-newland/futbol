# spec/stat_calculator_spec.rb
require 'rspec'
require_relative '../lib/stat_calculator'

RSpec.describe StatCalculator do
  it 'exists' do
    stat_calculator = StatCalculator.new
    expect(stat_calculator).to be_an_instance_of(StatCalculator)
  end
end