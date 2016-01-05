require "rails_helper"

feature "User visits website" do
  scenario "sees a list of all movies" do
    visit "/movies"
    expect(page).to have_content "Runtime"
  end
end