require_relative 'treasure_trove'
require_relative 'playable'

class Player
  include Comparable
  include Playable

  attr_reader :health
  attr_accessor :name

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

  # Used in the Comparable module
  def <=>(other)
    self.score <=> other.score
  end

  def print_name_and_health
    puts "#{name} (#{health})"
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, score = #{score} as of #{time}"
  end

  private
  # ONLY needed in the Playable module, so no need to
  # expose it outside the object
  def health= (new_health)
    @health = new_health
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

  puts player1 < player2
  puts player1 > player2
  puts player1 == player2
  puts player3 == player2

  puts Player::HIT_DAMAGE
  puts Playable::HIT_DAMAGE

end