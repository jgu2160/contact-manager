require 'rails_helper'

RSpec.describe "emails/new", type: :view do
  before(:each) do
    assign(:email, Email.new(
      :address => "MyText",
      :person => nil
    ))
  end

  it "renders new email form" do
    render

    assert_select "form[action=?][method=?]", emails_path, "post" do

      assert_select "textarea#email_address[name=?]", "email[address]"

      assert_select "input#email_person_id[name=?]", "email[person_id]"
    end
  end
end
