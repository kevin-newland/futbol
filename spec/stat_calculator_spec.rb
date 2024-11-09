require_relative 'spec_helper'

RSpec.describe StatCalculator do
  before(:all) do
    Games.load_csv('./data/games.csv')
    GameTeams.from_csv('./data/game_teams.csv')
    Teams.load_csv('./data/teams.csv')

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

  describe '#average_goals_per_game' do
    it "#average_goals_per_game" do
      expect(@stat_calculator.average_goals_per_game).to eq(4.22)
    end
  end

  describe '#average_goals_by_season' do
    it "#average_goals_by_season" do
      expected = {
        "20122013"=>4.12,
        "20162017"=>4.23,
        "20142015"=>4.14,
        "20152016"=>4.16,
        "20132014"=>4.19,
        "20172018"=>4.44
      }
      expect(@stat_calculator.average_goals_by_season).to eq(expected)
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

  describe '#highest_scoring_visitor' do
    it 'returns the name of the away team with the highest average score' do
      expect(@stat_calculator.highest_scoring_visitor).to eq("FC Dallas")
    end
  end

  describe '#lowest_scoring_visitor' do
    it 'returns the name of the away team with the lowest average score' do
      expect(@stat_calculator.lowest_scoring_visitor).to eq("San Jose Earthquakes")
    end
  end

  describe '#count_of_games_by_season' do
    it 'returns the total number of games for each season' do
      expected = {
        "20122013"=>806,
        "20162017"=>1317,
        "20142015"=>1319,
        "20152016"=>1321,
        "20132014"=>1323,
        "20172018"=>1355
      }
      expect(@stat_calculator.count_of_games_by_season).to eq(expected)
    end
  end

  describe '#highest_scoring_home_team' do
    it 'returns the name of the home team with the highest average score' do
      expect(@stat_calculator.highest_scoring_home_team).to eq("Reign FC")
    end
  end

  describe '#lowest_scoring_home_team' do
    it 'returns the name of the home team with the lowest average score' do
      expect(@stat_calculator.lowest_scoring_home_team).to eq("Utah Royals FC")
    end
  end
end