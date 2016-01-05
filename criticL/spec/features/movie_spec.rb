require "rails_helper"

feature "User visits website" do
  scenario "sees a list of all movies" do
    visit "/movies"
    expect(page).to have_content "Summary"
  end

  scenario "can see an individual movie's page" do
    movie = Movie.create!(title:"The Dark Knight", release_date: "2002-2-2", summary: "I'm Batman!")
    visit "/movies/#{movie.id}"
    expect(page).to have_content "Title"
  end
end