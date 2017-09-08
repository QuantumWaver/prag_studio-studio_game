require_relative '../clumsy_player'

module PragStudioGame
  describe ClumsyPlayer do

    before do
      $stdout = StringIO.new
      @initial_health = 150
      @boost_factor = 4
      @player = ClumsyPlayer.new("jeff", @initial_health, @boost_factor)
    end

    it "gets a boost in health when healed" do
      3.times { @player.heal }
      healed_health = @initial_health + ((Player::HEAL_AMT * @boost_factor) * 3)
      expect(@player.health).to eq(healed_health)
    end

    it "all treasure points worth half their value" do
      expect(@player.points).to eq(0)

      bow = Treasure.new(:bow, 150)
      @player.found_treasure(bow)
      @player.found_treasure(bow)
      @player.found_treasure(bow)
      expect(@player.points).to eq(225)

      sword = Treasure.new(:sword, 400)
      @player.found_treasure(sword)
      expect(@player.points).to eq(425)

      yielded = []
      @player.each_found_treasure do |treasure|
        yielded << treasure
      end

      expected_yielded = [
        Treasure.new(:bow, 225),
        Treasure.new(:sword, 200)
      ]

      expect(yielded).to eq(expected_yielded)
    end

  end
end