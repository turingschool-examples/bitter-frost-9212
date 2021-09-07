require 'rails_helper'

RSpec.describe IngredientsDish, type: :model do
  describe "relationships" do
    it {should belong_to :ingredients}
    it {should belong_to :dish}
  end
end
