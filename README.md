# What to watch 🍿
### This gem is going to consume the API from this website https://imdb-api.com

## Requirements

-  You can write the title of a movie and the gem must give you 5 recomentations based on the genere of the movie you just entered
- You can write the title of a TV series and the gem must give you 5 recomendations based on the genere of the series you just entered
- You can write "WhatsOnTheaters" and the gem must give you what is on movie theaters 
- You can write "trailer #{nameOfTheMovie}" and the gem must give you the link to the movie trailer
- You can write "comingSoon?" and the gem must give you the movies that are about to be released
- All this Ruby program must be a gem

## Usage

Import the gem

    $ require 'what_to_watch_today'

Create a object from the WhatToWatch Class with your API KEY, to generate in [IMDb-API](https://imdb-api.com/Identity/Account/Register) 

    $ object = WhatToWatch.new('your_api_key')
 
Call the method start to display the recommender

    $ object.start