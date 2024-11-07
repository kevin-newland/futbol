class Teams 
  attr_reader :team_id, 
              :teamName


  def initialize(team_id, teamName)
    @team_id = team_id
    @teamName = teamName
  end

  def self.load_csv(file_path)
    teams = []
    CSV.foreach('./spec/fixtures/fixture_teams.csv', headers: true, header_converters: :symbol) do |row|
      team = Teams.new(row[:team_id].to_i, row[:teamName].to_s)
      teams << team
    end
    teams
  end
end