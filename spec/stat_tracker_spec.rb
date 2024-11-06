require_relative 'spec_helper'

RSpec.describe StatTracker do
  before(:all) do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'

    @locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }
  end

  describe '#initialize' do
    it 'exists' do
      stat_tracker = StatTracker.new(@locations)
      expect(stat_tracker).to be_an_instance_of(StatTracker)
    end

    it 'has attributes' do
      stat_tracker = StatTracker.new(@locations)
      expect(stat_tracker.game_path).to eq('./data/games.csv')
      expect(stat_tracker.team_path).to eq('./data/teams.csv')
      expect(stat_tracker.game_teams_path).to eq('./data/game_teams.csv')
    end
  end

  describe '#from_csv' do
    it 'exists' do
      stat_tracker = StatTracker.from_csv(@locations)
      expect(stat_tracker).to be_an_instance_of(StatTracker)
    end

    it 'has attributes' do
      stat_tracker = StatTracker.from_csv(@locations)
      expect(stat_tracker.game_path).to eq('./data/games.csv')
      expect(stat_tracker.team_path).to eq('./data/teams.csv')
      expect(stat_tracker.game_teams_path).to eq('./data/game_teams.csv')
    end
  end
end