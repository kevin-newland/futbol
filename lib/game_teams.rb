class GameTeams
  @@instances = []

  attr_reader :game_id,
              :team_id,
              :hoa,
              :result,
              :head_coach,
              :goals,
              :shots,
              :tackles

  def initialize(game_id, team_id, hoa, result, head_coach, goals, shots, tackles)
    @game_id = game_id
    @team_id = team_id
    @hoa = hoa
    @result = result
    @head_coach = head_coach
    @goals = goals
    @shots = shots
    @tackles = tackles

    @@instances << self
  end

  def self.all
    @@instances
  end
end