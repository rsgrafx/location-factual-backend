require 'spec_helper'

describe 'Places Routing spec' do
  
  it "routes to #create" do
    expect( get( "api/v1/places.json") ).to  route_to("api/v1/places#index", format: 'json')
  end


end