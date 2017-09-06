require_relative 'treasure_trove'

class Player
  attr_reader :health
  attr_accessor :name

  HIT_DAMAGE = 10
  HEAL_AMT = 15

  def initialize( name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def self.from_csv( line )
    name, init_health = line.chomp.split(',')
    Player.new(name, Integer(init_health))
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
    self.health + points
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{self.name} found a #{treasure.name} worth #{treasure.points}!"
    puts "#{self.name}'s treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce( 0, :+ )
  end

  def each_found_treasure
    if block_given?
      @found_treasures.each do |tname, tpoints|
        yield Treasure.new(tname, tpoints)
      end
    else
      raise "No block given for each_found_treasure method!!"
    end
  end

  def strong?
    @health > 100
  end

  def hit
    @health -= HIT_DAMAGE
    puts "#{@name} got hit!"
  end

  def heal
    @health += HEAL_AMT
    puts "#{@name} got healed!"
  end

  def <=>(other)
    other.score <=> score
  end

  def print_name_and_health
    puts "#{name} (#{health})"
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, score = #{score} as of #{time}"
  end
end


# here '__FILE__' holds the name of the file "player.rb",
# and '$0' holds the name of the currently running Ruby program file
# so this code will only be executed if you just run the "player.rb" file
if __FILE__ == $0 # or $PROGRAM_NAME
  puts "Player Examples:"
  player1 = Player.new( "neil", 60 )
  player2 = Player.new( "geddy", 125 )
  player3 = Player.new( "alex", 125 )

  puts player1
  puts player2

  player1.hit
  puts player1

end