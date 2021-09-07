require 'rails_helper'

RSpec.describe Chef do
  describe 'relationships' do
    it { should have_many(:dishes) }
    it { should have_many(:ingredients), through: :dishes }
  end
end
