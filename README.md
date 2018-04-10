# README

# Url Shortener Backend
Rails API with endpoints that allow frontend to shorten urls and keep track of how many times the shortened url is accessed.

<http://shortenurll.s3-website-us-east-1.amazonaws.com/>

# Installation
1. Fork/Clone this repo to your machine
2. `cd` to this project folder
3. In your terminal run `rails db:create` then `rails db:migrate`
4. Run 'rails s' in your terminal and the app is ready to be used with the frontend which you can find here: https://github.com/Waltxr/url-shortener-frontend

# Seeding Database
1. `cd` to the project root folder
2. run `rails c` in your terminal
3. run `DatabaseSeedBot.run` in your terminal
