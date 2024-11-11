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

  def most_accurate_team(season)
  end

  def least_accurate_team(season)
  end

  def game_ids_in_season(season)
    #filter games to get games for the specified season
    game_ids = []
    games.each do |game|
      if game.season == season
        game_ids << game.game_id
      end
    end
    game_ids
  end

  def game_teams_in_season(season)
    #extract game IDs from filtered games
    game_ids = game_ids_in_season(season) #game ids from season
    season_game_teams = []
    @game_teams.each do |game_team|
      #include game_team data only if its game_id is part of the season
      if game_ids.include?(game_team.game_id) 
        season_game_teams << game_team
      end
    end
    season_game_teams 
  end

  def teams_shot_ratios_by_season(season)
    #accumulate total shots and goals for each game in that season
    game_teams = game_teams_in_season(season)
    stats = {}
    game_teams.each do |game_team|
      team_id = game_team.team_id
      ratio = 0 
      #calculate accuracy ratio (goals/shots)
      if game_team.shots != 0
        ratio = game_team.goals.to_f / game_team.shots.to_f
      end
      if stats[team_id].nil? 
        stats[team_id] = []
      end
      stats[team_id] << ratio
    end
    averages = {}
    stats.each do |team_id, ratios|
      average = 0 
      if ratios.length != 0
        average = ratios.sum.to_f / ratios.length
      end
      averages[team_id] = average
    end
    averages
  end



end