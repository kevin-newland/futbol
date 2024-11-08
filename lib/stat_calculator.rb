class StatCalculator
  attr_reader :games,
              :teams,
              :game_teams

  def initialize(games, teams, game_teams)
    @games = games
    @teams = teams
    @game_teams = game_teams
  end
  
  def average_goals_per_game
    away_goals = 0
    home_goals = 0
    total_games = 0

    @games.each do |game|
      away_goals += game.away_goals
      home_goals += game.home_goals
      total_games += 1
    end

    total_goals = away_goals + home_goals

    average_goals = total_goals.to_f/total_games.to_f  #when dividing both need to be a float in order to work
    average_goals.round(2)
  end

  def average_goals_by_season
    season_goals = {}
  
    @games.each do |game|
      season = game.season
      
      season_goals[season] ||= {total_goals: 0, number_games: 0}

      season_goals[season][:total_goals] += game.away_goals + game.home_goals
      season_goals[season][:number_games] += 1
    end

    average_goals_season = {}

    season_goals.each do |season, info|
      average_goals_season[season] = (info[:total_goals].to_f/info[:number_games]).round(2)
    end

    average_goals_season
  end
end

