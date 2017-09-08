require_relative 'auditable'

module PragStudioGame
  class Die
    include Auditable

    attr_reader :number

    def initialize( range )
      @range = range
      roll(false)
    end

    def roll(allow_audit=true)
      @number = rand(@range)
      audit if allow_audit
      @number
    end
  end
end

# here '__FILE__' holds the name of the file "die.rb",
# and '$0' holds the name of the currently running Ruby program file
# so this code will only be executed if you just run the "die.rb" file
if __FILE__ == $0 # or $PROGRAM_NAME
  dice = PragStudioGame::Die.new(1..8)

  1.upto(10) do
    puts dice.roll
  end
end
