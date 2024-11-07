class Teams 
  attr_reader :team_id, 
              :teamName

   @@instances = []

  def initialize(team_id, teamName)
    @team_id = team_id
    @teamName = teamName
  end

  def self.load_csv(file_path)
    CSV.foreach('./spec/fixtures/fixture_teams.csv', headers: true, header_converters: :symbol) do |row|
      team = Teams.new(row[:team_id].to_i, row[:teamname])
      @@instances << team
    end
    @@instances
  end

  def self.all
    @@instances
  end
end