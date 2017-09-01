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
    if new_name.empty?
      raise "Name can't be empty asshole!"
    end
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

players = [player1, player2, player3]

puts "There are #{players.size} in the game:"
players.each do |player|
  puts "\t#{player}"
end

players.pop
players.push(player4)

players.each do |player|
  player.hit
  player.hit
  player.heal
  puts player
end








