# spec/stat_calculator_spec.rb
require 'spec_helper'

RSpec.describe StatCalculator do
  before(:all) do
    Games.load_csv('./data/games.csv')
    Teams.load_csv('./data/teams.csv')
    GameTeams.from_csv('./data/game_teams.csv')

    @games = Games.all
    @teams = Teams.all
    @game_teams = GameTeams.all

    # Create a new StatCalculator instance with the loaded data
    @stat_calculator = StatCalculator.new(@games, @teams, @game_teams)
  end

  # Test to confirm that StatCalculator exists and initializes correctly
  it 'exists' do
    expect(@stat_calculator).to be_an_instance_of(StatCalculator)
  end

  # Test for calculating the percentage of home wins
  it 'calculates percentage_home_wins' do
  # Check that the result is a Float (e.g., 66.67)
    expect(@stat_calculator.percentage_home_wins).to be_a(Float)
  end

  # Test for calculating the percentage of visitor wins
  it 'calculates percentage_visitor_wins' do
  # Check that the result is a Float (e.g., 33.33)
    expect(@stat_calculator.percentage_visitor_wins).to be_a(Float)
  end
  
  # Test for calculating the percentage of games that ended in a tie
  it 'calculates percentage_ties' do
    # Check that the result is a Float (e.g., 0.0 or 50.0)
    expect(@stat_calculator.percentage_ties).to be_a(Float)
  end
end

