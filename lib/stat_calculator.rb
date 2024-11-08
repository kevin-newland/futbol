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
    all_scores = {}

    @games.each do |game|
      if all_scores[game.away_team_id].nil?
        all_scores[game.away_team_id] = [game.away_goals]
      else
        all_scores[game.away_team_id] << game.away_goals
      end
    end
    
    all_average_scores = {}

    all_scores.each do |team_id, scores|
      num_of_scores = scores.count
      sum_of_scores = scores.sum
      average_score = sum_of_scores.to_f / scores.count.to_f

      all_average_scores[team_id] = average_score.round(3)
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