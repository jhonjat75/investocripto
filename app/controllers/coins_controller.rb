require 'coin_api_service'

class CoinsController < ApplicationController
  include ActionController::MimeResponds

  # GET /coins
  def index
    coins = Coin.all
    render json: coins
  end

  # GET /coins/download
  def download
    coins = Coin.all
    respond_to do |format|
      format.json { send_data coins.to_json, filename: "coins-#{Date.today}.json", type: 'application/json' }
      format.csv { send_data coins_to_csv(coins), filename: "coins-#{Date.today}.csv" }
      format.pdf do
        pdf_html = ActionController::Base.new.render_to_string(
                    template: 'coins/download.html.erb',
                    layout: 'pdf',
                    locals: { coins: coins }
                  )

        pdf = WickedPdf.new.pdf_from_string(pdf_html)
        send_data pdf, filename: "coinsdata.pdf", type: 'application/pdf', disposition: 'attachment'
      end
    end
  end

  private

  def coins_to_csv(coins)
    CSV.generate(headers: true) do |csv|
      csv << ['ID', 'Name', 'Price', 'Rate', 'Updated At'] # Cambiar según los atributos de Coin
      coins.each do |coin|
        csv << [coin.name, coin.price, coin.rate, coin.updated_at]
      end
    end
  end
end
