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

end