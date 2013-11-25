require 'spec_helper'

describe "Routes Controller", :type => :feature do

  it "displays information for a route" do
    rock = FactoryGirl.create :rock
    r = FactoryGirl.create(:route, :name => "Snake dike",
                           :rock => rock,
                           :description => "Follow me!",
                           :difficulty => 5)
    page.visit "/routes/#{r.id}"

    expect(page).to have_content "Snake dike"
    expect(page).to have_content "Follow me!"
    expect(page).to have_content "5"
  end

end
