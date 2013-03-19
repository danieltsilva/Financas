require 'spec_helper'

describe "invoices/index" do
  before(:each) do
    assign(:invoices, [
      stub_model(Invoice,
        :number => "Number",
        :payment_method => "Payment Method",
        :amount => 1.5,
        :paid => false,
        :account => nil,
        :category => nil
      ),
      stub_model(Invoice,
        :number => "Number",
        :payment_method => "Payment Method",
        :amount => 1.5,
        :paid => false,
        :account => nil,
        :category => nil
      )
    ])
  end

  it "renders a list of invoices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Payment Method".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
