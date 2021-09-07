require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it {should have_many(:ingredient_dishes)}
    it {should have_many(:ingredients).through(:ingredient_dishes)}
  end
end
