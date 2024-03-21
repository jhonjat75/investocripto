
# InvestoCrypto

## Overview
The InvestoCrypto is a specialized web application designed for investors interested in the cryptocurrency market. It provides a convenient way to simulate investments and forecast returns across different cryptocurrencies including Bitcoin, Ethereum, and Cardano. Built with Ruby on Rails and leveraging real-time data via CoinAPI, this tool offers an invaluable resource for strategizing investment in the crypto space.

## Features
- Real-time investment calculations for various cryptocurrencies.
- Automated projection of potential annual returns.
- Real-time cryptocurrency market data integration.
- Export functionality for investment data in both CSV and JSON.

## Technologies
- Ruby on Rails 6+
- JavaScript
- MongoDB
- CoinAPI for cryptocurrency data

## Getting Started

### Prerequisites
- Ruby (version specified in `.ruby-version`)
- Rails 6+
- MongoDB
- Node.js
- Redis

### Installation

To get started with the application, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/jhonjat75/investocripto.git
    cd investocripto
    ```

2. Install the required gems:
    ```bash
    bundle install
    ```

3. Create file .env.development and get environment variables.

4. Ensure MongoDB is running on your system.

5. Initialize the database:
    ```bash
    rails db:setup
    ```

6. Start the Rails server:
    ```bash
    rails server
    ```

6. Start the Sidekiq server:
    ```bash
    bundle exec sidekiq -C config/schedule.yml
    ```

8. Visit `http://localhost:3000` in your browser to use the application.

## Usage

To use the application, enter your investment amount in the provided fields, select the cryptocurrencies you're interested in, and submit to see the calculated projected returns.

## API Reference

Cryptocurrency data is sourced in real-time from CoinAPI. Please refer to their [documentation](https://docs.coinapi.io/) for more information on data consistency and availability.

## How to Contribute

Interested in contributing? We welcome pull requests and issues from all developers. Please read our `CONTRIBUTING.md` file for more details on how to contribute to this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.

## Acknowledgments

- CoinAPI for providing cryptocurrency data.
- The Ruby on Rails community for continuous support.
