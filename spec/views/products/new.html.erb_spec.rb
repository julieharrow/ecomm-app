require 'rails_helper'

RSpec.describe "products/new.html.erb", type: :view do
  it "renders the new action with dom elements" do
    @product = Product.new
    render
    expect(rendered).to have_content("New Product")  #'have_content' capybara syntax for HTML
    expect(rendered).to have_selector(".form-control")  #'have_selector' capybara syntax for CSS
  end
end
