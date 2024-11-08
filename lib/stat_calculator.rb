class StatCalculator
  attr_reader :games,
              :teams,
              :game_teams


  def initialize(games, teams, game_teams)
    @games = games
    @teams = teams
    @game_teams = game_teams
  end

  def highest_total_score	
    total = 0
    @games.each do |game|
      total_score = game.away_goals.to_i + game.home_goals.to_i
      if total_score > total 
        total = total_score
      end
    end
    total
  end

  def lowest_total_score
    total = 0
    games.each do |game|
        total_score = game.away_goals.to_i + game.home_goals.to_i
        if total_score < total
            total = total_score
        end
    end
    total
  end

  def count_of_teams
    @teams.count
  end

  # Calculates the percentage of games won by the home team
  def percentage_home_wins
    total_games = @games.size
    home_wins = @games.count { |game| game.home_goals.to_i > game.away_goals.to_i }
    ((home_wins.to_f / total_games) * 100).round(2)
  end

  # Calculates the percentage of games won by the visiting team
  def percentage_visitor_wins
    total_games = @games.size
    visitor_wins = @games.count { |game| game.away_goals.to_i > game.home_goals.to_i }
    ((visitor_wins.to_f / total_games) * 100).round(2)
  end

  # Calculates the percentage of games that ended in a tie
  def percentage_ties
    total_games = @games.size
    ties = @games.count { |game| game.home_goals.to_i == game.away_goals.to_i }
    ((ties.to_f / total_games) * 100).round(2)
  end
end