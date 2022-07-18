require 'rails_helper'

RSpec.describe 'ingredients index page' do
  it 'has a list of the ingredients and the number of recipes each is used in' do
    spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
    possum_chili = Recipe.create!(name: "Possum Chili", complexity: 3, genre: "Cajun")
    deep_fried_twinkie = Recipe.create!(name: "Deep Fried Twinks", complexity: 4, genre: "Dessert")

    tomatoes = Ingredient.create!(name: "Tomatoes", cost: 1)
    possum = Ingredient.create!(name: "Possum", cost: 2)
    grease = Ingredient.create!(name: "Grease", cost: 3)

    recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: tomatoes.id)
    recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: possum_chili.id, ingredient_id: tomatoes.id)
    recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: possum_chili.id, ingredient_id: possum.id)
    recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: deep_fried_twinkie.id, ingredient_id: grease.id)

    visit "/ingredients"
    expect(page).to have_content("Tomatoes")
    expect(page).to have_content(2)
    expect(page).to have_content("Possum")
    expect(page).to have_content(1)
    expect(page).to have_content("Grease")


  end
end
