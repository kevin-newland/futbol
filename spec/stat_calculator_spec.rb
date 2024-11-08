require_relative 'spec_helper'

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

  describe '#initialize' do
    it 'exists' do
      expect(@stat_calculator).to be_an_instance_of(StatCalculator)
    end

    it 'has attributes' do
      expect(@stat_calculator.games).to eq(Games.all)
      expect(@stat_calculator.teams).to eq(Teams.all)
      expect(@stat_calculator.game_teams).to eq(GameTeams.all)
    end
  end

  describe '#count_of_teams' do
    it 'returns the number of teams' do
      expect(@stat_calculator.count_of_teams).to eq(32)
      expect(Teams.all.count).to eq(32)
    end
  end

  describe '#highest_total_score' do
    it 'returns the highest total score' do
      expect(@stat_calculator.highest_total_score).to eq(11)
    end
  end

  describe '#lowest_total_score' do
    it 'returns the lowest total score' do
      expect(@stat_calculator.lowest_total_score).to eq(0)  
    end
  end

  # Tests for win percentage calculations
  describe '#percentage_home_wins' do
    it 'calculates percentage_home_wins' do
      # Check that the result is a Float (e.g., 66.67)
      expect(@stat_calculator.percentage_home_wins).to be_a(Float)
    end
  end

  # Test for calculating the percentage of visitor wins
  describe '#percentage_visitor_wins' do
    it 'calculates the percentage of visitor wins' do
      expect(@stat_calculator.percentage_visitor_wins).to be_a(Float)
    end
  end

  # Test for calculating the percentage of games that ended in a tie
  describe '#percentage_ties' do
    it 'calculates percentage_ties' do
      # Check that the result is a Float (e.g., 0.0 or 50.0)
      expect(@stat_calculator.percentage_ties).to be_a(Float)
    end
  end
end