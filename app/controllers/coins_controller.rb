require 'coin_api_service'

class CoinsController < ApplicationController
  before_action :set_coin, only: [:show, :update, :destroy]

  # GET /coins
  def index
    coins = Coin.all

    # render json: @coins
    # coin_api_service = CoinApiService.new('9979E106-3146-4B03-AA09-EC3ED6ADE4B5')

    # # Obtén los precios para cada moneda
    # bitcoin_data = coin_api_service.get_price('BTC')
    # ether_data = coin_api_service.get_price('ETH')
    # cardano_data = coin_api_service.get_price('ADA')

    # # Formatea la respuesta
    # coins = [
    #   format_coin_data('Bitcoin', bitcoin_data),
    #   format_coin_data('Ether', ether_data),
    #   format_coin_data('Cardano', cardano_data)
    # ]

    render json: coins
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
end
