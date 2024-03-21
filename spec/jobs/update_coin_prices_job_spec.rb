require 'rails_helper'

RSpec.describe UpdateCoinPricesJob, type: :job do
  describe '#perform' do
    let(:coin_api_service_instance) { instance_double("CoinApiService") }

    before do
      allow(CoinApiService).to receive(:new).and_return(coin_api_service_instance)
      allow(coin_api_service_instance).to receive(:update_prices)
    end

    it 'calls the CoinApiService to update prices' do
      described_class.new.perform
      expect(coin_api_service_instance).to have_received(:update_prices)
    end
  end
end
