class Coin
  include Mongoid::Document
  include Mongoid::Timestamps

  field :_id, as: :symbol, type: String, default: ->{ symbol.to_s.parameterize }
  field :name, type: String
  field :rate, type: Float
  field :logo_url, type: String
  field :price, type: Float
end
