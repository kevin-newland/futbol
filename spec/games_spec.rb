require_relative 'spec_helper'
require_relative 'games_spec'
require './lib/games'

RSpec.describe Games do
    describe '#initialize' do
        it 'exists' do
            game_1 = Games.new(2012030221, 20122013, 3, 6, 2, 3)

            expect(game_1).to be_a(Games)
        end

        it 'has attributes' do
            game_1 = Games.new(2012030221, 20122013, 3, 6, 2, 3)

            expect(game_1.game_id).to eq(2012030221)
            expect(game_1.home_team_id).to eq(6)
        end
    end

    describe '#self.from_csv' do 
        it 'creates games from csv' do
            game_path = './data/games.csv'
            games = Games.load_csv(game_path)
        games.each do |game|
            expect(game).to be_an_instance_of(Games)
        end

        expect(games[1].season).to eq(20122013) 
        end
    end
end
