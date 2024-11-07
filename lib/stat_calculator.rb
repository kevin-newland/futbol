# lib/stat_calculator.rb
class StatCalculator
  def initialize(games, teams, game_teams)
    @games = games
    @teams = teams
    @game_teams = game_teams
  end

  def percentage_home_wins
    total_games = @games.size
    home_wins = @games.count { |game| game.home_goals.to_i > game.away_goals.to_i }
    ((home_wins.to_f / total_games) * 100).round(2)
  end

  def percentage_visitor_wins
    total_games = @games.size
    visitor_wins = @games.count { |game| game.away_goals.to_i > game.home_goals.to_i }
    ((visitor_wins.to_f / total_games) * 100).round(2)
  end

  def percentage_ties
    total_games = @games.size
    ties = @games.count { |game| game.home_goals.to_i == game.away_goals.to_i }
    ((ties.to_f / total_games) * 100).round(2)
  end
end