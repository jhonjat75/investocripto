FactoryBot.define do
	factory :coin do
		sequence(:name) { |n| "Coin#{n}" } # Esto asegura que cada nombre sea único
		rate 1
		logo_url 'http://example.com/bitcoin.png'
		price 10000
	end
end