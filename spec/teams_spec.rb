require_relative 'spec_helper'
require './lib/teams'

RSpec.describe Teams do
  describe '#initialize' do
    it 'exists' do
      team1 = Teams.new(1, 'Atlanta United')
      expect(team1).to be_an_instance_of(Teams)
    end

    it 'has attributes' do
      team1 = Teams.new(1, "Atlanta United")
      expect(team1.team_id).to eq(1)
      expect(team1.teamName).to eq("Atlanta United")
    end
  end

  describe '#self.load_csv' do
    it 'creates team from path and adds them to array through iteration' do
      file_path = './spec/fixtures/fixture_teams.csv'
      teams = Teams.load_csv(file_path)

      teams.each do |team|
        expect(team).to be_an_instance_of(Teams)
      end

      expect(teams.count).to eq(5)
    end
  end
end