# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'
require 'open-uri'
require 'nokogiri'

# movie = JSON.parse('{"Title":"The Martian","Year":"2015","Rated":"PG-13","Released":"02 Oct 2015","Runtime":"144 min","Genre":"Adventure, Drama, Sci-Fi","Director":"Ridley Scott","Writer":"Drew Goddard (screenplay), Andy Weir (book)","Actors":"Matt Damon, Jessica Chastain, Kristen Wiig, Jeff Daniels","Plot":"During a manned mission to Mars, Astronaut Mark Watney is presumed dead after a fierce storm and left behind by his crew. But Watney has survived and finds himself stranded and alone on the hostile planet. With only meager supplies, he must draw upon his ingenuity, wit and spirit to subsist and find a way to signal to Earth that he is alive.","Language":"English, Mandarin","Country":"USA, UK","Awards":"Nominated for 3 Golden Globes. Another 8 wins & 14 nominations.","Poster":"http://ia.media-imdb.com/images/M/MV5BMTc2MTQ3MDA1Nl5BMl5BanBnXkFtZTgwODA3OTI4NjE@._V1_SX300.jpg","Metascore":"80","imdbRating":"8.2","imdbVotes":"187,881","imdbID":"tt3659388","Type":"movie","Response":"True"}')

# created_movie = Movie.create(title: movie["Title"], release_date: movie["Released"], runtime: movie["Runtime"], director: movie["Director"], cast: movie["Actors"], poster_url: movie["Poster"], summary: movie["Plot"])
# puts "wget #{created_movie['poster_url']}"
# # puts command
# # exec("cd public/images/")
# # exec("pwd >&2")
# # exec("#{command}")

# created_movie.genres << adventure << scifi

# movie = JSON.parse('{"Title":"Zoolander","Year":"2001","Rated":"PG-13","Released":"28 Sep 2001","Runtime":"89 min","Genre":"Comedy","Director":"Ben Stiller","Writer":"Drake Sather (character Derek Zoolander), Ben Stiller (character Derek Zoolander), Drake Sather (story), Ben Stiller (story), Drake Sather (screenplay), Ben Stiller (screenplay), John Hamburg (screenplay)","Actors":"Ben Stiller, Owen Wilson, Christine Taylor, Will Ferrell","Plot":"At the end of his career, a clueless fashion model is brainwashed to kill the Prime Minister of Malaysia.","Language":"English","Country":"Germany, USA","Awards":"1 win & 9 nominations.","Poster":"http://ia.media-imdb.com/images/M/MV5BODI4NDY2NDM5M15BMl5BanBnXkFtZTgwNzEwOTMxMDE@._V1_SX300.jpg","Metascore":"61","imdbRating":"6.6","imdbVotes":"181,597","imdbID":"tt0196229","Type":"movie","Response":"True"}')

# created_movie = Movie.create(title: movie["Title"], release_date: movie["Released"], runtime: movie["Runtime"], director: movie["Director"], cast: movie["Actors"], poster_url: movie["Poster"], summary: movie["Plot"])

# puts "wget #{created_movie['poster_url']}"

# created_movie.genres << comedy

# movie = JSON.parse('{"Title":"The Hangover","Year":"2009","Rated":"R","Released":"05 Jun 2009","Runtime":"100 min","Genre":"Comedy","Director":"Todd Phillips","Writer":"Jon Lucas, Scott Moore","Actors":"Bradley Cooper, Ed Helms, Zach Galifianakis, Justin Bartha","Plot":"Three buddies wake up from a bachelor party in Las Vegas, with no memory of the previous night and the bachelor missing. They make their way around the city in order to find their friend before his wedding.","Language":"English","Country":"USA, Germany","Awards":"Won 1 Golden Globe. Another 9 wins & 26 nominations.","Poster":"http://ia.media-imdb.com/images/M/MV5BMTU1MDA1MTYwMF5BMl5BanBnXkFtZTcwMDcxMzA1Mg@@._V1_SX300.jpg","Metascore":"73","imdbRating":"7.8","imdbVotes":"550,216","imdbID":"tt1119646","Type":"movie","Response":"True"}')

# created_movie = Movie.create(title: movie["Title"], release_date: movie["Released"], runtime: movie["Runtime"], director: movie["Director"], cast: movie["Actors"], poster_url: movie["Poster"], summary: movie["Plot"])

# puts "wget #{created_movie['poster_url']}"

# created_movie.genres << comedy

