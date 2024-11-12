require_relative 'games'
require_relative 'teams'
require_relative 'game_teams'
require_relative 'stat_calculator'

class StatTracker
  attr_reader :game_path,
              :team_path,
              :game_teams_path,
              :game_teams,
              :teams,
              :games

  def initialize(locations)
    @game_path = locations[:games]
    @team_path = locations[:teams]
    @game_teams_path = locations[:game_teams]
    @game_teams = GameTeams
    @teams = Teams
    @games = Games

    create_databases
    @stat_calculator = create_stat_calculator
  end

  def self.from_csv(locations)
    self.new(locations)
  end

  def create_databases
    @game_teams.from_csv(@game_teams_path)
    @games.load_csv(@game_path)
    @teams.load_csv(@team_path)
  end

  def create_stat_calculator
    StatCalculator.new(@games.all, @teams.all, @game_teams.all)
  end

  def most_accurate_team(season)
    @stat_calculator.most_accurate_team(season)
  end

  def least_accurate_team(season)
    @stat_calculator.least_accurate_team(season)
  end
  
  def average_goals_per_game
    @stat_calculator.average_goals_per_game
  end

  def average_goals_by_season
    @stat_calculator.average_goals_by_season
  end

  def highest_total_score
    @stat_calculator.highest_total_score
  end

  def lowest_total_score
    @stat_calculator.lowest_total_score
  end

  def count_of_teams
    @stat_calculator.count_of_teams
  end

  def percentage_home_wins
    @stat_calculator.percentage_home_wins
  end

  def percentage_visitor_wins
    @stat_calculator.percentage_visitor_wins
  end

  def percentage_ties
    @stat_calculator.percentage_ties
  end

  def winningest_coach(season_id)
    @stat_calculator.winningest_coach(season_id)
  end

  def worst_coach(season_id)
    @stat_calculator.worst_coach(season_id)
  end

  def lowest_scoring_visitor
    @stat_calculator.lowest_scoring_visitor
  end

  def highest_scoring_visitor
    @stat_calculator.highest_scoring_visitor
  end

  def count_of_games_by_season
    @stat_calculator.count_of_games_by_season
  end

  def highest_scoring_home_team
    @stat_calculator.highest_scoring_home_team
  end

  def lowest_scoring_home_team
    @stat_calculator.lowest_scoring_home_team
  end

  def best_offense
    @stat_calculator.best_offense
  end

  def worst_offense
    @stat_calculator.worst_offense
  end

  def most_tackles(season_id)
    @stat_calculator.most_tackles(season_id)
  end

  def fewest_tackles(season_id)
    @stat_calculator.fewest_tackles(season_id)
  end
end