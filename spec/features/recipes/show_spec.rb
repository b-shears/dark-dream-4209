require 'rails_helper'

RSpec.describe 'Recipe Show Page' do
  it 'shows a list of the names of the ingredients the recipe has' do
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

    visit "/recipes/#{spaghetti.id}"
    expect(page).to have_content("Tomatoes")
  end
end
