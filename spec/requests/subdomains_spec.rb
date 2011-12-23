require 'spec_helper'

describe "Subdomains" do
  describe "GET /subdomains" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get subdomains_path
      response.status.should be(200)
    end
  end
end
