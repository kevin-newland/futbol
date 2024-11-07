require_relative 'spec_helper'

RSpec.describe StatCalculator do
  before(:all) do
    Games.load_csv('./data/games.csv')
    Teams.load_csv('./data/teams.csv')
    GameTeams.from_csv('./data/game_teams.csv')

    @games = Games.all
    @teams = Teams.all
    @game_teams = GameTeams.all
  end

  describe '#initialize' do
    it 'exists' do
      stat_calculator = StatCalculator.new(@games, @teams, @game_teams)
      expect(stat_calculator).to be_an_instance_of(StatCalculator)
    end

    it 'has attributes' do
      stat_calculator = StatCalculator.new(@games, @teams, @game_teams)

      expect(stat_calculator.games).to eq(Games.all)
      expect(stat_calculator.teams).to eq(Teams.all)
      expect(stat_calculator.game_teams).to eq(GameTeams.all)
    end
  end
end