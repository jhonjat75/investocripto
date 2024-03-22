class CoinSerializer
  include FinancialCalculations

  def initialize(coins, amount)
    @coins = coins
    @amount = amount.to_f
  end

  def to_csv
    CSV.generate(headers: true) do |csv|
      csv << ["Cryptocurrency", "Price", "Annual Gain", "Total", "Quantity in Crypto", "Amount"]
      @coins.each do |coin|
        coin_data = serialize_coin(coin)
        csv << coin_data.values
      end
    end
  end

  def to_json
    @coins.map { |coin| serialize_coin(coin) }.to_json
  end

  private

  def serialize_coin(coin)
    {
      'Cryptocurrency' => coin.name,
      'Price' => coin.price.round(3),
      'Annual Gain' => calculate_gains(coin.rate, @amount).round(3),
      'Total' => calculate_total(coin.rate, @amount).round(3),
      'Quantity in Crypto' => calculate_crypto_quantity(coin.price, @amount).round(3),
      'Amount' => @amount.round(3)
    }
  end
end
