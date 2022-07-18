require 'rails_helper'

RSpec.describe 'recipe index page'  do

  it 'displays a list of recipes with attributes' do
    spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
    possum_chili = Recipe.create!(name: "Possum Chili", complexity: 3, genre: "Cajun")
    deep_fried_twinkie = Recipe.create!(name: "Deep Fried Twinks", complexity: 4, genre: "Dessert")

    visit '/recipes'

    within "#recipes-#{spaghetti.id}" do
      expect(page).to have_content("Name: Spaghetti")
      expect(page).to have_content("Complexity: 2")
      expect(page).to have_content("Genre: Italian")
    end

    within "#recipes-#{possum_chili.id}" do
      expect(page).to have_content("Name: Possum Chili")
      expect(page).to have_content("Complexity: 3")
      expect(page).to have_content("Genre: Cajun")
    end

    within "#recipes-#{deep_fried_twinkie.id}" do
      expect(page).to have_content("Name: Deep Fried Twinks")
      expect(page).to have_content("Complexity: 4")
      expect(page).to have_content("Genre: Dessert")
    end
  end
end
