require 'rails_helper'

RSpec.describe Coin, type: :model do

  let(:valid_attributes) { { name: "Bitcoin", rate: 1.0, logo_url: "http://example.com/bitcoin.png", price: 10000.0 } }

  it "is valid with valid attributes" do
    coin = Coin.new(valid_attributes)
    expect(coin).to be_valid
  end

  it "is not valid without a name" do
    coin = Coin.new(valid_attributes.except(:name))
    expect(coin).not_to be_valid
  end

  it "is not valid without a rate" do
    coin = Coin.new(valid_attributes.except(:rate))
    expect(coin).not_to be_valid
  end

  it "is not valid without a logo_url" do
    coin = Coin.new(valid_attributes.except(:logo_url))
    expect(coin).not_to be_valid
  end

  it "is not valid without a price" do
    coin = Coin.new(valid_attributes.except(:price))
    expect(coin).not_to be_valid
  end
end
