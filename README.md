# InvestoCrypto Backend

## Overview
InvestoCrypto is a dynamic backend service that integrates with a cryptocurrency investment frontend. Built with Ruby on Rails 6, this service offers real-time investment calculations and facilitates the download of investment data in various formats. Leveraging CoinAPI, it updates and pushes the latest cryptocurrency rates to the frontend via WebSockets, ensuring timely and accurate investment simulations.

## Features
- Automated data fetching from CoinAPI, updating every minute.
- WebSocket implementation for real-time frontend updates.
- Supports downloading investment data in CSV, PDF, and JSON formats.
- Real-time investment calculation and forecasting for various cryptocurrencies.

## Technologies
- Ruby on Rails 6+
- MongoDB
- Redis
- Sidekiq for background jobs
- WebSocket for real-time communication

## Getting Started

### Prerequisites
- Ruby on Rails 6+
- MongoDB
- Redis
- Node.js
- Key coinAPI

### Installation
To set up the InvestoCrypto backend locally, follow these steps:

1. Clone the repository:
```sh
   git clone https://github.com/jhonjat75/investocrypto.git
   cd investocrypto
```
2. Install the required gems:
```sh
bundle install
```

3. Create a .env.development file and get environment variables:
```sh
COIN_API_KEY='change_key_coinapi'
```

4. Ensure MongoDB is running on your system.

5. Initialize the database:
```sh
rails db:setup
```

6. Start the Rails server:
```sh
rails server
```

7. Start the Sidekiq job processor to handle background jobs:
```sh
bundle exec sidekiq -C config/schedule.yml
```

### Usage

To use the application, enter your investment amount in the provided fields and submit to see the calculated projected returns.

### API Reference

Cryptocurrency data is sourced in real-time from CoinAPI. Please refer to their documentation for more information on data consistency and availability.

### How to Contribute

Interested in contributing? We welcome pull requests and issues from all developers. Please read our CONTRIBUTING.md file for more details on how to contribute to this project.

### License

This project is licensed under the MIT License - see the LICENSE file for details.

### Acknowledgments

CoinAPI for providing cryptocurrency data.
The Ruby on Rails community for continuous support.
Connect the backend to the frontend by ensuring the VITE_API_URL is pointing to the deployed backend service.

The frontend for this application is hosted at https://github.com/jhonjat75/investocrypto_front, follow the instructions there to set it up.

Remember to set up a job to pull the latest cryptocurrency data using CoinAPI and update it every minute. This involves setting up a CRON job or a scheduled task that will invoke your data fetching function.

Websocket integration is vital for real-time data presentation. Ensure that as data is fetched from the backend, it is also being streamed to the frontend in real-time to display the latest information.

Create a .env.development file in your backend repository with the variable COIN_API_KEY='change_key_coinapi' to integrate with CoinAPI for development.