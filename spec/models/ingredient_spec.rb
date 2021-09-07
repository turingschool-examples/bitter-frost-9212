require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it { should have_many(:dishes).through(:dish_ingredients) }
end
