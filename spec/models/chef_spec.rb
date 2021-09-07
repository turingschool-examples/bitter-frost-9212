require 'rails_helper'

RSpec.describe Chef do
  describe 'relationships' do
    it { should have_many(:dishes) }
  end
end
