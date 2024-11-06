class StatTracker
  attr_reader :game_path,
              :team_path,
              :game_teams_path

  def initialize(locations)
    @game_path = locations[:games]
    @team_path = locations[:teams]
    @game_teams_path = locations[:game_teams]
  end

  def self.from_csv(locations)
    self.new(locations)
  end
end



# We can store a class in another using require_relative 'class_file'
# then we can store it in an attribute like so:
# @attribute_name = ClassName

#this allows us access to the other classes class methods, which in turn allows us to create wrapper methods