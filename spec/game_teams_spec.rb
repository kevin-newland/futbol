require_relative 'spec_helper'

RSpec.describe GameTeams do
  before(:all) do
    @objects = []

    CSV.foreach('./spec/fixtures/fixture_game_teams.csv', headers: true, header_converters: :symbol) do |row|
      @objects << GameTeams.new(
        row[:game_id],
        row[:team_id],
        row[:hoa],
        row[:result],
        row[:head_coach],
        row[:goals].to_i,
        row[:shots].to_i,
        row[:tackles].to_i
      )
    end
  end

  describe '#initialize' do
    it 'exists' do
      expect(@objects[0]).to be_an_instance_of(GameTeams)
    end

    it 'has attributes' do
      expect(@objects[0].game_id).to eq("2012030221")
      expect(@objects[0].team_id).to eq("3")
      expect(@objects[0].hoa).to eq("away")
      expect(@objects[0].result).to eq("LOSS")
      expect(@objects[0].head_coach).to eq("John Tortorella")
      expect(@objects[0].goals).to eq(2)
      expect(@objects[0].shots).to eq(8)
      expect(@objects[0].tackles).to eq(44)
    end

    it 'can have different attributes' do
      expect(@objects[1].game_id).to eq("2012030221")
      expect(@objects[1].team_id).to eq("6")
      expect(@objects[1].hoa).to eq("home")
      expect(@objects[1].result).to eq("WIN")
      expect(@objects[1].head_coach).to eq("Claude Julien")
      expect(@objects[1].goals).to eq(3)
      expect(@objects[1].shots).to eq(12)
      expect(@objects[1].tackles).to eq(51)
    end
  end
end