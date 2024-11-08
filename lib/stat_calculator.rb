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
end