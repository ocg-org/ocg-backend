require 'spec_helper'

describe "Routes Controller", :type => :feature do

  it "displays information for a route" do
    rock = FactoryGirl.create :rock
    r = FactoryGirl.create(:route, :name => "Snake dike",
                           :rock => rock,
                           :description => "Follow me!",
                           :difficulty => 5)
    r.material_list = "slings, express"
    r.save
    page.visit "/routes/#{r.id}"

    expect(page).to have_content "Snake dike"
    expect(page).to have_content "Follow me!"
    expect(page).to have_content "5"
    expect(page).to have_content "slings"
  end

  it "creates a route for the correct rock" do
    rock = FactoryGirl.create :rock

    page.visit "/rocks/#{rock.id}/routes/new"

    within("#new_route") do
      fill_in 'Name', :with => 'Alter Weg'
      fill_in 'Difficulty', :with => '2'
      fill_in 'Description', :with => 'Der Erste'
      fill_in 'Material', :with => 'slings, express'
    end

    click_button "Create Route"
    expect(response).to be_success
    expect(page).to have_content "Route was successfully created"
  end

  it "edits a route" do
    rock = FactoryGirl.create :rock
    r = FactoryGirl.create(:route, :name => "Snake dice",
                           :rock => rock,
                           :description => "Follow me!",
                           :difficulty => 5)
    page.visit "/routes/#{r.id}/edit"

    within(".edit_route") do
      fill_in 'Name', :with => "Snake dike"
    end

    click_button "Update Route"
    expect(response).to be_success
    expect(page).to have_content "Route was successfully updated"
  end

end
