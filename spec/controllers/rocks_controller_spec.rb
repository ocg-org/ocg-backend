require 'spec_helper'

describe "Rocks Controller" do

  it "displays a rock" do
    FactoryGirl.create(:rock)

    page.visit '/rocks/1'
    expect(page).to have_content "myrock"
  end


end
