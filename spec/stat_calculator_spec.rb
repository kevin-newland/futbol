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
    @stat_calculator = StatCalculator.new(@games, @teams, @game_teams)
  end

  it 'exists' do
    expect(@stat_calculator).to be_an_instance_of(StatCalculator)
  end

  it 'calculates percentage_home_wins' do

    expect(@stat_calculator.percentage_home_wins).to be_a(Float)
  end

  it 'calculates percentage_visitor_wins' do
 
    expect(@stat_calculator.percentage_visitor_wins).to be_a(Float)
  end
  
  it 'calculates percentage_ties' do
    expect(@stat_calculator.percentage_ties).to be_a(Float)
  end
end

