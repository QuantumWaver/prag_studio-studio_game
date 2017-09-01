puts "Welcome to THE GAME OF THRONES!"
puts "Game Started on #{Time.now.strftime("%A %m/%d/%Y at %-l:%M%p")}"


class Player
  attr_reader :health
  attr_accessor :name

  def initialize( name, health=100)
    @name = name.capitalize
    @health = health
  end

  def name=( new_name )
    @name = new_name.capitalize
  end

  def time
    Time.now.strftime("%-l:%M:%S%p").downcase
  end

  def score
    @health + @name.length
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
    "I'm #{@name} with a health of #{@health} and a score of #{score} as of #{time}"
  end
end


player1 = Player.new( "Larry", 60 )
player2 = Player.new( "curly", 125 )
player3 = Player.new( "moe", 100 )
player4 = Player.new( "shemp", 90 )

puts
puts player1
puts player2
puts player3
puts player4

puts
player1.hit
puts player1
player1.heal
puts player1

puts
player1.name = "keViN"
puts player1

