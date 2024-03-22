require 'rails_helper'

RSpec.describe CoinsChannel, type: :channel do
  before do
    stub_connection
    subscribe
  end

  it 'successfully subscribes' do
    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from('coins_channel')
  end
end

