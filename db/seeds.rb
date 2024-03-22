Coin.delete_all
coins_data = [
    {
        symbol: 'BTC',
        name: 'Bitcoin',
        rate: 5,
        logo_url: 'https://cdn-icons-png.flaticon.com/512/1490/1490849.png',
        price: 65000
    },
    {
        symbol: 'ETH',
        name: 'Ether',
        rate: 4.2,
        logo_url: 'https://static-00.iconduck.com/assets.00/ethereum-cryptocurrency-icon-512x512-u1g6py59.png',
        price: 3368.43
    },
    {
        symbol: 'ADA',
        name: 'Cardano',
        rate: 1,
        logo_url: 'https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/cardano_ada-512.png',
        price: 0.63
    }
]

coins_data.each do |coin_data|
    Coin.create!(coin_data)
end