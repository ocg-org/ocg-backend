require 'spec_helper'

describe "Route" do
  it "does not save without a rock" do
    r = Route.create
    r.name = "route 1"
    r.rock = nil
    assert !r.save, "Route should not be saved without a rock"
  end
end
