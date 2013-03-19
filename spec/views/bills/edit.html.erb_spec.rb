require 'spec_helper'

describe "bills/edit" do
  before(:each) do
    @bill = assign(:bill, stub_model(Bill,
      :number => "MyString",
      :payment_method => "MyString",
      :amount => 1.5,
      :paid => false,
      :account => nil,
      :category => nil
    ))
  end

  it "renders the edit bill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bill_path(@bill), "post" do
      assert_select "input#bill_number[name=?]", "bill[number]"
      assert_select "input#bill_payment_method[name=?]", "bill[payment_method]"
      assert_select "input#bill_amount[name=?]", "bill[amount]"
      assert_select "input#bill_paid[name=?]", "bill[paid]"
      assert_select "input#bill_account[name=?]", "bill[account]"
      assert_select "input#bill_category[name=?]", "bill[category]"
    end
  end
end
