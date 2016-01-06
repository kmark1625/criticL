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

(1..4).each do |page_num|
  movie_page_doc =  Nokogiri::HTML(open("https://www.themoviedb.org/discover/movie?page=#{page_num}&sort_by=popularity.desc&media_type=movie"))
  movie_titles = movie_page_doc.css(".title")
  movie_summaries = movie_page_doc.css(".overview")
  movie_poster_array = []
  movie_poster_urls = movie_page_doc.css(".result .poster")
  movie_poster_urls.each do |movie_poster|
    movie_poster_array << movie_poster.attribute("srcset").to_s.split(",")[0][0..-4]
  end
  movie_genre_array = []
  movie_genres = movie_page_doc.css(".genres")
  movie_genres.each do |movie_genre|
    # p movie_genre.text().split(", ")
    movie_genre_array << movie_genre.text.split(", ")
  end

  movie_titles.each_with_index do |movie_title, index|
    Movie.create(title: movie_title.text(), poster_url: movie_poster_array[index], summary: movie_summaries[index].text())
  end

  movie_genre_array.each_with_index do |movie_genres, index|
    if movie_genres.length > 0
      movie_genres.each do |genre|
        movie_hash["#{genre}"].movies << Movie.find_by(title: movie_titles[index].text())
      end
    end
  end
end

# Seed users
kevin = User.create(username: "kmark", email: "kmark@gmail.com", password: "hello")
max = User.create(username: "max", email: "max@gmail.com", password: "hello")
lauren = User.create(username: "lauren", email: "lauren@gmail.com", password: "hello")
noah = User.create(username: "noah", email: "noah@gmail.com", password: "hello")

review = kevin.reviews.create(movie_id: 1, rating: 10, content: "I fell in love when watching this movie.", title: "This movie rocked my world")
100.times do
  review.votes.create(value: 1)
end
review = kevin.reviews.create(movie_id: 2, rating: 1, content: "This was the first movie I ever saw.  I went on this date with someone and it was also the last date I ever went on. I blame it on the movie.", title: "AVOID AT ALL COSTS")
review = noah.reviews.create(movie_id: 3, rating: 5, content: "This was an okay movie", title: "Meh")
30.times do
  review.votes.create(value: 1)
end
review = max.reviews.create(movie_id: 4, rating: 10, content: "BOOM!", title: "Woah this was an amazing movie")
10.times do
  review.votes.create(value: 1)
end
