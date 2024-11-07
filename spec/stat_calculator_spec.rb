require_relative 'spec_helper'

RSpec.describe StatCalculator do
  before(:all) do
    Games.load_csv('./data/games.csv')
    GameTeams.from_csv('./data/game_teams.csv')
    Teams.load_csv('./data/teams.csv')

    @games = Games.all
    @teams = Teams.all
    @game_teams = Games.all
    @stat_calculator = StatCalculator.new(@games, @teams, @game_teams)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@stat_calculator).to be_an_instance_of(StatCalculator)
    end

    it 'has attributes' do
      expect(@stat_calculator.games).to eq(Games.all)
      expect(@stat_calculator.teams).to eq(Teams.all)
      expect(@stat_calculator.game_teams).to eq(Games.all)
    end
  end

  describe '#average_goals_per_game' do
    it "#average_goals_per_game" do
      expect(@stat_calculator.average_goals_per_game).to eq(4.22)
    end
  end
end
 
