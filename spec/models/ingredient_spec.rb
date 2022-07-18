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

  describe 'class methods' do
    describe '#self.total_cost' do
      it 'adds the total cost of all recipes' do
        possum_chili = Recipe.create!(name: "Possum Chili", complexity: 3, genre: "Cajun")
        tomatoes = possum_chili.ingredients.create!(name: "Tomatoes", cost: 1)
        possum = possum_chili.ingredients.create!(name: "Possum", cost: 2)

        expect(possum_chili.ingredients.total_cost).to eq(3)
      end
    end
  end
end
