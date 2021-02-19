# Notflix Backend

This is a to-do list and general note-taking application with a calendar that provides a visual indication of the priority levels and summed duration of tasks on a given day.

## Prerequisites

This app is built using a Ruby-on-Rails backend as an API. You will need to have installed Ruby (we used 2.6.3) and Rails (6.0+).

## How to Install

In the terminal run bundle install to make sure that your Gemfile.lock has all of the necessary dependencies. You then will need to seed the database.

There are 17 methods in the ids.rb file that are being imported by seeds.rb. Each method is corrseponding to 100 Netflix show/movie id's that were received from a previous GET request.

1. On line 15 in seeds change the function (currently set to seventeen) to the other methods one at a time (first_hundred, second_hundred, third_hundred ... thousand, eleven, twelve, thirteen... seventeen) and in your console type: ruby db/seeds.rb after each change to seed the database.

2. Do this for all 17 methods until you seed the Netflix shows/movies

3. Open up a console (rails c)

4. Type Netflix.update (this should replace all null values for rating with a 0)

5. Type Netflix.series (this should seed the shows database with all of our shows) MAKE SURE TO DO THIS FIRST

6. Type Netflix.movies (this should seed the movies database with all of our shows)

7. Show.comma and then Movie.comma to fix titles a handful of titles to proper notation.

8. Exit console by typing exit

## How to Use

You must also clone down our front end repo which can be found here: https://github.com/dwisecar/netflix-decider-client

In the backend, run "$rails s" (without quotes or $) to start the server. Then run the front-end server by calling $npm start.

## Contributors

Taylor Bustamante, taylorbustamante16@gmail.com, https://github.com/tbustama

David Wisecarver, dwisecar@gmail.com ,https://github.com/dwisecar

## Acknowledgements

We would like to acknowledge https://rapidapi.com/user/unogs for the use of their API to seed our database with accurate Netflix information.

## License

MIT License, see https://spdx.org/licenses/MIT.html for details
