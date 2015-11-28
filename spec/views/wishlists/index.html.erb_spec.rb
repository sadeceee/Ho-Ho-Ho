require 'rails_helper'

RSpec.describe "wishlists/index", type: :view do
  before(:each) do
    assign(:wishlists, [
      Wishlist.create!(
        :user_id => 1,
        :title => "Title",
        :description => "MyText",
        :is_public => ""
      ),
      Wishlist.create!(
        :user_id => 1,
        :title => "Title",
        :description => "MyText",
        :is_public => ""
      )
    ])
  end

  it "renders a list of wishlists" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
