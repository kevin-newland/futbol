# spec/stat_calculator_spec.rb
require 'spec_helper'

RSpec.describe StatCalculator do
  before(:all) do
    @games_data = [
      { home_goals: '2', away_goals: '2' }, # Tie
      { home_goals: '3', away_goals: '2' }, # Home win
      { home_goals: '1', away_goals: '2' }, # Visitor win
      { home_goals: '3', away_goals: '3' }, # Tie
      { home_goals: '4', away_goals: '1' }  # Home win
    ]
    @stat_calculator = StatCalculator.new
  end

  it 'exists' do
    expect(@stat_calculator).to be_an_instance_of(StatCalculator)
  end

  it 'calculates percentage_home_wins' do
    # 2 out of 5 games are home wins
    expect(@stat_calculator.percentage_home_wins(@games_data)).to eq(40.0)
  end

  it 'calculates percentage_visitor_wins' do
    # 1 out of 5 games is a visitor win
    expect(@stat_calculator.percentage_visitor_wins(@games_data)).to eq(20.0)
  end
  
  it 'calculates percentage_ties' do
    # 2 out of 5 games in @games_data are ties
    expect(@stat_calculator.percentage_ties(@games_data)).to eq(40.0)
  end
end