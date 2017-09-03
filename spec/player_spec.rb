require_relative '../player'

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
    expect(@player.to_s).to eq("I'm #{@player.name} with a health of " +
                                "#{@player.health} and a score of " +
                                "#{@player.score} as of #{time}")
  end

  it "computes a score as the sum of its health and length of name" do
    expect(@player.score).to eq(@player.health + @player.name.length)
  end

  it "increases health by 15 when healed" do
    @player.heal
    expect(@player.health).to eq(@initial_health + 15)
  end

  it "decreases health by 10 when hit" do
    @player.hit
    expect(@player.health).to eq(@initial_health - 10)
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

end