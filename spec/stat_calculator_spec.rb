RSpec.describe StatCalculator do
  before(:all) do
    Games.reset
    GameTeams.reset
    Teams.reset

    Games.load_csv('./data/games.csv')
    GameTeams.from_csv('./data/game_teams.csv')
    Teams.load_csv('./data/teams.csv')

    @games = Games.all
    @teams = Teams.all
    @game_teams = GameTeams.all

    # Debugging outputs
    puts "Loaded Games Count: #{@games.count}" # Should output the number of games
    puts "Loaded Teams Count: #{@teams.count}" # Should output the number of teams
    puts "Loaded GameTeams Count: #{@game_teams.count}" # Should output the number of game_teams

    @stat_calculator = StatCalculator.new(@games, @teams, @game_teams)
    puts "StatCalculator Initialized: #{@stat_calculator.inspect}" # Should confirm initialization

    # Set season-specific expected results - update these based on the CSV files
    @season_id = "20122013"  # Example season_id; replace with an appropriate one based on your dataset
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

    describe '#games_in_season' do
    it 'returns game IDs for a specific season' do
      season = '20132014'
      expected_game_ids = @games.select { |game| game.season == season }.map(&:game_id)
      expect(@stat_calculator.games_in_season(season)).to eq(expected_game_ids)
    end
  end

  describe '#most_accurate_team' do
    it 'returns the most accurate team for a given season' do
      season = '20132014'
      expected_team = 'Real Salt Lake' 
      expect(@stat_calculator.most_accurate_team(season)).to eq(expected_team)
    end
  end

    describe '#least_accurate_team' do
    it 'returns the least accurate team for a given season' do
      season = '20132014'
      expected_team = 'New York City FC' 
      expect(@stat_calculator.least_accurate_team(season)).to eq(expected_team)
    end
  end

  describe '#most_accurate_team and #least_accurate_team' do
    it 'returns results for all valid seasons' do
      # Step 1: Retrieve all unique seasons
      seasons = @games.map(&:season).uniq

      # Step 2: Iterate through each season and test both methods
      seasons.each do |season|
        expect(@stat_calculator.most_accurate_team(season)).not_to be_nil,
          "Expected most_accurate_team to return a team for season #{season}, but got nil."

        expect(@stat_calculator.least_accurate_team(season)).not_to be_nil,
          "Expected least_accurate_team to return a team for season #{season}, but got nil."
      end
    end
  end
end

