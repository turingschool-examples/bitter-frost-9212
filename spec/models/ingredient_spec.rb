require 'rails_helper'

describe Ingredient do
  describe 'relationships' do
    it { should have_many(:dishes).through(:dish_ingredients)}
  end
end