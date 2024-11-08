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
    # Expected results - update these based csv files
    @expected_winningest_coach = "Dan Lacroix"    # Ensure this is the coach with the highest win percentage
    @expected_worst_coach = "Martin Raymond"      # Ensure this is the coach with the lowest win percentage
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

  # Tests for Coach Performance Calculations

  # Test for the winningest_coach method
  describe '#winningest_coach' do
    it 'returns the coach with the highest win percentage' do
      # Replace 'Expected Coach Name' with the name of the coach expected to have the highest win percentage
      expect(@stat_calculator.winningest_coach).to eq(@expected_winningest_coach)
    end
  end

  # Test for the worst_coach method
  describe '#worst_coach' do
    it 'returns the coach with the lowest win percentage' do
      # Replace 'Expected Worst Coach Name' with the name of the coach expected to have the lowest win percentage
      expect(@stat_calculator.worst_coach).to eq(@expected_worst_coach)
    end
  end
end
