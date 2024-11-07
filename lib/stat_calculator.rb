# lib/stat_calculator.rb
class StatCalculator
  def percentage_home_wins(games)
    total_games = games.size
    home_wins = games.count { |game| game[:home_goals].to_i > game[:away_goals].to_i }
    ((home_wins.to_f / total_games) * 100).round(2)
  end

  def percentage_visitor_wins(games)
    total_games = games.size
    visitor_wins = games.count { |game| game[:away_goals].to_i > game[:home_goals].to_i }
    ((visitor_wins.to_f / total_games) * 100).round(2)
  end
end