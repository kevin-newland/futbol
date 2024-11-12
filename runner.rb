require './lib/stat_calculator'
require './lib/games'
require './lib/teams'
require './lib/game_teams'

# Load data from CSV files
games = Games.load_csv('./data/games.csv')
teams = Teams.load_csv('./data/teams.csv')
game_teams = GameTeams.from_csv('./data/game_teams.csv')

# Initialize StatCalculator
stat_calculator = StatCalculator.new(games, teams, game_teams)

puts "========== StatCalculator Results =========="

# Command Outputs
puts "Average Goals Per Game: #{stat_calculator.average_goals_per_game}"
puts "Average Goals By Season: #{stat_calculator.average_goals_by_season}"
puts "Highest Total Score: #{stat_calculator.highest_total_score}"
puts "Lowest Total Score: #{stat_calculator.lowest_total_score}"
puts "Count of Teams: #{stat_calculator.count_of_teams}"

# Percentage Calculations
puts "Percentage of Home Wins: #{stat_calculator.percentage_home_wins}%"
puts "Percentage of Visitor Wins: #{stat_calculator.percentage_visitor_wins}%"
puts "Percentage of Ties: #{stat_calculator.percentage_ties}%"

# Coach Performance
season_id = "20132014" # Example season; replace with actual values as needed
puts "Winningest Coach (#{season_id}): #{stat_calculator.winningest_coach(season_id)}"
puts "Worst Coach (#{season_id}): #{stat_calculator.worst_coach(season_id)}"

# Team Statistics
puts "Highest Scoring Visitor: #{stat_calculator.highest_scoring_visitor}"
puts "Lowest Scoring Visitor: #{stat_calculator.lowest_scoring_visitor}"
puts "Highest Scoring Home Team: #{stat_calculator.highest_scoring_home_team}"
puts "Lowest Scoring Home Team: #{stat_calculator.lowest_scoring_home_team}"
puts "Best Offense: #{stat_calculator.best_offense}"
puts "Worst Offense: #{stat_calculator.worst_offense}"

# Accuracy
puts "Most Accurate Team (#{season_id}): #{stat_calculator.most_accurate_team(season_id)}"
puts "Least Accurate Team (#{season_id}): #{stat_calculator.least_accurate_team(season_id)}"
season_id = "20132014"
puts "Most Accurate Team (#{season_id}): #{stat_calculator.most_accurate_team(season_id)}"
puts "Least Accurate Team (#{season_id}): #{stat_calculator.least_accurate_team(season_id)}"

# Tackles
puts "Most Tackles (#{season_id}): #{stat_calculator.most_tackles(season_id)}"
puts "Fewest Tackles (#{season_id}): #{stat_calculator.fewest_tackles(season_id)}"

# Games by Season
puts "Games By Season: #{stat_calculator.count_of_games_by_season}"

puts "========== StatCalculator End Report =========="