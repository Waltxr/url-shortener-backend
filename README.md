## URL Shortener
Submit a url to receive back a url of the shortest possible length that redirects you to the original url.

Project is live at:

<http://shortenurll.s3-website-us-east-1.amazonaws.com/>

Please note this project is deployed to heroku and there's a 30 second wait time for the server to wake up.

[Demo](https://www.youtube.com/watch?v=xfF5XmhlwII&feature=youtu.be)

## Inspiration

The goal was to make a URL shortener similar to [Bitly](https://bitly.com/). I aimed to demonstrate my understanding of how to create an application with a backend API using Rails and a frontend using React.

## Installation
1. Fork/Clone this repo to your machine
2. `cd` to this project folder
3. In your terminal run `rails db:create` then `rails db:migrate`
4. Run 'rails s' in your terminal and the app is ready to be used with the frontend which you can find here: https://github.com/Waltxr/url-shortener-frontend

## Seeding the Database
1. `cd` to the project root folder
2. run `rails c` in your terminal
3. run `DatabaseSeedBot.run` in your terminal

This uses data from the Non-.gov URLs APi <https://search.gov/developer/govt-urls.html>

## Features

1. You can play the game against a human or computer.
2. The grid size is variable.
3. Win combinations are not hard coded.

## The Code

URL Shortener was made with a rails API backend and React/Redux frontend. Some highlights:

1. A bijective method was made in the url model to map each url ID to a slug using only ASCII characters.

2. A custom validation was made in the backend that uses regex to check if a string is a valid url.

3. There is a bot that was created to populate the database with URLs from a public API.

4. API Routes:
  - api_v1_shortener POST   /api/v1/shortener(.:format)  api/v1/urls#create
  - api_v1 GET              /api/v1/urls/:slug(.:format) api/v1/urls#show
  - api_v1_top_urls GET     /api/v1/top-urls(.:format)   api/v1/urls#index

## Authors
Adam Walter - @Waltxr

## License
MIT Copyright 2018
