require 'rails_helper'

RSpec.describe Chef do
  describe 'relationships' do
    it { should have_many(:dishes) }
  end

  describe 'attributes' do
    it "has a name" do
      chef1 = Chef.create!(name: "kevin")

      expect(chef1.name).to eq("kevin")
    end
  end
end
