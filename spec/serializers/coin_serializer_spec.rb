require 'rails_helper'

RSpec.describe CoinSerializer do
  describe 'to_csv' do
    it 'serializes the coin data to CSV format' do
      coins = [Coin.new(name: 'Bitcoin', price: 50000, rate: 5)]
      serializer = CoinSerializer.new(coins, 1000)
      csv = serializer.to_csv

      expected_csv = "Cryptocurrency,Price,Annual Gain,Total,Quantity in Crypto,Amount\nBitcoin,50000.0,795.856,1795.856,0.02,1000.0\n"
      expect(csv).to eq(expected_csv)
    end
  end

  describe 'to_json' do
    it 'serializes the coin data to JSON format' do
      coins = [Coin.new(name: 'Bitcoin', price: 50000, rate: 5)]
      serializer = CoinSerializer.new(coins, 1000)
      json = serializer.to_json

      expected_json = [
        {
          'Cryptocurrency' => 'Bitcoin',
          'Price' => 50000.0.round(3),
          'Annual Gain' => 795.856.round(3),
          'Total' => 1795.856.round(3),
          'Quantity in Crypto' => 0.02.round(3),
          'Amount' => 1000.0.round(3)
        }
      ].to_json
      expect(json).to eq(expected_json)
    end
  end
end
