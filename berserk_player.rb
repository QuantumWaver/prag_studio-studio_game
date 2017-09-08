require_relative 'player'

module PragStudioGame
  class BerserkPlayer < Player

    BERSERK_THRESHOLD = 5

    def initialize( name, health=100 )
      super( name, health )
      @heal_count = 0
    end

    def berserk?
      @heal_count > BERSERK_THRESHOLD
    end

    def heal
      super
      @heal_count += 1
      puts "#{name} is berserk!!" if berserk?
    end

    def hit
      self.berserk? ? heal : super
    end

  end

  # here '__FILE__' holds the name of the file "player.rb",
  # and '$0' holds the name of the currently running Ruby program file
  # so this code will only be executed if you just run the "player.rb" file
  if __FILE__ == $0 # or $PROGRAM_NAME

    berserk = BerserkPlayer.new("berserk")

    (BerserkPlayer::BERSERK_THRESHOLD+1).times { berserk.heal }
    berserk.hit

  end
end