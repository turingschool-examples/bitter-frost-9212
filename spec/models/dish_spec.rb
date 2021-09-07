require 'rails_helper'

RSpec.describe Dish do
  describe 'relationships' do
    it { should belong_to(:chef) }
    it { should have_many(:dishes_ingredients) }
    it { should have_many(:ingredients).through(:dishes_ingredients)}
  end
end
