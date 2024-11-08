require_relative 'spec_helper'

RSpec.describe StatCalculator do
  before(:all) do
    # Load CSV files
    Games.load_csv('./data/games.csv')
    Teams.load_csv('./data/teams.csv')
    GameTeams.from_csv('./data/game_teams.csv')

    # Initialize instance variables
    @games = Games.all
    @teams = Teams.all
    @game_teams = GameTeams.all
    @stat_calculator = StatCalculator.new(@games, @teams, @game_teams)
    
    # Set season-specific expected results
    @season_id = "20122013"  # Example season_id; replace with an actual season ID from your data
    @expected_winningest_coach = "Dan Lacroix"    # Expected coach with the highest win percentage for the season
    @expected_worst_coach = "Martin Raymond"      # Expected coach with the lowest win percentage for the season
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

  # Tests for Win Percentage Calculations

  describe '#percentage_home_wins' do
    it 'calculates the percentage of games won by the home team' do
      expect(@stat_calculator.percentage_home_wins).to be_a(Float)
    end
  end

  describe '#percentage_visitor_wins' do
    it 'calculates the percentage of games won by the visiting team' do
      expect(@stat_calculator.percentage_visitor_wins).to be_a(Float)
    end
  end

  describe '#percentage_ties' do
    it 'calculates the percentage of games that ended in a tie' do
      expect(@stat_calculator.percentage_ties).to be_a(Float)
    end
  end

  # Updated Tests for Coach Performance Calculations by Season

  describe '#winningest_coach' do
    it 'returns the coach with the highest win percentage for a specific season' do
      # Passing season_id to ensure season-specific calculation
      expect(@stat_calculator.winningest_coach(@season_id)).to eq(@expected_winningest_coach)
    end
  end

  describe '#worst_coach' do
    it 'returns the coach with the lowest win percentage for a specific season' do
      # Passing season_id to ensure season-specific calculation
      expect(@stat_calculator.worst_coach(@season_id)).to eq(@expected_worst_coach)
    end
  end
end