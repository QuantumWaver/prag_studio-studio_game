require_relative '../treasure_trove'

describe Treasure do

  before do
    @treasure = Treasure.new(:hammer, 50)
  end

  it "has a name attribute" do
    expect(@treasure.name).to eq(:hammer)
  end

  it "has a points attribute" do
    expect(@treasure.points).to eq(50)
  end

end

describe TreasureTrove do

  before do
    @treasures = TreasureTrove::TREASURES
  end

  it "has six treasures" do
    expect(@treasures.size).to eq(6)
  end

  it "has a pie worth 5 points" do
    expect(TreasureTrove::TREASURES).to include(Treasure.new(:pie, 5))
  end

  it "has a bottle worth 25 points" do
    expect(TreasureTrove::TREASURES).to include(Treasure.new(:bottle, 25))
  end

  it "has a hammer worth 50 points" do
    expect(TreasureTrove::TREASURES).to include(Treasure.new(:hammer, 50))
  end

  it "has a skillet worth 100 points" do
    expect(TreasureTrove::TREASURES).to include(Treasure.new(:skillet, 100))
  end

  it "has a broomstick worth 200 points" do
    expect(TreasureTrove::TREASURES).to include(Treasure.new(:broomstick, 200))
  end

  it "has a sword worth 400 points" do
    expect(TreasureTrove::TREASURES).to include(Treasure.new(:sword, 400))
  end

  it "returns a random treasure" do
    treasure = TreasureTrove.random
    expect(TreasureTrove::TREASURES).to include(treasure)
  end

end