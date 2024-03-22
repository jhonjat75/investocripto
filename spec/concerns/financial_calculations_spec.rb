require 'rails_helper'

RSpec.describe FinancialCalculations, type: :model do
  include FinancialCalculations

  describe '#calculate_gains' do
    it 'calculates the annual gains based on rate and amount' do
      rate = 5.0
      amount = 1000.0
      expected_gains = ((amount * (1 + (rate / 100.0))**12) - amount).round(3)
      expect(calculate_gains(rate, amount)).to eq(expected_gains)
    end
  end

  describe '#calculate_total' do
    it 'calculates the total based on rate and amount' do
      rate = 5.0
      amount = 1000.0
      expected_total = (amount + calculate_gains(rate, amount)).round(3)
      expect(calculate_total(rate, amount)).to eq(expected_total)
    end
  end

  describe '#calculate_crypto_quantity' do
    it 'calculates the quantity of cryptocurrency that can be bought with a certain amount' do
      price = 500.0
      amount = 1000.0
      expected_quantity = (amount / price).round(3)
      expect(calculate_crypto_quantity(price, amount)).to eq(expected_quantity)
    end
  end
end
