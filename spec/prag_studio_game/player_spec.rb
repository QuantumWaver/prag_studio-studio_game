require 'prag_studio_game/player'

module PragStudioGame
  describe Player do

    before do
      $stdout = StringIO.new
      @initial_health = 150
      @player = Player.new("jeff", @initial_health)
    end

    it "has a capitalized title" do
      expect(@player.name).to eq("Jeff")
    end

    it "has a non-default initial health" do
      expect(@player.health).to eq(150)
    end

    it "has a string representation" do
      time = Time.now.strftime("%-l:%M:%S%p").downcase
      expect(@player.to_s).to eq("I'm #{@player.name} with health = #{@player.health}, " +
                                  "points = #{@player.points}, " +
                                  "score = #{@player.score} as of #{time}")
    end

    it "can be created from a csv string" do
      csv_line = "jon, 2112"
      player = Player.from_csv(csv_line)
      expect(player.name).to eq("Jon")
      expect(player.health).to eq(2112)
    end

    it "computes a score as the sum of its health and points" do
      @player.found_treasure(Treasure.new(:bow, 150))
      @player.found_treasure(Treasure.new(:bow, 150))
      @player.found_treasure(Treasure.new(:sword, 400))
      expect(@player.score).to eq(@player.health + @player.points)
    end

    it "yields each found treasure and its total points" do
      @player.found_treasure(Treasure.new(:skillet, 100))
      @player.found_treasure(Treasure.new(:skillet, 100))
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))

      yielded = []
      @player.each_found_treasure do |treasure|
        yielded << treasure
      end

      expected_yielded = [
        Treasure.new(:skillet, 200),
        Treasure.new(:hammer, 50),
        Treasure.new(:bottle, 25)
      ]

      expect(yielded).to eq(expected_yielded)
    end

    it "increases health by #{Player::HEAL_AMT} when healed" do
      @player.heal
      expect(@player.health).to eq(@initial_health + Player::HEAL_AMT)
    end

    it "decreases health by #{Player::HIT_DAMAGE} when hit" do
      @player.hit
      expect(@player.health).to eq(@initial_health - Player::HIT_DAMAGE)
    end

    it "computes points as the sum of all treasure points" do
      expect(@player.points).to eq(0)

      @player.found_treasure(Treasure.new(:bow, 150))
      expect(@player.points).to eq(150)

      @player.found_treasure(Treasure.new(:sword, 400))
      expect(@player.points).to eq(550)

      @player.found_treasure(Treasure.new(:bow, 150))
      expect(@player.points).to eq(700)
    end

    context "created with a default health" do
      before do
        @player = Player.new("jeff")
      end

      it "has a health of 100" do
        expect(@player.health).to eq(100)
      end
    end

    context "with a health greater than 100" do
      before do
        @player = Player.new("jeff", 150)
      end

      it "is strong" do
        #expect(@player.strong?).to be true
        expect(@player).to be_strong
      end
    end

    context "with a health of 100 or less" do
      before do
        @player = Player.new("jeff", 100)
      end

      it "is weak" do
        #expect(@player.strong?).to be false
        expect(@player).not_to be_strong
      end
    end

    context "in a collection of players" do
      before do
        @player1 = Player.new("moe", 100)
        @player2 = Player.new("larry", 300)
        @player3 = Player.new("curly", 200)

        @players = [@player1, @player2, @player3]
      end

      it "is sorted by increasing score" do
        expect(@players.sort).to eq([@player1, @player3, @player2])
      end
    end

  end
end