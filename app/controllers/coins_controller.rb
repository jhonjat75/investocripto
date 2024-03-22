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
    amount = params[:amount].to_i
    coins = Coin.all
    coin_serializer = CoinSerializer.new(coins, amount)
    respond_to do |format|
      format.json { send_data coin_serializer.to_json, filename: "coins-#{Date.today}.json", type: 'application/json' }
      format.csv { send_data coin_serializer.to_csv, filename: "coins-#{Date.today}.csv" }
      format.pdf do
        pdf_html = ActionController::Base.new.render_to_string(
                    template: 'coins/download.html.erb',
                    layout: 'pdf',
                    locals: {
                      coins: coins,
                      amount: amount
                    }
                  )
        pdf = WickedPdf.new.pdf_from_string(pdf_html)
        send_data pdf, filename: "coinsdata.pdf", type: 'application/pdf', disposition: 'attachment'
      end
    end
  end

  private

  def coin_params
    params.require(:coin).permit(:name, :rate, :logo_url, :price, :amount)
  end
end
