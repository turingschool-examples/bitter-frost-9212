require 'rails_helper'

RSpec.describe Ingredients, type: :model do
  describe "relationships" do
    it {should have_many :ingredients_dishes}
    it {should have_many(:dishes).through(:ingredients_dishes)}
  end
end
