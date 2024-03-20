class UpdateCoinPricesJob < ApplicationJob
	include Sidekiq::Worker

	def perform
		CoinApiService.new(ENV['COIN_API_KEY']).update_prices
	end
end
