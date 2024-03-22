class UpdateCoinPricesJob
	include Sidekiq::Job

	def perform
		CoinApiService.new(ENV['COIN_API_KEY']).update_prices
	end
end
