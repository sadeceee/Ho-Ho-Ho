require 'rails_helper'

RSpec.describe "wishlists/new", type: :view do
  before(:each) do
    assign(:wishlist, Wishlist.new(
      :user_id => 1,
      :title => "MyString",
      :description => "MyText",
      :is_public => ""
    ))
  end

  it "renders new wishlist form" do
    render

    assert_select "form[action=?][method=?]", wishlists_path, "post" do

      assert_select "input#wishlist_user_id[name=?]", "wishlist[user_id]"

      assert_select "input#wishlist_title[name=?]", "wishlist[title]"

      assert_select "textarea#wishlist_description[name=?]", "wishlist[description]"

      assert_select "input#wishlist_is_public[name=?]", "wishlist[is_public]"
    end
  end
end
