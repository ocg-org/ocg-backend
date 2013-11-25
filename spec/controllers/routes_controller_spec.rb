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

  it "creates a route for the correct rock" do
    rock = FactoryGirl.create :rock

    page.visit "/rocks/#{rock.id}/routes/new"

    within("#new_route") do
      fill_in 'Name', :with => 'Alter Weg'
      fill_in 'Difficulty', :with => '2'
      fill_in 'Description', :with => 'Der Erste'
    end

    click_button "Create Route"
    expect(response).to be_success
    expect(page).to have_content "Route was successfully added"
  end

end
