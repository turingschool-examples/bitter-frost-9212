require 'rails_helper'

describe 'chef show page' do
  before(:each) do
    @chef = Chef.create!(name: "Chef Khoi")
  end
  
  it 'has the name of the chef' do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@chef.name)
  end
end