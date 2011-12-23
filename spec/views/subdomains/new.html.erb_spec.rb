require 'spec_helper'

describe "subdomains/new.html.erb" do
  before(:each) do
    assign(:subdomain, stub_model(Subdomain).as_new_record)
  end

  it "renders new subdomain form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subdomains_path, :method => "post" do
    end
  end
end
