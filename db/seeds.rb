# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require_relative 'ids.rb'
require 'pry'
require_relative '../config/environment.rb'

thousand.each{|id| 
    url = URI("https://unogsng.p.rapidapi.com/title?netflixid=#{id}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = '9d8a0c55b3mshc60f8adbb6b3a44p1bc412jsn08b48d5b42a8'
    request["x-rapidapi-host"] = 'unogsng.p.rapidapi.com'

    response = http.request(request)
    results =  JSON.parse(response.body)['results'][0]
    if !results['imdbgenre'] 
        results['imdbgenre'] = ''
    end

    new_movie = Netflix.create(title: results['title'], synopsis: results['synopsis'], vtype: results['vtype'], image: results['img'], year: results['year'], genre: results['imdbgenre'].split(', ')[0], rating: results['imdbrating'], imdbrated: results['imdbrated'])
    
}


# url = URI("https://unogsng.p.rapidapi.com/title?netflixid=#{id}")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-key"] = '9d8a0c55b3mshc60f8adbb6b3a44p1bc412jsn08b48d5b42a8'
# request["x-rapidapi-host"] = 'unogsng.p.rapidapi.com'

# response = http.request(request)
# results =  JSON.parse(response.body)['results'][0]


# new_movie = Netflix.new(title: results['title'], synopsis: results['synopsis'], vtype: results['vtype'], image: results['img'], year: results['year'], genre: results['imdbgenre'], rating: results['imdbrating'], imdbrated: results['imdbrated'])

# pry

# {
#     "results": [
#         {
#             "netflixid": 80996601,
#             "title": "Love Is Blind",
#             "matlabel": "Recommended for ages 16 and up",
#             "matlevel": null,
#             "avgrating": 0.0,
#             "predrating": null,
#             "synopsis": "Nick and Vanessa Lachey host this social experiment where single men and women look for love and get engaged, all before meeting in person.",
#             "vtype": "series",
#             "img": "https://occ-0-2851-38.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABZnmK9K7pnw5Q7rRW4W5CwfR_w2JR_bcxEkv37qg9dnvSxcUG_b5qFB5QmFzaz_nreVVPNf7cWefGNBjOG8cH8V6T5-6oPq4iYIeiNuu5VGNj_XSaRi9sBqSjBc.jpg?r=d1d",
#             "lgimg": null,
#             "nfid": 80996601,
#             "nfdate": "2020-02-13",
#             "curdate": "2021-02-11",
#             "year": 2020,
#             "imdbposter": "https://m.media-amazon.com/images/M/MV5BZGI2MTFiYjUtMjFhMS00ODY5LWJlNGEtZWIyNzNmNWU1NjU2XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg",
#             "imdbgenre": "Reality-TV",
#             "imdbrated": "TV-MA",
#             "imdbruntime": "N/A",
#             "imdbawards": "Nominated for 2 Primetime Emmys. Another 1 nomination.",
#             "imdbcountry": "USA",
#             "imdblanguage": "English",
#             "imdbrating": 6.0,
#             "imdbid": "tt11704040",
#             "imdbplot": "Singles who want to be loved for who they are, rather than what they look like, have signed up for a less conventional approach to modern dating.",
#             "imdbmetascore": "N/A",
#             "imdbvotes": 4567,
#             "netflixruntime": 0,
#             "imdblocalimage": null
#         }
#     ],
#     "elapse": 0.1815
# }