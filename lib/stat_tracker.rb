class StatTracker
  attr_reader :game_path,
              :team_path,
              :game_teams_path

  def initialize(locations)
    @game_path = locations[:games]
    @team_path = locations[:teams]
    @game_teams_path = locations[:game_teams]
  end
end