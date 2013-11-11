require 'spec_helper'

describe "Regions Controller", :type => :feature do

  it "displays all top level regions" do
    FactoryGirl.create(:region, :name => "Europe")
    FactoryGirl.create(:region, :name => "Asia")

    page.visit '/regions'
    expect(page).to have_content "Europe"
    expect(page).to have_content "Asia"
  end

  it "creates a region" do
    visit '/regions/new'
    within("#new_region") do
      fill_in 'Name', :with => 'Europe'
    end

    click_button "Create Region"
    expect(response).to be_success
    expect(page).to have_content "Region was successfully created"
  end

  it "displays child regions" do
    r = FactoryGirl.create(:region, :name => "Europe")
    FactoryGirl.create(:region, :name => "Germany", :parent_region => r)

    page.visit '/regions/1'
    expect(page).to have_content "Germany"
  end

  it "displays child rocks" do
    r = FactoryGirl.create(:region, :name => "Schrammsteine")
    FactoryGirl.create(:rock, :name => "Kleiner Dom", :region => r)

    page.visit '/regions/1'
    expect(page).to have_content "Kleiner Dom"
  end

end
