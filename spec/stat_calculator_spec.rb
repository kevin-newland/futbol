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

  describe '#game_ids_in_season(season)' do
    it 'filter games in the specified season' do
      expect(@stat_calculator.game_ids_in_season("20122013").count).to eq(806)
    end
  end

  describe '#game_teams_in_season(season)' do
    it 'filter games_teams in the specified season' do
      expect(@stat_calculator.game_teams_in_season("20122013").count).to eq(1612)
    end
  end

  describe '#teams_shot_ratios_by_season(season)' do
    it 'filter teams in the specified season' do
      stats = @stat_calculator.teams_shot_ratios_by_season("20122013")
      expect(stats.count).to eq(30)
    end
  end

  describe '#most_accurate_team(season)' do
    it 'returns name of most accurate team' do
      stats1 = @stat_calculator.most_accurate_team("20132014")
      expect(stats1).to eq("Real Salt Lake")
      
      stats2 = @stat_calculator.most_accurate_team("20142015")
      expect(stats2).to eq("Toronto FC")
    end
  end

  describe '#least_accurate_team(season)' do
    xit 'returns name of most accurate team' do
      stats1 = @stat_calculator.least_accurate_team("20132014")
      expect(stats1).to eq("New York City FC")
      
      stats2 = @stat_calculator.least_accurate_team("20142015")
      expect(stats2).to eq("Columbus Crew SC")
    end
  end
end