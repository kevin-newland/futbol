require 'csv'

class Games 

    attr_reader :game_id, 
                :season, 
                :away_team_id, 
                :home_team_id, 
                :away_goals, 
                :home_goals

    def initialize(game_id,season,away_team_id, home_team_id, away_goals, home_goals)
      @game_id = game_id
      @season = season
      @away_team_id = away_team_id
      @home_team_id = home_team_id
      @away_goals = away_goals
      @home_goals = home_goals
    end

#     def self.load_csv(game_path)
#     #raw_games = #read the csv
#       games = [] #map over and return array of Game objects
#       CSV.foreach(game_path, headers: true, header_converters: :symbol) do |row|
#          #create a new Game
#          games << self.new(row[:game_id].to_i, row[:season].to_i, row[:away_team_id].to_i, row[:home_team_id].to_i, row[:away_goals].to_i, row[:home_goals].to_i)
#       end
#       games
#     end
end
  