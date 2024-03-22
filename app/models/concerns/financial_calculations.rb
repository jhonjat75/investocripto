module FinancialCalculations
  extend ActiveSupport::Concern

  def calculate_gains(rate, amount)
    monthly_rate = rate / 100.0
    (amount * (1 + monthly_rate)**12 - amount).round(3)
  end

  def calculate_total(rate, amount)
    (amount + calculate_gains(rate, amount)).round(3)
  end

  def calculate_crypto_quantity(price, amount)
    (amount / price).round(3)
  end
end
