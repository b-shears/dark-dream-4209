require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many(:recipe_ingredients)}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'model methods' do
    it "#recipe_count" do
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      possum_chili = Recipe.create!(name: "Possum Chili", complexity: 3, genre: "Cajun")
      deep_fried_twinkie = Recipe.create!(name: "Deep Fried Twinks", complexity: 4, genre: "Dessert")

      ingredient = Ingredient.create!(name: "Tomatoes", cost: 1)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: ingredient.id)
      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: possum_chili.id, ingredient_id: ingredient.id)
      expect(ingredient.recipe_count).to eq(2)
    end
  end
end
