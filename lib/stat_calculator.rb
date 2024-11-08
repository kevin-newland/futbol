class StatCalculator

  attr_reader :games,
              :teams,
              :game_teams



  def initialize(games, teams, game_teams)
    @games = games
    @teams = teams
    @game_teams = game_teams
  end

    def inspect
    "#<StatCalculator: games_count=#{@games.count}, teams_count=#{@teams.count}>"
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

  # Calculates the winningest coach based on win percentage
  def winningest_coach
    coach_stats = Hash.new { |hash, key| hash[key] = { wins: 0, games: 0 } }

  # Iterate through game_teams data to collect wins and total games per coach
    @game_teams.each do |game_team|
    # Collect wins and total games per coach
      coach = game_team.head_coach
      coach_stats[coach][:games] += 1
      coach_stats[coach][:wins] += 1 if game_team.result == "WIN"
    end

  # Calculate win percentage for each coach and return the coach with the highest percentage
    highest_win_coach = coach_stats.max_by do |coach, stats|
      stats[:wins].to_f / stats[:games]
    end

    highest_win_coach.first # Return the coach name
  end

    def worst_coach
    coach_wins = {}
    coach_games = {}

    # Calculate win percentage for each coach
    @game_teams.each do |game_team|
      coach = game_team.head_coach
      coach_games[coach] ||= 0
      coach_wins[coach] ||= 0

      coach_games[coach] += 1
      coach_wins[coach] += 1 if game_team.result == "WIN"
    end

    coach_win_percentages = coach_wins.map do |coach, wins|
      [coach, (wins.to_f / coach_games[coach])]
    end

    # Find the coach with the lowest win percentage
    coach_win_percentages.min_by { |_, win_percentage| win_percentage }.first
  end
end