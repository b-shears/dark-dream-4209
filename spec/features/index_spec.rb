require 'rails_helper'

RSpec.describe 'recipe index page'  do

  it 'displays a list of recipes with attributes' do
    spaghetti = Recipe.create!(Name: "Spaghetti", Complexity: 2, Genre: "Italian")
    possum_chili = Recipe.create!(Name: "Possum Chili", Complexity: 3, Genre: "Cajun")
    deep_fried_twinkie = Recipe.create!(Name: "Deep Fried Twinks", Complexity: 4, Genre: "Dessert")

    visit '/recipes'

    within "#recipes-#{spaghetti.id}" do
      expect(page).to have_content("Name: Spaghetti")
      expect(page).to have_content("Complexity: 2")
      expect(page).to have_content("Genre: Cajun")
    end

    within "#recipes-#{possum_chili.id}" do
      expect(page).to have_content("Name: Spaghetti")
      expect(page).to have_content("Complexity: 2")
      expect(page).to have_content("Genre: Italian")
    end

    within "#recipes-#{deep_fried_twinkie.id}" do
      expect(page).to have_content("Name: Deep Fried Twinks")
      expect(page).to have_content("Complexity: 4")
      expect(page).to have_content("Genre: Dessert")
    end
  end
end
