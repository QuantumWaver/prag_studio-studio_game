Treasure = Struct.new(:name, :points)

module TreasureTrove

  TREASURES = [
    Treasure.new(:pie, 5),
    Treasure.new(:bottle, 25),
    Treasure.new(:hammer, 50),
    Treasure.new(:skillet, 100),
    Treasure.new(:broomstick, 200),
    Treasure.new(:sword, 400)
  ]

  def self.print_treasures
    puts "\nThere are #{TREASURES.size} treasures to be found:"
    TREASURES.each { |t| puts "\tA #{t.name} is worth #{t.points} points"}
  end

  def self.random
    TREASURES.sample
  end

end
