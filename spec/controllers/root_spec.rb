require 'spec_helper'

describe "Root", :type => :feature do

  it "displays the root regions as homepage" do
    FactoryGirl.create(:region, :name => "Europe")
    FactoryGirl.create(:region, :name => "America")

    page.visit '/'
    expect(page).to have_content "Europe"
    expect(page).to have_content "America"
  end

end
