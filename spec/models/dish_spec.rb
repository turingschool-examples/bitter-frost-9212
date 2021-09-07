require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it {should have_many :ingredients_dishes}
    it {should have_many(:ingredients).through(:ingredients_dishes)}
  end
end
