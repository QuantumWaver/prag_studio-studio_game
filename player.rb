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

  def strong?
    @health > 100
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


# here '__FILE__' holds the name of the file "player.rb",
# and '$0' holds the name of the currently running Ruby program file
# so this code will only be executed if you just run the "player.rb" file
if __FILE__ == $0 # or $PROGRAM_NAME
  puts "Player Examples:"
  player1 = Player.new( "Larry", 60 )
  player2 = Player.new( "curly", 125 )

  puts player1
  puts player2

  player1.hit
  puts player1
end