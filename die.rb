class Die
  attr_reader :number

  def initialize( range )
    @range = range
    roll
  end

  def roll
    @number = rand(@range)
  end
end

# here '__FILE__' holds the name of the file "die.rb",
# and '$0' holds the name of the currently running Ruby program file
# so this code will only be executed if you just run the "die.rb" file
if __FILE__ == $0 # or $PROGRAM_NAME
  dice = Die.new(1..8)

  i = 0
  until i == 10
    puts dice.roll
    i += 1
  end
end