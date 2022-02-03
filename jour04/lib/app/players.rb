class Player
  attr_accessor :name, :games_won, :games_lost, :turns

  def initialize(name)
    @name         = name
    @games_won    = 0
    @games_lost   = 0
    @turns        = 0
  end
end
