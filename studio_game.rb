puts "Welcome to THE GAME OF THRONES!"
puts "Game Started on #{Time.now.strftime("%A %m/%d/%Y at %-l:%M%p")}"


class Player
  def initialize( name, health=100)
    @name = name.capitalize
    @health = health
  end

  def time
    Time.now.strftime("%-l:%M:%S%p").downcase
  end

  def hit
    @health -= 10
    puts "#{@name} got hit!"
  end

  def heal
    @health += 15
    puts "#{@name} got healed!"
  end

  def to_s
    "I'm #{@name} with a health of #{@health} as of #{time}"
  end
end

player1 = Player.new( "Larry", 60 )
player2 = Player.new( "curly", 125 )
player3 = Player.new( "moe", 100 )
player4 = Player.new( "shemp", 90 )

puts player1
puts player2
puts player3
puts player4

player1.hit
puts player1
player1.heal
puts player1

