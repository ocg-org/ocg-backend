require 'spec_helper'

describe "Rocks Controller" do

  it "displays a rock" do
    FactoryGirl.create(:rock)

    page.visit '/rocks/1'
    expect(page).to have_content "myrock"
  end

  it "creates a rock in the correct region" do
    r = FactoryGirl.create(:region)
    visit "/regions/#{r.id}/rocks/new"

    within("#new_rock") do
      fill_in 'Name', :with => 'Domspitze'
    end

    click_button "Create Rock"
    expect(response).to be_success
    expect(page).to have_content "Rock was successfully created"
  end

  it "edits a rock" do
    r = FactoryGirl.create :rock

    page.visit "/rocks/#{r.id}/edit"

    within(".edit_rock") do
      fill_in 'Name', :with => 'Domspitze'
    end

    click_button "Update Rock"
    expect(response).to be_success
    expect(page).to have_content "Rock was successfully updated"
  end

  it "displays all routes for a rock" do
    r = FactoryGirl.create(:rock)
    FactoryGirl.create(:route, :name => "Between a rock", :rock => r)
    FactoryGirl.create(:route, :name => "And a hard place", :rock => r)

    page.visit "/rocks/#{r.id}"
    expect(page).to have_content "Between a rock"
    expect(page).to have_content "And a hard place"
  end

end