# movie = JSON.parse('{"Title":"It Follows","Year":"2014","Rated":"R","Released":"27 Mar 2015","Runtime":"100 min","Genre":"Horror, Mystery, Thriller","Director":"David Robert Mitchell","Writer":"David Robert Mitchell","Actors":"Bailey Spry, Carollette Phillips, Loren Bass, Keir Gilchrist","Plot":"A young woman is followed by an unknown supernatural force after getting involved in a sexual encounter.","Language":"English","Country":"USA","Awards":"11 wins & 8 nominations.","Poster":"http://ia.media-imdb.com/images/M/MV5BMTUwMDEzNDI1MF5BMl5BanBnXkFtZTgwNzAyODU5MzE@._V1_SX300.jpg","Metascore":"83","imdbRating":"6.9","imdbVotes":"84,886","imdbID":"tt3235888","Type":"movie","Response":"True"}')

# created_movie = Movie.create(title: movie["Title"], release_date: movie["Released"], runtime: movie["Runtime"], director: movie["Director"], cast: movie["Actors"], poster_url: movie["Poster"], summary: movie["Plot"])

# puts "wget #{created_movie['poster_url']}"

# created_movie.genres << horror

# movie = JSON.parse('{"Title":"Mad Max: Fury Road","Year":"2015","Rated":"R","Released":"15 May 2015","Runtime":"120 min","Genre":"Action, Adventure, Sci-Fi","Director":"George Miller","Writer":"George Miller, Brendan McCarthy, Nick Lathouris","Actors":"Tom Hardy, Charlize Theron, Nicholas Hoult, Hugh Keays-Byrne","Plot":"A woman rebels against a tyrannical ruler in post apocalyptic Australia in search for her homeland with the help of a group of female prisoners, a psychotic worshiper, and a drifter named Max.","Language":"English, Russian","Country":"Australia, USA","Awards":"Nominated for 2 Golden Globes. Another 16 wins & 23 nominations.","Poster":"http://ia.media-imdb.com/images/M/MV5BMTUyMTE0ODcxNF5BMl5BanBnXkFtZTgwODE4NDQzNTE@._V1_SX300.jpg","Metascore":"89","imdbRating":"8.2","imdbVotes":"388,606","imdbID":"tt1392190","Type":"movie","Response":"True"}')

# created_movie = Movie.create(title: movie["Title"], release_date: movie["Released"], runtime: movie["Runtime"], director: movie["Director"], cast: movie["Actors"], poster_url: movie["Poster"], summary: movie["Plot"])

# puts "wget #{created_movie['poster_url']}"

# created_movie.genres << action

### Code to parse page with NokoGiri

action = Genre.create(name: "Action")
adventure = Genre.create(name: "Adventure")
animation = Genre.create(name: "Animation")
comedy = Genre.create(name: "Comedy")
crime = Genre.create(name: "Crime")
documentary = Genre.create(name: "Documentary")
drama = Genre.create(name: "Drama")
family = Genre.create(name: "Family")
fantasy = Genre.create(name: "Fantasy")
foreign = Genre.create(name: "Foreign")
history = Genre.create(name: "History")
horror = Genre.create(name: "Horror")
music = Genre.create(name: "Music")
mystery = Genre.create(name: "Mystery")
romance = Genre.create(name: "Romance")
science_fiction = Genre.create(name: "Science Fiction")
tv_movie = Genre.create(name: "TV Movie")
thriller = Genre.create(name: "Thriller")
war = Genre.create(name: "War")
western = Genre.create(name: "Western")

movie_hash = {"Action"=>action, "Adventure"=>adventure, "Animation"=>animation, "Comedy"=>comedy, "Crime"=>crime, "Documentary"=>documentary, "Drama"=>drama, "Family"=>family, "Fantasy"=>fantasy, "Foreign"=>foreign, "History"=>history, "Horror"=>horror, "Music"=>music, "Mystery"=>mystery, "Romance"=>romance, "Science Fiction"=>science_fiction, "TV Movie"=>tv_movie, "Thriller"=>thriller, "War"=>war, "Western"=>western}
# Genre list
# Action, Adventure, Animation, Comedy, Crime, Documentary, Drama, Family
# Fantasy, Foreign, History, Horror, Music, Mystery, Romance, Science Fiction
# TV Movie, Thriller, War, Western

(1..2).each do |page_num|
  movie_page_doc =  Nokogiri::HTML(open("https://www.themoviedb.org/discover/movie?page=#{page_num}&sort_by=popularity.desc&media_type=movie"))
  movie_titles = movie_page_doc.css(".title")
  movie_summaries = movie_page_doc.css(".overview")
  movie_poster_array = []
  movie_poster_urls = movie_page_doc.css(".result .poster")
  movie_poster_urls.each do |movie_poster|
    movie_poster_array << movie_poster.attribute("srcset").to_s.split(",")[0][0..-4]
  end
  # release_dates = movie_page_doc.css(".release_date")
  movie_titles.each_with_index do |movie_title, index|
    Movie.create(title: movie_title.text(), poster_url: movie_poster_array[index], summary: movie_summaries[index].text())
  end
end
