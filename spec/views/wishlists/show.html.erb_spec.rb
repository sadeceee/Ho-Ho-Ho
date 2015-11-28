require 'rails_helper'

RSpec.describe "wishlists/show", type: :view do
  before(:each) do
    @wishlist = assign(:wishlist, Wishlist.create!(
      :user_id => 1,
      :title => "Title",
      :description => "MyText",
      :is_public => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
