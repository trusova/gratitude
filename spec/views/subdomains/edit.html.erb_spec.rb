require 'spec_helper'

describe "subdomains/edit.html.erb" do
  before(:each) do
    @subdomain = assign(:subdomain, stub_model(Subdomain))
  end

  it "renders the edit subdomain form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subdomains_path(@subdomain), :method => "post" do
    end
  end
end
