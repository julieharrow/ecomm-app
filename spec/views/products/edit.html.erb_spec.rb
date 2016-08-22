require 'rails_helper'

RSpec.describe "products/edit.html.erb", type: :view do
  let(:product) {FactoryGirl.create(:product)}
  it "renders #edit with the correct dom elements" do
    assign(:product, product)
    render

    expect(rendered).to have_content("Edit All #{product.name.pluralize}")
    expect(rendered).to have_selector(".form-control")
  end
end
