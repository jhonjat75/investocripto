class CoinApiService
	include HTTParty
	base_uri 'https://rest.coinapi.io'

	def initialize(api_key)
		@headers = { "X-CoinAPI-Key" => api_key }
	end

	def update_prices
		Coin.all.each do |coin|
			response = get_price(coin.symbol)
			if response.success?
				new_price = response.parsed_response['rate']
				coin.update(price: new_price)
				ActionCable.server.broadcast 'coins_channel', coin.as_json
			else
				Rails.logger.error "Error updating price for #{coin.symbol}: #{response.parsed_response['error']}"
			end
		end
	end

	def get_price(asset_id)
		self.class.get("/v1/exchangerate/#{asset_id}/USD", headers: @headers)
	end
end
