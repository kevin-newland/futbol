RSpec.describe StatCalculator do
  before(:all) do
    # Ensure the data is reset and loaded properly
    Games.reset
    GameTeams.reset
    Teams.reset

    Games.load_csv('./data/games.csv')
    GameTeams.from_csv('./data/game_teams.csv')
    Teams.load_csv('./data/teams.csv')

    # Retrieve data for all games, teams, and game_teams
    @games = Games.all
    @teams = Teams.all
    @game_teams = GameTeams.all

    # Debugging outputs to confirm data is loaded correctly
    puts "Loaded Games Count: #{@games.count}" # Should output the number of games
    puts "Loaded Teams Count: #{@teams.count}" # Should output the number of teams
    puts "Loaded GameTeams Count: #{@game_teams.count}" # Should output the number of game_teams

    # Initialize the StatCalculator
    @stat_calculator = StatCalculator.new(@games, @teams, @game_teams)
    puts "StatCalculator Initialized: #{@stat_calculator.inspect}" # Should confirm initialization

    # Set season-specific expected results
    @season_id = "20122013" # A valid season ID from dataset
    @expected_winningest_coach = "Dan Lacroix" # Example expected result
    @expected_worst_coach = "Martin Raymond"   # Example expected result
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
      expected_team = 'Real Salt Lake' # Replace with actual expected result based on your dataset
      expect(@stat_calculator.most_accurate_team(season)).to eq(expected_team)
    end
  end

  describe '#least_accurate_team' do
    it 'returns the least accurate team for a given season' do
      season = '20132014'
      expected_team = 'New York City FC' # Replace with actual expected result based on your dataset
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

  describe '#average_goals_per_game' do
    it 'calculates the average goals per game' do
      expect(@stat_calculator.average_goals_per_game).to eq(4.22)
    end
  end

  describe '#average_goals_by_season' do
    it 'calculates average goals by season' do
      expected = {
        "20122013" => 4.12,
        "20162017" => 4.23,
        "20142015" => 4.14,
        "20152016" => 4.16,
        "20132014" => 4.19,
        "20172018" => 4.44
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

  describe '#percentage_home_wins' do
    it 'calculates the dynamically determined percentage of games won by the home team' do
      home_wins = @games.count { |game| game.home_goals.to_i > game.away_goals.to_i }
      total_games = @games.size
      expected_percentage = ((home_wins.to_f / total_games)).round(2)

      expect(@stat_calculator.percentage_home_wins).to eq(expected_percentage)
    end

    it 'returns 0.0 when there are no games' do
      empty_stat_calculator = StatCalculator.new([], @teams, @game_teams)
      expect(empty_stat_calculator.percentage_home_wins).to eq(0.0)
    end
  end

  describe '#percentage_visitor_wins' do
    it 'calculates the dynamically determined percentage of games won by the visiting team' do
      visitor_wins = @games.count { |game| game.away_goals.to_i > game.home_goals.to_i }
      total_games = @games.size
      expected_percentage = ((visitor_wins.to_f / total_games)).round(2)

      expect(@stat_calculator.percentage_visitor_wins).to eq(expected_percentage)
    end

    it 'returns 0.0 when there are no games' do
      empty_stat_calculator = StatCalculator.new([], @teams, @game_teams)
      expect(empty_stat_calculator.percentage_visitor_wins).to eq(0.0)
    end
  end

  describe '#percentage_ties' do
    it 'calculates the dynamically determined percentage of games that resulted in a tie' do
      ties = @games.count { |game| game.home_goals.to_i == game.away_goals.to_i }
      total_games = @games.size
      expected_percentage = ((ties.to_f / total_games)).round(2)

      expect(@stat_calculator.percentage_ties).to eq(expected_percentage)
    end

    it 'returns 0.0 when there are no games' do
      empty_stat_calculator = StatCalculator.new([], @teams, @game_teams)
      expect(empty_stat_calculator.percentage_ties).to eq(0.0)
    end
  end

  describe '#winningest_coach' do
    it 'returns the coach with the highest win percentage for a specific season' do
      expect(@stat_calculator.winningest_coach(@season_id)).to eq(@expected_winningest_coach)
    end

    it 'returns nil if no games are found for the specified season' do
      expect(@stat_calculator.winningest_coach("INVALID_SEASON")).to be_nil
    end
  end

  describe '#worst_coach' do
    it 'returns the coach with the lowest win percentage for a specific season' do
      expect(@stat_calculator.worst_coach(@season_id)).to eq(@expected_worst_coach)
    end

    it 'returns nil if no games are found for the specified season' do
      expect(@stat_calculator.worst_coach("INVALID_SEASON")).to be_nil
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
        "20122013" => 806,
        "20162017" => 1317,
        "20142015" => 1319,
        "20152016" => 1321,
        "20132014" => 1323,
        "20172018" => 1355
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

  describe '#best_offense' do
    it 'returns the team with the highest average goals per game' do
      expect(@stat_calculator.best_offense).to eq("Reign FC")
    end
  end

  describe '#worst_offense' do
    it 'returns the team with the lowest average goals per game' do
      expect(@stat_calculator.worst_offense).to eq("Utah Royals FC")
    end
  end

  describe '#most_tackles' do
    it 'returns the team with the most tackles in the season' do
      expect(@stat_calculator.most_tackles("20132014")).to eq("FC Cincinnati")
      expect(@stat_calculator.most_tackles("20142015")).to eq("Seattle Sounders FC")
    end
  end

  describe '#fewest_tackles' do
    it 'returns the team with the fewest tackles in the season' do
      expect(@stat_calculator.fewest_tackles("20132014")).to eq("Atlanta United")
      expect(@stat_calculator.fewest_tackles("20142015")).to eq("Orlando City SC")
    end
  end
end