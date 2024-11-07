# lib/stat_calculator.rb

class StatCalculator
  attr_reader :games,
              :teams,
              :game_teams
  
def initialize(games, teams, game_teams)
  @games = games
  @teams = teams
  @game_teams = game_teams
end
  # Additional methods for calculations will go here


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
end