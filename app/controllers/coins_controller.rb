require 'coin_api_service'

class CoinsController < ApplicationController
  include ActionController::MimeResponds
  before_action :set_coin, only: [:show, :update, :destroy]

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

  # GET /coins/1
  def show
    render json: @coin
  end

  # POST /coins
  def create
    @coin = Coin.new(coin_params)

    if @coin.save
      render json: @coin, status: :created, location: @coin
    else
      render json: @coin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coins/1
  def update
    if @coin.update(coin_params)
      render json: @coin
    else
      render json: @coin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coins/1
  def destroy
    @coin.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_coin
    @coin = Coin.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def coin_params
    params.require(:coin).permit(:name, :rate, :logo_url, :price)
  end


  def coins_to_csv(coins)
    CSV.generate(headers: true) do |csv|
      csv << ['ID', 'Name', 'Price', 'Rate', 'Updated At'] # Cambiar según los atributos de Coin
      coins.each do |coin|
        csv << [coin.name, coin.price, coin.rate, coin.updated_at]
      end
    end
  end
end
