require 'rails_helper'

RSpec.describe CoinsController, type: :request do
  describe 'GET /coins' do
    it 'returns all coins' do
      get coins_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /coins/download' do
    it 'downloads the coins data as JSON' do
      get '/coins/download.json'
      expect(response.header['Content-Type']).to include('application/json')
    end

    it 'downloads the coins data as CSV' do
      get '/coins/download.csv'
      expect(response.header['Content-Type']).to include('text/csv')
    end

    it 'downloads the coins data as PDF' do
      get '/coins/download.pdf'
      expect(response.header['Content-Type']).to include('application/pdf')
    end
  end
end
