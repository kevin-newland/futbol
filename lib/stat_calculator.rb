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
    @games.each do |game|
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

  def lowest_scoring_visitor
    all_scores = Hash.new { |hash, key| hash[key] = [] }

    @games.each do |game|
      all_scores[game.away_team_id] << game.away_goals
    end
    
    #transform_values allows you to create a new hash using the same keys
    #useful for when you want to do math on values without altering the hash structure
    all_average_scores = all_scores.transform_values do |scores|
      (scores.sum.to_f / scores.size).round(3)
    end
    
    lowest_score = all_average_scores.min_by do |team_id, score|
      score
    end
    
    lowest_team_id = lowest_score[0].to_i
    
    team = @teams.find do |team|
      team.team_id == lowest_team_id
    end

    team.team_name
  end

  def highest_scoring_visitor
    all_scores = Hash.new { |hash, key| hash[key] = [] }

    @games.each do |game|
      all_scores[game.away_team_id] << game.away_goals
    end
    
    all_average_scores = all_scores.transform_values do |scores|
      (scores.sum.to_f / scores.size).round(3)
    end
    
    highest_score = all_average_scores.max_by do |team_id, score|
      score
    end
    
    highest_team_id = highest_score[0].to_i
    
    team = @teams.find do |team|
      team.team_id == highest_team_id
    end

    team.team_name
  end
  
  def count_of_games_by_season
    season_games = {}
    @games.each do |game|
      season_name = game.season
      if season_games[game.season].nil?
        season_games[game.season] = 1
      else
        season_games[game.season] += 1
      end
    end
    season_games
  end

  def highest_scoring_home_team
    all_scores = Hash.new { |hash, key| hash[key] = [] }

    @games.each do |game|
      all_scores[game.home_team_id] << game.home_goals
    end
    
    all_average_scores = all_scores.transform_values do |scores|
      (scores.sum.to_f / scores.size).round(3)
    end
    
    highest_score = all_average_scores.max_by do |team_id, score|
      score
    end
    
    highest_team_id = highest_score[0].to_i
    
    team = @teams.find do |team|
      team.team_id == highest_team_id
    end

    team.team_name
  end

  def lowest_scoring_home_team
    all_scores = Hash.new { |hash, key| hash[key] = [] }

    @games.each do |game|
      all_scores[game.home_team_id] << game.home_goals
    end
    
    all_average_scores = all_scores.transform_values do |scores|
      (scores.sum.to_f / scores.size).round(3)
    end
    
    lowest_score = all_average_scores.min_by do |team_id, score|
      score
    end
    
    lowest_team_id = lowest_score[0].to_i
    
    team = @teams.find do |team|
      team.team_id == lowest_team_id
    end

    team.team_name
  end
end